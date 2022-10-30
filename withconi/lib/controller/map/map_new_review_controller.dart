import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/data/model/abstract_class/place_preview.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/data/model/hospital_preview.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/image_repository.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/data/repository/user_repository.dart';
import 'package:withconi/module/ui_model/place_verfication.dart';
import 'package:withconi/module/pages/map/map_place_verification_page.dart';
import 'package:withconi/module/widgets/dialog/place_verification_dialog.dart';
import 'package:withconi/module/widgets/loading/loading_overlay.dart';
import '../../core/tools/helpers/image_picker_helper.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../../module/ui_model/review_ui_class.dart';
import '../../module/theme/text_theme.dart';
import '../../module/widgets/dialog/selection_dialog.dart';
import '../../module/widgets/snackbar.dart';
import '../ui_interpreter/failure_ui_interpreter.dart';

class MapNewReviewController extends GetxController {
  // final CommunityRepository _communityRepository = CommunityRepository();
  final MapRepository _mapRepository = MapRepository();
  final UserRepository _userRepository = UserRepository();
  final List<PostType> postType = [PostType.cat, PostType.dog];
  final Rxn<PostType> selectedPostType = Rxn<PostType>();
  final int maxImageNum = 4;
  final RxInt selectedImageNum = 0.obs;
  final RxList<File> imageFileList = <File>[].obs;
  late String _placeId;
  late String _userId;
  late Rx<PlacePreview> reviewPlace;
  RxBool isLoading = false.obs;
  final RxBool validatePostButton = false.obs;
  // Rxn<ReviewRate> selectedReviewRate = Rxn<ReviewRate>();
  Rxn<ReviewUIClassImpl> selectedReviewEntity = Rxn<ReviewUIClassImpl>();
  // RxList<ReviewItems> selectedReviewItemList = RxList<ReviewItems>();
  // late Rx<PlacePreview> preview;
  RxList<Conimal> selectedConimalList = RxList<Conimal>();
  List<Disease> selectedDiseaseList = [];
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
    DiseaseType.oncology,
    DiseaseType.infectiousDisease,
    DiseaseType.otorhinolaryngology,
    DiseaseType.dentistry,
    DiseaseType.brainNeurology,
    DiseaseType.dermatology,
    DiseaseType.endocrinology,
    DiseaseType.emergency,
    DiseaseType.cardiovascular,
    DiseaseType.digestive,
    DiseaseType.musculoskeletal,
    DiseaseType.ophthalmology,
    DiseaseType.respiratory,
    DiseaseType.urinary,
  ];
  // Rxn<VerificationGroup> placeVerification = Rxn<VerificationGroup>();
  RxBool isPlaceVerified = false.obs;

  RxString diseaseText = ''.obs;
  RxString diseaseSuffixText = ''.obs;
  RxBool isDiseaseSelected = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // _userId = AuthController.to.wcUser.value!.uid;
    // _placeId = Get.arguments as String;
    // await _setPlaceToReview(_placeId);
    await _initPlaceToReview();
  }

  @override
  onClose() async {
    super.onClose();
    scrollController.dispose();
  }

  _initPlaceToReview() async {
    isLoading.value = true;
    _userId = AuthController.to.wcUser.value!.uid;
    _placeId = Get.arguments as String;
    await onPlaceChanged(await _getPlacePreview(_userId, _placeId));
    isLoading.value = false;
  }

  onPlaceChanged(PlacePreview? placePreview) async {
    if (placePreview != null) {
      reviewPlace = placePreview.obs;
      // await setPlaceVerification(reviewPlace.value);
    }
  }

  Future<PlacePreview?> _getPlacePreview(String userId, String placeId) async {
    final placePreviewEither = await _mapRepository.getPlacePreviewById(
        userId: userId, locId: placeId);

    PlacePreview? newPreview = placePreviewEither.fold((fail) {
      FailureInterpreter().mapFailureToSnackbar(fail, '_getPostList');
      return;
    }, (placePreview) {
      return placePreview;
    });

    return newPreview;
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

  searchNewPlaceToReview() async {
    PlacePreview? newPlace =
        await Get.toNamed(Routes.MAP_SEARCH) as PlacePreview?;
    if (newPlace != null) {
      onPlaceChanged(newPlace);
      return;
    }
  }

  searchDisease() async {
    List<Disease>? result = await Get.toNamed(Routes.DISEASE_ADD, arguments: [
      Disease(
          createdAt: DateTime.now(),
          code: 'code',
          name: '질병입니다다다다다 다라다라 다',
          symptomGroups: [],
          diseaseType: DiseaseType.musculoskeletal)
    ]) as List<Disease>?;

    if (result != null) {
      selectedDiseaseList.assignAll(result);
    }

    selectedDiseaseList.assignAll([
      Disease(
          createdAt: DateTime.now(),
          code: 'code',
          name: '질병입니다다다다다 다라다라 다',
          diseaseType: DiseaseType.musculoskeletal)
    ]);

    onSelectedDiseaseListChanged(selectedDiseaseList);
  }

  onSelectedDiseaseListChanged(List<Disease> newDiseaseList) {
    if (newDiseaseList.isEmpty) return;

    setSelectedDiseaseText(selectedDiseaseList);

    if (selectedDiseaseTypeList.isEmpty) {
      selectedDiseaseTypeList.assignAll(
          newDiseaseList.map((element) => element.diseaseType!).toList());
      scrollController.animateTo(400,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    } else {
      newDiseaseList.forEach((newDisease) {
        if (!selectedDiseaseTypeList
            .any((selectedType) => selectedType == newDisease.diseaseType)) {
          selectedDiseaseTypeList.add(newDisease.diseaseType!);
        }
      });
    }
    if (selectedDiseaseTypeList.isNotEmpty) {
      showReviewRateSection.value = true;
    } else {
      showReviewRateSection.value = false;
    }
  }

  // setDiseaseTypeList(List<Disease> newDiseaseList) {
  //   newDiseaseList.forEach((disease) {
  //     onSelectedDiseaseTypeListChanged(disease.diseaseType!);
  //   });

  //   // selectedDiseaseTypeList.refresh();
  // }

  setSelectedDiseaseText(List<Disease> diseaseInfo) {
    if (diseaseInfo.isNotEmpty) {
      isDiseaseSelected.value = true;
      if (diseaseInfo.length > 1) {
        diseaseText.value = diseaseInfo[0].name.substring(0, 10);
        diseaseSuffixText.value = ' 외 ${diseaseInfo.length - 1}개';
      } else {
        diseaseText.value = diseaseInfo[0].name.substring(0, 10);
        diseaseSuffixText.value = '';
      }
    } else {
      isDiseaseSelected.value = false;
    }
  }

  onSelectedDiseaseTypeListChanged(DiseaseType diseaseType) {
    if (selectedDiseaseTypeList.isEmpty) {
      scrollController.animateTo(400,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
    if (selectedDiseaseTypeList.contains(diseaseType)) {
      if (selectedDiseaseList
          .any((element) => element.diseaseType == diseaseType)) {
        showCustomSnackbar(text: '등록한 질병의 문제는 삭제할 수 없어요');
      } else {
        selectedDiseaseTypeList.remove(diseaseType);
      }
    } else {
      if (selectedDiseaseTypeList.length < 3) {
        selectedDiseaseTypeList.add(diseaseType);
      } else {
        showCustomSnackbar(text: '문제는 3개까지만 추가 가능합니다');
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

  // setPlaceVerification(PlacePreview placeToReview) async {
  //   Either<Failure, VerificationGroup> placeVerificationResult =
  //       await _mapRepository.getPlaceVerification(
  //           locId: placeToReview.locId, placeType: placeToReview.placeType);

  //   placeVerificationResult.fold(
  //       (failure) => FailureInterpreter().mapFailureToSnackbar(
  //           failure, 'getPlaceVerification'), (verification) {
  //     placeVerification.value = verification;
  //   });
  // }

  verifyPlaceVisit({required BuildContext context}) async {
    isPlaceVerified.value = await showPlaceVerificationDialog(
      title: '장소에 해당하는 사진을 골라주세요',
      // previousVerification: placeVerification.value!,
      context: context,
    );
    // placeVerification.refresh();

    // Get.to(MapPlaceVerificationPage(), fullscreenDialog: true);
  }

  createNewReview() async {
    late bool createReviewSucceed;
    Either<Failure, String> newReviewEither =
        await showLoading(() => _mapRepository.createPlaceReview(
              conimals: selectedConimalList,
              diseaseTypes: selectedDiseaseTypeList,
              place: reviewPlace.value,
              reviewEntity: selectedReviewEntity.value!,
              userId: AuthController.to.wcUser.value!.uid,
            ));

    createReviewSucceed = newReviewEither.fold((fail) {
      FailureInterpreter().mapFailureToSnackbar(fail, 'createNewPostDB');
      return false;
    }, (newReview) {
      return true;
    });

    if (createReviewSucceed) {
      await AuthController.to.setUserInfo(redirectPage: false);
      Get.back();
      return;
    }
  }
}
