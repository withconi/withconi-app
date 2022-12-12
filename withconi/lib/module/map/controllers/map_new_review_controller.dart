import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/global_widgets/dialog/place_verification_dialog.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';
import 'package:withconi/module/ui_model/review_detail_ui_model.dart';
import '../../../core/error_handling/failures.dart';
import '../../../data/repository/image_repository.dart';
import '../../../global_widgets/photo_gallary/image_item.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/dialog/selection_dialog.dart';
import '../../../global_widgets/snackbar.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../../ui_model/place_ui_model/abstract_class/place_preview_ui.dart';

class MapNewReviewController extends GetxController {
  MapNewReviewController(
    this._mapRepository,
    this._imageRepository,
    this._placeSelected,
    this._lat,
    this._lng, [
    this._placeId,
    this._placeName,
    this._placeAddress,
    this._placeThumbnail,
  ]);
  final MapRepository _mapRepository;
  final ImageRepository _imageRepository;

  final int maxImageNum = 4;
  // final RxInt selectedImageNum = 0.obs;
  final RxList<File> imageFileList = <File>[].obs;
  // late final PlacePreviewUIModel? _selectedPlacePreview;
  // late LatLngUIModel _baseLocation;
  late final double _lat;
  late final double _lng;
  late String placeId;
  late final String? _placeId;
  late final String? _placeName;
  late final String? _placeAddress;
  late final ImageItem? _placeThumbnail;
  late final bool _placeSelected;
  RxString placeName = ''.obs;
  RxString placeAddress = ''.obs;
  Rx<ImageItem> placeThumbnail =
      ImageItem(id: 'id', imageUrl: '', imageType: ImageType.network).obs;
  RxBool isLoading = false.obs;
  final RxBool validatePostButton = false.obs;
  RxBool showConimalSection = false.obs;
  RxBool showDiseaseTypeSection = false.obs;
  RxBool showReviewItemSection = false.obs;
  RxBool showReviewRateSection = false.obs;
  TextEditingController textController = TextEditingController();
  RxList<DiseaseUIModel> selectedDiseaseList = RxList<DiseaseUIModel>();
  RxSet<DiseaseType> selectedDiseaseTypeSet = RxSet<DiseaseType>();
  RxList<ConimalUIModel> selectedConimalList = RxList<ConimalUIModel>();
  List<ConimalUIModel> conimalList =
      AuthController.to.userInfo.conimals.toList();
  ScrollController scrollController = ScrollController();

  Rxn<ReviewRate> selectedReviewRate = Rxn<ReviewRate>();
  RxList<ReviewItem> selectedReviewItems = RxList<ReviewItem>();
  RxList<ImageItem> selectedImageList = RxList<ImageItem>();
  RxBool placeSelected = false.obs;

