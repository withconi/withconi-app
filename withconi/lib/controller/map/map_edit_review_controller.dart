import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/data/model/abstract_class/place_preview.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/image_repository.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/data/repository/user_repository.dart';
import 'package:withconi/module/ui_model/place_verfication.dart';
import 'package:withconi/module/widgets/dialog/place_verification_dialog.dart';
import 'package:withconi/module/widgets/loading/loading_overlay.dart';
import '../../core/tools/helpers/image_picker_helper.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../data/model/post.dart';
import '../../data/model/review.dart';
import '../../import_basic.dart';
import '../../module/ui_model/review_ui_class.dart';
import '../../module/theme/text_theme.dart';
import '../../module/widgets/dialog/selection_dialog.dart';
import '../../module/widgets/snackbar.dart';
import '../ui_interpreter/failure_ui_interpreter.dart';

class MapEditReviewController extends GetxController {
  // final CommunityRepository _communityRepository = CommunityRepository();
  final MapRepository _mapRepository = MapRepository();
  final UserRepository _userRepository = UserRepository();
  final List<PostType> postType = [PostType.cat, PostType.dog];
  final Rxn<PostType> selectedPostType = Rxn<PostType>();
  final int maxImageNum = 4;
  final RxInt selectedImageNum = 0.obs;
  final RxList<File> imageFileList = <File>[].obs;

  final RxBool validatePostButton = false.obs;
  late String _reviewId;
  late String _userId;
  late Rx<Review> review;
  late PlacePreview place;
  Rxn<ReviewUIClassImpl> selectedReviewEntity = Rxn<ReviewUIClassImpl>();
  RxList<Conimal> selectedConimalList = RxList<Conimal>();
  RxList<DiseaseType> selectedDiseaseTypeList = RxList<DiseaseType>();
  RxBool showDiseaseTypeSection = false.obs;
  RxBool showReviewItemSection = false.obs;
  RxBool showReviewRateSection = false.obs;
  TextEditingController textController = TextEditingController();
  List<ReviewUIClassImpl> reviewRateEntities = [
    HighReviewUIClass(selectedReviewItems: []),
    MiddleReviewUIClass(selectedReviewItems: []),
    LowReviewUIClass(selectedReviewItems: [])
  ];
  ScrollController scrollController = ScrollController();

  List<DiseaseType> diseaseTypeList = [
    DiseaseType.cardiovascular,
    DiseaseType.digestive,
    DiseaseType.musculoskeletal,
    DiseaseType.ophthalmology,
    DiseaseType.respiratory,
    DiseaseType.urinary,
  ];

  RxBool visitVerified = false.obs;
  Rxn<VerificationGroup> placeVerification = Rxn<VerificationGroup>();

  @override
  Future<void> onInit() async {
    super.onInit();
    _reviewId = Get.arguments as String;
    _userId = AuthController.to.wcUser.value!.uid;
    await _initData();
  }

  _initData() async {
    try {
      Review? newReview = await _getMyReview(_userId, _reviewId);
      if (newReview != null) {
        review = newReview.obs;
      }
      PlacePreview? preview =
          await _getPlacePreview(_userId, review.value.placeId);
      if (preview != null) {
        place = preview;
      }
      await _setPlaceVerification();
    } catch (e) {
      print('수정할 리뷰 불러오기 실패');
    }
  }

  void onPostTypeChanged(PostType postType) {
    selectedPostType.value = postType;
  }

  Future<void> getBack() async {
    bool isConfirmed = await showSelectionDialog(
        cancleText: '아니요',
        confirmText: '네',
        title: '리뷰를 그만쓸까요?',
        subtitle: '작성된 리뷰는 모두 사라집니다');
    if (isConfirmed) {
      Get.back();
    }
  }

  onConimalSelected(Conimal conimal) {
    if (selectedConimalList.contains(conimal)) {
      selectedConimalList.remove(conimal);
    } else {
      selectedConimalList.add(conimal);
    }
    if (selectedConimalList.isNotEmpty) {
      showDiseaseTypeSection.value = true;
    } else {
      showDiseaseTypeSection.value = false;
    }
  }

  onReviewItemSelected(ReviewItems item) {
    if (selectedReviewEntity.value!.selectedReviewItems.contains(item)) {
      selectedReviewEntity.value!.selectedReviewItems.remove(item);
    } else {
      selectedReviewEntity.value!.selectedReviewItems.add(item);
    }
    selectedReviewEntity.refresh();
  }

