import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/global_widgets/dialog/place_verification_dialog.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import 'package:withconi/module/ui_model/review_detail_ui_model.dart';
import '../../../core/error_handling/failures.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/dialog/selection_dialog.dart';
import '../../../global_widgets/snackbar.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../../ui_model/place_ui_model/abstract_class/place_preview_ui.dart';

class MapEditReviewController extends GetxController {
  MapEditReviewController(this._mapRepository);
  final MapRepository _mapRepository;

  late final ReviewDetailUIModel previousReview;
  late Rx<PlacePreviewUiModel> placePreview;
  RxBool isLoading = false.obs;
  final RxBool validatePostButton = false.obs;
  RxBool showDiseaseTypeSection = false.obs;
  RxBool showReviewItemSection = false.obs;
  RxBool showReviewRateSection = false.obs;
  TextEditingController textController = TextEditingController();
  RxList<DiseaseUIModel> selectedDiseaseList = RxList<DiseaseUIModel>();
  RxSet<DiseaseType> selectedDiseaseTypeSet = RxSet<DiseaseType>();
  RxList<ConimalUIModel> selectedConimalList = RxList<ConimalUIModel>();
  ScrollController scrollController = ScrollController();
  Rxn<ReviewRate> selectedReviewRate = Rxn<ReviewRate>();
  RxList<ReviewItem> selectedReviewItems = RxList<ReviewItem>();
  late List<ConimalUIModel> conimalOptionList;

  RxString diseaseText = ''.obs;
  RxString diseaseSuffixText = ''.obs;
  RxBool isDiseaseSelected = false.obs;

  @override
  onInit() {
    super.onInit();

    _initReviewToEdit();
  }

  @override
  onReady() {
    super.onReady();
    ever(selectedDiseaseList, changeDiseaseTypeList);
    ever(selectedReviewRate, (_) => selectedReviewItems.clear());
  }

  @override
  onClose() async {
    super.onClose();
    scrollController.dispose();
  }

  _initReviewToEdit() {
    isLoading.value = true;
    previousReview = Get.arguments as ReviewDetailUIModel;
    placePreview = Rx<PlacePreviewUiModel>(previousReview.placePreview!);
    conimalOptionList = previousReview.conimals;
    selectedConimalList = previousReview.conimals.obs;
    selectedDiseaseList = previousReview.diseaseList.obs;
    selectedDiseaseTypeSet = previousReview.diseaseTypes.toSet().obs;
    selectedReviewItems = previousReview.reviewItems.obs;
    selectedReviewRate.value = previousReview.reviewRate;
    isLoading.value = false;
  }

  changeDiseaseTypeList(List<DiseaseUIModel> _changedDiseaseList) {
    selectedDiseaseTypeSet.clear();
    _changedDiseaseList.forEach((element) {
      if (selectedDiseaseTypeSet.contains(element.diseaseType)) {
      } else {
        selectedDiseaseTypeSet.add(element.diseaseType);
      }
    });
  }

  Future<void> getBack() async {
    bool isConfirmed = await showSelectionDialog(
        cancleText: '아니요',
        confirmText: '네',
        title: '수정을 그만할까요?',
        subtitle: '수정된 정보는 사라집니다');
    if (isConfirmed) {
      Get.back();
    }
  }

