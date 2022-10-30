import 'package:dartz/dartz.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/enums/enum_color.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/model/place_detail.dart';
import 'package:withconi/data/model/response_model/review_history_response.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/module/ui_model/chart_data.dart';
import 'package:withconi/module/widgets/loading/loading_overlay.dart';
import '../../../core/error_handling/failures.dart';
import '../../../data/model/abstract_class/place_preview.dart';
import '../../../data/model/response_model/response_model.dart';
import '../../../import_basic.dart';

class MapDetailPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // late String placeId;
  late PlaceDetail placeDetail;
  late ReviewHistoryResponse reviewResponse;
  late String _placeId;
  late String _userId;
  List<ChartData> diseaseChartData = [];
  List<ChartData> speciesChartData = [];
  List<ChartData> reviewChartData = [];
  RxBool isBookmarked = false.obs;
  RxInt picChartTouchedIndex = (-1).obs;
  RxBool dataInitialized = false.obs;
  MapRepository _mapRepository = MapRepository();
  RxBool isBusinessHourInfoOpen = false.obs;
  RxBool onlyVisitVerified = false.obs;
  final List<Widget> tabs = <Widget>[
    Container(
        width: 140,
        child: Tab(
          text: '정보',
          height: 50,
        )),
    Container(
        width: 140,
        child: Tab(
          text: '리뷰',
          height: 50,
        )),
  ];

  late TabController tabController;
  // late bool hasWrittenReviews;

  // PieChartData data =
  //     PieChartData(sections: showingSections(), centerSpaceRadius: 20);

  RxBool isExpand = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(vsync: this, length: tabs.length);
    await initData();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  onBookmarkTap(bool isBookMarked) async {
    isBookmarked.value = isBookMarked;
    await updateBookMark(
        placeId: placeDetail.locId, isBookmarked: isBookmarked.value);
  }

  updateBookMark({required String placeId, required bool isBookmarked}) async {
    var likePostsEither = await _mapRepository.updateBookmark(
        placeId: placeId, isBookmarked: isBookmarked);

    likePostsEither.fold(
        (l) => FailureInterpreter().mapFailureToSnackbar(l, 'updateLikePost'),
        (r) => {});
  }

  initData() async {
    dataInitialized.value = false;
    _placeId = Get.arguments as String;
    _userId = AuthController.to.wcUser.value!.uid;
    await getPlaceDetailById(locId: _placeId, userId: _userId);
    await getPlaceReview(
        locId: _placeId, onlyVerifiedReviews: onlyVisitVerified.value);
    makeDiseaseChartData();
    makeSpeciesChartData();
    makeReviewChartData();
    dataInitialized.value = true;
  }

  getPlaceDetailById({required String locId, required String userId}) async {
    Either<Failure, PlaceDetail> placeDetailEither =
        await _mapRepository.getPlaceDetailById(locId: locId, userId: userId);

    placeDetailEither.fold(
        (l) =>
            FailureInterpreter().mapFailureToSnackbar(l, 'getPlaceDetailById'),
        (r) {
      placeDetail = r;
      isBookmarked.value = placeDetail.isBookmarked;
    });
    return;
  }

  makeDiseaseChartData() {
    List<ChartData> diseaseData = [];
    int totalDiseaseNum = placeDetail.diseaseHistoryGroup.totalHistory;

    if (totalDiseaseNum != 0) {
      placeDetail.diseaseHistoryGroup.diseaseMap.forEach((diseaseType, value) {
        ChartData chartData = ChartData(
            value: value,
            percent:
                calculatePercent(totalNum: totalDiseaseNum, valueNum: value),
            color: colorByDisease(diseaseType),
            title: diseaseType.displayName);
        if (value != 0) {
          diseaseData.add(chartData);
        }
      });

      diseaseChartData.assignAll(diseaseData);
    }
    return;
  }

  makeSpeciesChartData() {
    ChartData dogChartData = ChartData(
        value: placeDetail.totalVisitingDogs,
        percent: calculatePercent(
            totalNum:
                placeDetail.totalVisitingCats + placeDetail.totalVisitingDogs,
            valueNum: placeDetail.totalVisitingDogs),
        color: colorBySpecies(Species.dog),
        title: '강아지');
    ChartData catChartData = ChartData(
        value: placeDetail.totalVisitingCats,
        percent: calculatePercent(
            totalNum:
                placeDetail.totalVisitingCats + placeDetail.totalVisitingDogs,
            valueNum: placeDetail.totalVisitingCats),
        color: colorBySpecies(Species.cat),
        title: '고양이');
    speciesChartData.assignAll([dogChartData, catChartData]);
    return;
  }

  getPlaceReview(
      {required String locId, required bool onlyVerifiedReviews}) async {
    Either<Failure, ReviewHistoryResponse> reviewResponseResult =
        await _mapRepository.getTotalReviewData(
            locId: locId, onlyVerfiedReview: onlyVerifiedReviews);

    reviewResponseResult.fold(
        (l) => FailureInterpreter().mapFailureToSnackbar(l, 'getPlaceReview'),
        (r) => reviewResponse = r);
    return;
  }

  onOnlyVerifiedReviewChanged(bool onlyVerified) async {
    onlyVisitVerified.value = onlyVerified;
    await showLoading(() => getPlaceReview(
        locId: placeDetail.locId,
        onlyVerifiedReviews: onlyVisitVerified.value));
    makeReviewChartData();
  }

  makeReviewChartData() {
    int totalReview = reviewResponse.totalReview;
    List<ChartData> reviewData = [];

    reviewResponse.reviewList.forEach(((review) {
      ChartData chartData = ChartData(
          value: review.reviewNum,
          percent: calculatePercent(
              totalNum: totalReview, valueNum: review.reviewNum),
          color: colorByReview(review.reviewRate),
          title: review.reviewRate.displayName);
      reviewData.add(chartData);
    }));

    reviewChartData.assignAll(reviewData);
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
    Get.toNamed(Routes.MAP_NEW_REVIEW, arguments: _placeId);
  }
}
