import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/data/model/abstract_class/place_type.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/image_repository.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/data/repository/user_repository.dart';
import 'package:withconi/ui/entities/place_verfication.dart';
import 'package:withconi/ui/widgets/dialog/place_verification_dialog.dart';
import 'package:withconi/ui/widgets/loading.dart';
import '../../configs/helpers/image_picker_helper.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../../ui/entities/review_rate_entity.dart';
import '../../ui/theme/text_theme.dart';
import '../../ui/widgets/dialog/selection_dialog.dart';
import '../../ui/widgets/snackbar.dart';
import '../ui_interpreter/failure_ui_interpreter.dart';

class MapReviewController extends GetxController {
  // final CommunityRepository _communityRepository = CommunityRepository();
  final MapRepository _mapRepository = MapRepository();

  final UserRepository _userRepository = UserRepository();
  final List<PostType> postType = [PostType.cat, PostType.dog];
  final Rxn<PostType> selectedPostType = Rxn<PostType>();
  final int maxImageNum = 4;
  final RxInt selectedImageNum = 0.obs;
  final RxList<File> imageFileList = <File>[].obs;
  late PlacePreview place;
  final RxBool validatePostButton = false.obs;
  // Rxn<ReviewRate> selectedReviewRate = Rxn<ReviewRate>();
  Rxn<ReviewEntity> selectedReviewEntity = Rxn<ReviewEntity>();
  // RxList<ReviewItems> selectedReviewItemList = RxList<ReviewItems>();
  RxList<Conimal> selectedConimalList = RxList<Conimal>();
  RxList<DiseaseType> selectedDiseaseTypeList = RxList<DiseaseType>();
  RxBool showDiseaseTypeSection = false.obs;
  RxBool showReviewItemSection = false.obs;
  RxBool showReviewRateSection = false.obs;
  TextEditingController textController = TextEditingController();
  List<ReviewEntity> reviewRateEntities = [
    HighReviewEntity(selectedReviewItems: []),
    MiddleReviewEntity(selectedReviewItems: []),
    LowReviewEntity(selectedReviewItems: [])
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
  Rxn<PlaceVerificationEntity> placeVerification =
      Rxn<PlaceVerificationEntity>();

  @override
  Future<void> onInit() async {
    super.onInit();
    place = Get.arguments as PlacePreview;
    await getPlaceVerification(locId: place.locId, placeType: place.placeType);
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
    // if (selectedReviewItemList.contains(item)) {
    //   selectedReviewItemList.remove(item);

    // } else {
    //   selectedReviewItemList.add(item);
    // }

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

  onReviewRateChanged(ReviewEntity reviewRateEntity) {
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

  getPlaceVerification(
      {required String locId, required PlaceType placeType}) async {
    Either<Failure, PlaceVerificationEntity> placeVerificationResult =
        await _mapRepository.getPlaceVerification(
            locId: locId, placeType: placeType);

    placeVerificationResult.fold(
        (failure) => FailureInterpreter()
            .mapFailureToSnackbar(failure, 'getPlaceVerification'),
        (verification) => placeVerification.value = verification);
  }

  verifyPlaceVisit({required BuildContext context}) async {
    placeVerification.value = await showPlaceVerificationDialog(
      title: '장소에 해당하는 사진을 골라주세요',
      previousVerification: placeVerification.value!,
      context: context,
    );

    visitVerified.value = placeVerification.value!.verified;
    print(placeVerification.value!.verified);
  }

  createNewReview() async {
    showLoading(() async {
      Either<Failure, String> newReviewEither =
          await _mapRepository.createReview(
              conimals: selectedConimalList,
              diseaseTypes: selectedDiseaseTypeList,
              placeId: place.locId,
              reviewEntity: selectedReviewEntity.value!,
              userId: AuthController.to.wcUser.value!.uid,
              visitVerified: visitVerified.value);
      bool createReviewSucceed = newReviewEither.fold((fail) {
        FailureInterpreter().mapFailureToSnackbar(fail, 'createNewPostDB');
        return false;
      }, (newReview) {
        return true;
      });

      if (createReviewSucceed) {
        bool updateUserSucceed = await _updateUser();
        if (updateUserSucceed) {
          await AuthController.to.setUserInfo(redirectPage: false);
          Get.back();
        }
        return;
      } else {
        return;
      }
    });
  }

  _updateUser() async {
    Either<Failure, bool> updateUserEither =
        await _userRepository.updateUser(updateData: {'isWrittenReview': true});

    bool updateSucceed = updateUserEither.fold((fail) {
      FailureInterpreter().mapFailureToSnackbar(fail, 'createNewPostDB');
      return false;
    }, (r) => true);
    return updateSucceed;
  }
}