  onConimalSelected(ConimalUIModel conimal) {
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

  onReviewItemSelected(ReviewItem item) {
    if (selectedReviewItems.contains(item)) {
      selectedReviewItems.remove(item);
    } else {
      selectedReviewItems.add(item);
    }
    selectedReviewItems.refresh();
  }

  validateButton() {
    if (selectedConimalList.isNotEmpty &&
        selectedDiseaseTypeSet.isNotEmpty &&
        selectedReviewRate.value != null &&
        selectedReviewItems.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  searchDisease() async {
    List<DiseaseUIModel>? result =
        await Get.toNamed(Routes.DISEASE_SEARCH, arguments: [
      DiseaseUIModel(
          name: '질병입니다다다다다 다라다라 다',
          diseaseType: DiseaseType.musculoskeletal,
          advice: '',
          code: '',
          definition: '',
          diagnosisTechnique: '',
          symptomGroup: [],
          treatment: '')
    ]) as List<DiseaseUIModel>?;

    if (result != null) {
      selectedDiseaseList.assignAll(result);
      onSelectedDiseaseListChanged(selectedDiseaseList);
    }
  }

  onSelectedDiseaseListChanged(List<DiseaseUIModel> newDiseaseList) {
    if (newDiseaseList.isEmpty) return;
    selectedDiseaseTypeSet.clear();
    setSelectedDiseaseText(newDiseaseList);

    // if (selectedDiseaseTypeList.isEmpty) {
    //   selectedDiseaseTypeList.assignAll(
    //       newDiseaseList.map((element) => element.diseaseType!).toList());
    //   scrollController.animateTo(400,
    //       duration: const Duration(milliseconds: 200), curve: Curves.linear);
    // } else {
    //   newDiseaseList.forEach((newDisease) {
    //     if (!selectedDiseaseTypeList
    //         .any((selectedType) => selectedType == newDisease.diseaseType)) {
    //       selectedDiseaseTypeList.add(newDisease.diseaseType!);
    //     }
    //   });
    // }

    selectedDiseaseTypeSet.assignAll(
        newDiseaseList.map((element) => element.diseaseType).toList());
    scrollController.animateTo(400,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
    if (selectedDiseaseTypeSet.isNotEmpty) {
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

  setSelectedDiseaseText(List<DiseaseUIModel> diseaseInfo) {
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
    if (selectedDiseaseTypeSet.isEmpty) {
      scrollController.animateTo(400,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
    if (selectedDiseaseTypeSet.contains(diseaseType)) {
      if (selectedDiseaseList
          .any((element) => element.diseaseType == diseaseType)) {
        showCustomSnackbar(text: '등록한 질병의 문제는 삭제할 수 없어요');
      } else {
        selectedDiseaseTypeSet.remove(diseaseType);
      }
    } else {
      if (selectedDiseaseTypeSet.length < 3) {
        selectedDiseaseTypeSet.add(diseaseType);
      } else {
        showCustomSnackbar(text: '문제는 3개까지만 추가 가능합니다');
      }
    }
    if (selectedDiseaseTypeSet.isNotEmpty) {
      showReviewRateSection.value = true;
    } else {
      showReviewRateSection.value = false;
    }
  }

  onReviewRateChanged(ReviewRate reviewRate) {
    if (selectedReviewRate.value == null) {
      showReviewItemSection.value = true;
      scrollController.animateTo(700,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
    selectedReviewRate.value = reviewRate;
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
    placePreview.value.visitVerified = await showPlaceVerificationDialog(
      title: '장소에 해당하는 사진을 골라주세요',
      context: context,
    );

    placePreview.refresh();
  }

  createNewReview() async {
    late bool createReviewSucceed;
    Either<Failure, String> newReviewEither = await showLoading(() =>
        _mapRepository.createPlaceReview(reviewUIModel: _makeNewReviewModel()));

    createReviewSucceed = newReviewEither.fold((fail) {
      FailureInterpreter().mapFailureToSnackbar(fail, 'createNewPostDB');
      return false;
    }, (newReview) {
      return true;
    });

    if (createReviewSucceed) {
      await AuthController.to.setUserInfo();
      Get.back();
      return;
    }
  }

  ReviewDetailUIModel _makeNewReviewModel() {
    return ReviewDetailUIModel(
        conimals: selectedConimalList,
        diseaseTypes: selectedDiseaseTypeSet.toList(),
        reviewItems: selectedReviewItems,
        reviewRate: selectedReviewRate.value,
        diseaseList: selectedDiseaseList,
        placePreview: placePreview.value,
        reviewDesc: '');
  }
}
