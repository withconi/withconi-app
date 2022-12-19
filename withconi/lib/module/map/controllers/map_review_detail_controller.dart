import 'package:dartz/dartz.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import 'package:withconi/module/ui_model/review_detail_ui_model.dart';
import '../../../core/error_handling/failures.dart';
import '../../../global_widgets/photo_gallary/image_item.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/dialog/selection_dialog.dart';
import '../../../global_widgets/snackbar.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';

class MapReviewDetailController extends GetxController {
  MapReviewDetailController(
    // this._mapRepository,
    this.reviewDetail,
  );
  late ReviewDetailUIModel reviewDetail;

  goToReviewImagePage() {
    Get.toNamed(Routes.MAP_IMAGE_VERIFICATION, arguments: {
      'selectedImageList': reviewDetail.reviewImageList.toList(),
      'editable': false,
    });
  }

  // _initReviewToEdit(ReviewDetailUIModel _reviewDetail) {
  //   isLoading.value = true;
  //   placeAddress = _reviewDetail.placeAddress.obs;
  //   placeId = _reviewDetail.placeId;
  //   placeName = _reviewDetail.placeName.obs;
  //   placeThumbnail = _reviewDetail.placeThumbnail.obs;
  //   // isPhotoReview = _reviewDetail.isPhotoReview.obs;
  //   previousConimalList = _reviewDetail.conimals;
  //   selectedConimalList = _reviewDetail.conimals.obs;
  //   selectedDiseaseList = _reviewDetail.diseaseList.obs;
  //   selectedDiseaseTypeSet = _reviewDetail.diseaseTypes.toSet().obs;
  //   selectedReviewItems = _reviewDetail.reviewItems.obs;
  //   selectedReviewRate.value = _reviewDetail.reviewRate;
  //   selectedReviewImageList = _reviewDetail.reviewImageList.toList().obs;
  //   isLoading.value = false;
  // }

  // Future<void> _getMyReviewDetail(String reviewId) async {
  //   // _isLoading.value = true;
  //   final myReviewResponseEither =
  //       await _mapRepository.getMyReviewDetail(reviewId: reviewId);

  //   var reviewDetailDTO = myReviewResponseEither.fold((fail) {
  //     FailureInterpreter().mapFailureToSnackbar(fail, '_getPostList');
  //     return null;
  //   }, (reviewResponseDto) => reviewResponseDto);

  //   if (reviewDetailDTO != null) {
  //     _initReviewToEdit(ReviewDetailUIModel.fromDTO(reviewDetailDTO));
  //   }
  // }

  // changeDiseaseTypeList(List<DiseaseUIModel> _changedDiseaseList) {
  //   selectedDiseaseTypeSet.clear();
  //   _changedDiseaseList.forEach((element) {
  //     if (selectedDiseaseTypeSet.contains(element.diseaseType)) {
  //     } else {
  //       selectedDiseaseTypeSet.add(element.diseaseType);
  //     }
  //   });
  // }

  // Future<void> getBack() async {
  //   bool isConfirmed = await showSelectionDialog(
  //       cancleText: '아니요',
  //       confirmText: '네',
  //       title: '수정을 그만할까요?',
  //       subtitle: '수정된 정보는 사라집니다');
  //   if (isConfirmed) {
  //     Get.back();
  //   }
  // }

  // onConimalSelected(ConimalUIModel conimal) {
  //   if (selectedConimalList.contains(conimal)) {
  //     selectedConimalList.remove(conimal);
  //   } else {
  //     selectedConimalList.add(conimal);
  //   }
  //   if (selectedConimalList.isNotEmpty) {
  //     showDiseaseTypeSection.value = true;
  //   } else {
  //     showDiseaseTypeSection.value = false;
  //   }
  // }

  // onReviewItemSelected(ReviewItem item) {
  //   if (selectedReviewItems.contains(item)) {
  //     selectedReviewItems.remove(item);
  //   } else {
  //     selectedReviewItems.add(item);
  //   }
  //   selectedReviewItems.refresh();
  // }

  // validateButton() {
  //   if (selectedConimalList.isNotEmpty &&
  //       selectedDiseaseTypeSet.isNotEmpty &&
  //       selectedReviewRate.value != null &&
  //       selectedReviewItems.isNotEmpty) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // searchDisease() async {
  //   List<DiseaseUIModel>? result = await Get.toNamed(
  //     Routes.DISEASE_SEARCH,
  //     arguments: {
  //       'selectedDiseaseList': selectedDiseaseList.toList(),
  //       'maxDisease': 3
  //     },
  //   ) as List<DiseaseUIModel>?;

  //   if (result != null) {
  //     selectedDiseaseList.assignAll(result);
  //     onSelectedDiseaseListChanged(selectedDiseaseList);
  //   }
  // }