  @override
  onInit() {
    super.onInit();
    _initPlaceToReview();
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

  _initPlaceToReview() {
    isLoading.value = true;
    placeSelected.value = _placeSelected;
    if (placeSelected.value) {
      onPlaceChanged(
        _placeId!,
        _placeName!,
        _placeAddress!,
        _placeThumbnail!,
      );
    }
    isLoading.value = false;
  }

  onPlaceChanged(
    String id,
    String name,
    String address,
    ImageItem thumbnail,
  ) {
    selectedConimalList.clear();
    selectedDiseaseList.clear();
    selectedDiseaseTypeSet.clear();
    selectedImageList.clear();

    placeId = id;
    placeName.value = name;
    placeAddress.value = address;
    placeThumbnail.value = ImageItem(
        id: thumbnail.id,
        imageUrl: thumbnail.imageUrl,
        imageType: thumbnail.imageType);
    placeSelected.value = true;

    update();
  }

  changeDiseaseTypeList(List<DiseaseUIModel> _changedDiseaseList) {
    selectedDiseaseTypeSet.clear();
    for (var element in _changedDiseaseList) {
      if (selectedDiseaseTypeSet.contains(element.diseaseType)) {
      } else {
        selectedDiseaseTypeSet.add(element.diseaseType);
      }
    }
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

  onConimalSelected(ConimalUIModel conimal) {
    if (selectedConimalList.contains(conimal)) {
      selectedConimalList.remove(conimal);
    } else {
      selectedConimalList.add(conimal);
    }
    onSelectedDiseaseListChanged([]);
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

  goToSearchNewPlaceToReview() async {
    PlacePreviewUIModel? newPlace = await Get.toNamed(Routes.MAP_SEARCH,
        arguments: {'lat': _lat, 'lng': _lng}) as PlacePreviewUIModel?;

    if (newPlace != null) {
      onPlaceChanged(newPlace.placeId, newPlace.name, newPlace.address,
          newPlace.thumbnailImage);
    }
  }

  searchDisease() async {
    List<DiseaseUIModel>? result =
        await Get.toNamed(Routes.DISEASE_SEARCH, arguments: {
      'selectedDiseaseList': selectedDiseaseList.toList(),
      'maxDisease': selectedConimalList.length
    }) as List<DiseaseUIModel>?;

    if (result != null) {
      onSelectedDiseaseListChanged(result);
    }
  }

  onSelectedDiseaseListChanged(List<DiseaseUIModel> newDiseaseList) {
    selectedDiseaseList.assignAll(newDiseaseList);
    // if (newDiseaseList.isEmpty) return;
    selectedDiseaseTypeSet.clear();
    // setSelectedDiseaseText(newDiseaseList);

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
    if (newDiseaseList.isEmpty) {
      // isDiseaseSelected.value = false;
      selectedDiseaseTypeSet.clear();
    } else {
      // isDiseaseSelected.value = true;
      selectedDiseaseTypeSet.assignAll(
          newDiseaseList.map((element) => element.diseaseType).toList());
      scrollController.animateTo(400,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }

    selectedDiseaseTypeSet.refresh();

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

  onSelectedDiseaseTypeListChanged(
    DiseaseType diseaseType,
  ) {
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
      if (selectedDiseaseTypeSet.length < selectedConimalList.length) {
        selectedDiseaseTypeSet.add(diseaseType);
      } else {
        showCustomSnackbar(text: '한 코니멀당 1개 문제만 선택 가능해요');
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

  goToPhotoVerificationPage() async {
    List<ImageItem>? imageAdded =
        await Get.toNamed(Routes.MAP_IMAGE_VERIFICATION, arguments: {
      'selectedImageList': selectedImageList.toList(),
    }) as List<ImageItem>?;
    if (imageAdded != null) {
      selectedImageList.assignAll(imageAdded.toList());
      // isPhotoReview.value = selectedImageList.isNotEmpty;
      selectedImageList.refresh();
    }
  }

  createNewReview() async {
    await showLoading(() async {
      late bool createReviewSucceed;
      var newReview = _makeNewReviewModel();
      Either<Failure, bool> newReviewEither =
          await _mapRepository.createPlaceReview(
              reviewUIModel: newReview,
              uploadedImageRefs: await _uploadedImageFileListDb());

      createReviewSucceed = newReviewEither.fold((fail) {
        FailureInterpreter().mapFailureToSnackbar(fail, 'createNewPostDB');
        return false;
      }, (newReview) {
        return true;
      });

      if (createReviewSucceed) {
        await AuthController.to.setUserAuthInfo();
        Get.back(result: newReview);
      }
    });
  }

  Future<List<String>> _uploadedImageFileListDb() async {
    List<String> uploadImageRefList = [];

    Either<Failure, List<String>> imageUploadRefsEither =
        await _imageRepository.uploadImageFileList(selectedImageList.toList());

    uploadImageRefList = imageUploadRefsEither.fold((fail) {
      FailureInterpreter().mapFailureToSnackbar(fail, 'image upload error');
      return [];
    }, (imageRefList) {
      return imageRefList;
    });

    return uploadImageRefList;
  }

  ReviewDetailUIModel _makeNewReviewModel() {
    return ReviewDetailUIModel(
      reviewId: '',
      placeAddress: placeAddress.value,
      placeId: placeId,
      placeName: placeName.value,
      placeThumbnail: placeThumbnail.value,
      reviewImageList: selectedImageList.toList(),
      isPhotoReview: selectedImageList.isNotEmpty,
      conimals: selectedConimalList,
      diseaseTypes: selectedDiseaseTypeSet.toList(),
      reviewItems: selectedReviewItems,
      reviewRate: selectedReviewRate.value,
      diseaseList: selectedDiseaseList,
      reviewDesc: '',
    );
  }
}