  validateButton() {
    if (selectedConimalList.isNotEmpty &&
        selectedDiseaseTypeList.isNotEmpty &&
        selectedReviewEntity.value != null &&
        selectedReviewEntity.value!.selectedReviewItems.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  onDiseaseTypeSelected(DiseaseType diseaseType) {
    if (selectedDiseaseTypeList.isEmpty) {
      scrollController.animateTo(400,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
    if (selectedDiseaseTypeList.contains(diseaseType)) {
      selectedDiseaseTypeList.remove(diseaseType);
    } else {
      if (selectedDiseaseTypeList.length < 3) {
        selectedDiseaseTypeList.add(diseaseType);
      }
    }
    if (selectedDiseaseTypeList.isNotEmpty) {
      showReviewRateSection.value = true;
    } else {
      showReviewRateSection.value = false;
    }
  }

  onReviewRateChanged(ReviewUIClassImpl reviewRateEntity) {
    if (selectedReviewEntity.value != null) {
      selectedReviewEntity.value!.selectedReviewItems.clear();
    }

    if (selectedReviewEntity.value == null) {
      scrollController.animateTo(700,
          duration: Duration(milliseconds: 200), curve: Curves.linear);
    }
    selectedReviewEntity.value = reviewRateEntity;
    showReviewItemSection.value = true;
  }

  Future<void> onCreateButtonTap() async {
    if (selectedPostType.value == null) {
      return FailureInterpreter()
          .mapFailureToSnackbar(NoPostTypeSelectedFailure(), 'addNewPost');
    } else if (textController.text.isEmpty) {
      return FailureInterpreter()
          .mapFailureToSnackbar(NoPostContentsFailure(), 'addNewPost');
    } else {
      bool isConfirmed = await showSelectionDialog(
        cancleText: '아니요',
        confirmText: '네',
        title: '글을 남길까요?',
      );

      if (isConfirmed) {
        // createNewPostDB();
      }
    }
  }

  _setPlaceVerification() async {
    Either<Failure, VerificationGroup> placeVerificationResult =
        await _mapRepository.getPlaceVerification(
            locId: review.value.placeId, placeType: review.value.placeType);

    placeVerificationResult.fold(
        (failure) => FailureInterpreter()
            .mapFailureToSnackbar(failure, 'getPlaceVerification'),
        (verification) => placeVerification.value = verification);
  }

  verifyPlaceVisit({required BuildContext context}) async {
    await showPlaceVerificationDialog(
      title: '장소에 해당하는 사진을 골라주세요',
      context: context,
    );

    visitVerified.value = placeVerification.value!.verified;
    print(placeVerification.value!.verified);
  }

  Future<Review?> _getMyReview(String userId, String reviewId) async {
    final reviewDetailEither = await _mapRepository.getReviewDetail(
        userId: userId, reviewId: reviewId);

    Review? review = reviewDetailEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, '_getPostList'),
        (placeReview) {
      return placeReview;
    });
    return review;
  }

  Future<PlacePreview?> _getPlacePreview(String userId, String placeId) async {
    final placePreviewEither = await _mapRepository.getPlacePreviewById(
        userId: userId, locId: placeId);

    PlacePreview? preview = placePreviewEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, '_getPostList'),
        (placePreview) {
      return placePreview;
    });
    return preview;
  }

  createNewReview() async {
    // showLoading(() async {
    //   Either<Failure, String> newReviewEither =
    //       await _mapRepository.createReview(
    //           conimals: selectedConimalList,
    //           diseaseTypes: selectedDiseaseTypeList,
    //           placeId: place.locId,
    //           reviewEntity: selectedReviewEntity.value!,
    //           userId: AuthController.to.wcUser.value!.uid,
    //           visitVerified: visitVerified.value);
    //   bool createReviewSucceed = newReviewEither.fold((fail) {
    //     FailureInterpreter().mapFailureToSnackbar(fail, 'createNewPostDB');
    //     return false;
    //   }, (newReview) {
    //     return true;
    //   });

    //   if (createReviewSucceed) {
    //     bool updateUserSucceed = await _updateUser();
    //     if (updateUserSucceed) {
    //       await AuthController.to.setUserInfo(redirectPage: false);
    //       Get.back();
    //     }
    //     return;
    //   } else {
    //     return;
    //   }
    // });
  }
}