  // onSelectedDiseaseListChanged(List<DiseaseUIModel> newDiseaseList) {
  //   if (newDiseaseList.isEmpty) return;
  //   selectedDiseaseTypeSet.clear();
  //   setSelectedDiseaseText(newDiseaseList);

  //   selectedDiseaseTypeSet.assignAll(
  //       newDiseaseList.map((element) => element.diseaseType).toList());
  //   scrollController.animateTo(400,
  //       duration: const Duration(milliseconds: 200), curve: Curves.linear);
  //   if (selectedDiseaseTypeSet.isNotEmpty) {
  //     showReviewRateSection.value = true;
  //   } else {
  //     showReviewRateSection.value = false;
  //   }
  // }

  // setSelectedDiseaseText(List<DiseaseUIModel> diseaseInfo) {
  //   if (diseaseInfo.isNotEmpty) {
  //     isDiseaseSelected.value = true;
  //     if (diseaseInfo.length > 1) {
  //       diseaseText.value = diseaseInfo[0].name.substring(0, 10);
  //       diseaseSuffixText.value = ' 외 ${diseaseInfo.length - 1}개';
  //     } else {
  //       diseaseText.value = diseaseInfo[0].name.substring(0, 10);
  //       diseaseSuffixText.value = '';
  //     }
  //   } else {
  //     isDiseaseSelected.value = false;
  //   }
  // }

  // onSelectedDiseaseTypeListChanged(DiseaseType diseaseType) {
  //   if (selectedDiseaseTypeSet.isEmpty) {
  //     scrollController.animateTo(400,
  //         duration: const Duration(milliseconds: 200), curve: Curves.linear);
  //   }
  //   if (selectedDiseaseTypeSet.contains(diseaseType)) {
  //     if (selectedDiseaseList
  //         .any((element) => element.diseaseType == diseaseType)) {
  //       showCustomSnackbar(text: '등록한 질병의 문제는 삭제할 수 없어요');
  //     } else {
  //       selectedDiseaseTypeSet.remove(diseaseType);
  //     }
  //   } else {
  //     if (selectedDiseaseTypeSet.length < 3) {
  //       selectedDiseaseTypeSet.add(diseaseType);
  //     } else {
  //       showCustomSnackbar(text: '문제는 3개까지만 추가 가능합니다');
  //     }
  //   }
  //   if (selectedDiseaseTypeSet.isNotEmpty) {
  //     showReviewRateSection.value = true;
  //   } else {
  //     showReviewRateSection.value = false;
  //   }
  // }

  // onReviewRateChanged(ReviewRate reviewRate) {
  //   if (selectedReviewRate.value == null) {
  //     showReviewItemSection.value = true;
  //     scrollController.animateTo(700,
  //         duration: const Duration(milliseconds: 200), curve: Curves.linear);
  //   }
  //   selectedReviewRate.value = reviewRate;
  // }

  // goToPhotoVerificationPage() async {
  //   List<ImageItem>? imageAdded = await Get.toNamed(
  //       Routes.MAP_IMAGE_VERIFICATION,
  //       arguments: {'selectedImageList': selectedReviewImageList.toList()});
  //   if (imageAdded != null) {
  //     selectedReviewImageList.assignAll(imageAdded.toList());
  //     // isPhotoReview.value = selectedReviewImageList.isNotEmpty;
  //   }
  // }

  // createNewReview() async {
  //   late bool createReviewSucceed;
  //   Either<Failure, String> newReviewEither = await showLoading(() =>
  //       _mapRepository.createPlaceReview(
  //           reviewUIModel: _makeNewReviewModel(), uploadedImageRefs: []));

  //   createReviewSucceed = newReviewEither.fold((fail) {
  //     FailureInterpreter().mapFailureToSnackbar(fail, 'createNewPostDB');
  //     return false;
  //   }, (newReview) {
  //     return true;
  //   });

  //   if (createReviewSucceed) {
  //     await AuthController.to.setUserAuthInfo();
  //     Get.back();
  //     return;
  //   }
  // }

  // ReviewDetailUIModel _makeNewReviewModel() {
  //   return ReviewDetailUIModel(
  //       reviewId: _reviewId,
  //       conimals: selectedConimalList,
  //       diseaseTypes: selectedDiseaseTypeSet.toList(),
  //       reviewItems: selectedReviewItems,
  //       reviewRate: selectedReviewRate.value,
  //       diseaseList: selectedDiseaseList,
  //       placeAddress: placeAddress.value,
  //       placeId: placeId,
  //       placeName: placeName.value,
  //       placeThumbnail: placeThumbnail.value,
  //       isPhotoReview: false,
  //       reviewImageList: selectedReviewImageList,
  //       reviewDesc: '');
  // }
}
