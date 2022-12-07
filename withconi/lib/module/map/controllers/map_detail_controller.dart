import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/model/dto/request_dto/place_request/get_review_history_request.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/review_history_response_dto.dart';

import 'package:withconi/data/repository/map_repository.dart';

import 'package:withconi/module/ui_model/chart_data_ui_model.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_detail_ui.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';
import 'package:withconi/module/ui_model/place_ui_model/hospital_detail_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/pharmacy_detail_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/pharmacy_preview_ui_model.dart';
import 'package:withconi/module/ui_model/review_history_ui_model.dart';

import '../../../core/error_handling/failures.dart';
import '../../../data/enums/enum.dart';
import '../../../data/model/dto/response_dto/place_response/place_detail_response_dto.dart';
import '../../../import_basic.dart';
import '../../auth/auth_controller.dart';

class MapDetailPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  MapDetailPageController(this._mapRepository);
  final MapRepository _mapRepository;
  late final PlacePreviewUiModel _placePreview;
  late Rx<PlaceDetailUiModel> placeDetail;
  late String _placeId;
  late PlaceType _placeType;
  RxBool isBookmarked = false.obs;
  RxInt picChartTouchedIndex = (-1).obs;
  RxBool dataInitialized = false.obs;
  ScrollController pageScrollController = ScrollController();
  RxBool openHourInfo = false.obs;
  RxBool openDetailAddress = false.obs;
  RxBool onlyPhotoReview = false.obs;
  RxBool showReviewHistory = AuthController.to.userInfo.isWrittenReview.obs;

  late TabController tabController;

  RxBool isExpand = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
    await initData();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  onBookmarkTap(bool isBookMarked) async {
    isBookmarked.value = isBookMarked;
    await updateBookMark(isBookmarked: isBookmarked.value);
  }

  updateBookMark({required bool isBookmarked}) async {
    var likePostsEither = await _mapRepository.updateBookmark(
        placeId: _placeId, isBookmarked: isBookmarked);

    likePostsEither.fold(
        (l) => FailureInterpreter().mapFailureToSnackbar(l, 'updateLikePost'),
        (r) => {});
  }

  initData() async {
    dataInitialized.value = false;
    _placePreview = Get.arguments as PlacePreviewUiModel;
    _placeId = _placePreview.placeId;
    _placeType = _placePreview.placeType;

    await getPlaceDetailById(placeId: _placeId);
    dataInitialized.value = true;
  }

  getPlaceDetailById({required String placeId}) async {
    Either<Failure, PlaceDetailResponseDTO> placeDetailEither =
        await _mapRepository.getPlaceDetailById(
            placeId: _placeId, placeType: _placeType);

    placeDetailEither.fold(
        (l) =>
            FailureInterpreter().mapFailureToSnackbar(l, 'getPlaceDetailById'),
        (dto) {
      placeDetail = Rx<PlaceDetailUiModel>(_parsePlaceDetailDto(dto));
      isBookmarked.value = placeDetail.value.isBookmarked;
    });
    return;
  }

  _parsePlaceDetailDto(PlaceDetailResponseDTO dto) {
    return dto.map(
      hospital: (value) => HospitalDetailUIModel.fromDTO(value),
      pharmacy: (value) => PharmacyDetailUIModel.fromDTO(value),
    );
  }

  // makeDiseaseChartData() {
  //   List<ChartData> diseaseData = [];
  //   int totalDiseaseNum = placeDetail.diseaseInfo.totalHistory;

  //   if (totalDiseaseNum != 0) {
  //     placeDetail.diseaseHistoryGroup.diseaseMap.forEach((diseaseType, value) {
  //       ChartData chartData = ChartData(
  //           value: value,
  //           percent:
  //               calculatePercent(totalNum: totalDiseaseNum, valueNum: value),
  //           color: colorByDisease(diseaseType),
  //           title: diseaseType.displayName);
  //       if (value != 0) {
  //         diseaseData.add(chartData);
  //       }
  //     });

  //     diseaseChartData.assignAll(diseaseData);
  //   }
  //   return;
  // }

  // makeSpeciesChartData() {
  //   ChartData dogChartData = ChartData(
  //       value: placeDetail.totalVisitingDogs,
  //       percent: calculatePercent(
  //           totalNum:
  //               placeDetail.totalVisitingCats + placeDetail.totalVisitingDogs,
  //           valueNum: placeDetail.totalVisitingDogs),
  //       color: colorBySpecies(Species.dog),
  //       title: '강아지');
  //   ChartData catChartData = ChartData(
  //       value: placeDetail.totalVisitingCats,
  //       percent: calculatePercent(
  //           totalNum:
  //               placeDetail.totalVisitingCats + placeDetail.totalVisitingDogs,
  //           valueNum: placeDetail.totalVisitingCats),
  //       color: colorBySpecies(Species.cat),
  //       title: '고양이');
  //   speciesChartData.assignAll([dogChartData, catChartData]);
  //   return;
  // }

  getPlaceReview({required String locId, required bool onlyPhotoReview}) async {
    Either<Failure, ReviewHistoryResponseDTO> reviewResponseResult =
        await _mapRepository.getReviewHistory(
            locId: locId, onlyPhotoReview: onlyPhotoReview);

    reviewResponseResult.fold(
        (l) => FailureInterpreter().mapFailureToSnackbar(l, 'getPlaceReview'),
        (reviewHistoryDto) {
      placeDetail.value.reviewHistoryMap = reviewHistoryDto.reviewHistoryMap;
      placeDetail.refresh();
    });
    return;
  }

  onOnlyVerifiedReviewChanged(bool _onlyPhotoReview) async {
    onlyPhotoReview.value = _onlyPhotoReview;
    await showLoading(() => getPlaceReview(
        locId: placeDetail.value.address,
        onlyPhotoReview: onlyPhotoReview.value));
  }

  calculatePercent({required int totalNum, required int valueNum}) {
    double percentDouble = (valueNum / totalNum) * 100;
    int percentInt = (percentDouble.isNaN || percentDouble.isInfinite)
        ? 0
        : percentDouble.toInt();
    return percentInt;
  }

  onPieGraphTouched(FlTouchEvent event, pieTouchResponse) {
    if (!event.isInterestedForInteractions ||
        pieTouchResponse == null ||
        pieTouchResponse.touchedSection == null) {
      picChartTouchedIndex.value = -1;
      return;
    }
    picChartTouchedIndex.value =
        pieTouchResponse.touchedSection!.touchedSectionIndex;
  }

  goToNewReviewPage() {
    Get.toNamed(Routes.MAP_NEW_REVIEW, arguments: _placePreview);
  }
}
