import 'package:dartz/dartz.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/constants/enum_color.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/model/hospital_detail.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/ui/entities/chart_data.dart';
import 'package:withconi/ui/widgets/loading.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/abstract_class/place_type.dart';
import '../../data/model/response_model/response_model.dart';
import '../../import_basic.dart';

class MapDetailPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // late String placeId;
  late PlaceDetail placeDetail;
  late ReviewResponse reviewResponse;
  late PlacePreview _placePreview;
  List<ChartData> diseaseChartData = [];
  List<ChartData> speciesChartData = [];
  List<ChartData> reviewChartData = [];
  RxInt picChartTouchedIndex = (-1).obs;
  RxBool placeInited = false.obs;
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

  // PieChartData data =
  //     PieChartData(sections: showingSections(), centerSpaceRadius: 20);

  RxBool isExpand = false.obs;

  @override
  onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  onReady() async {
    super.onReady();

    _placePreview = Get.arguments as PlacePreview;
    await showLoading(() => initData(locId: _placePreview.locId));

    placeInited.value = true;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  initData({required String locId}) async {
    await getPlaceDetailById(locId: locId);
    await getPlaceReview(locId: locId, onlyVerified: onlyVisitVerified.value);
    makeDiseaseChartData();
    makeSpeciesChartData();
    makeReviewChartData();
  }

  getPlaceDetailById({required String locId}) async {
    Either<Failure, PlaceDetail> placeDetailEither =
        await _mapRepository.getPlaceDetailById(locId: locId);

    placeDetailEither.fold(
        (l) =>
            FailureInterpreter().mapFailureToSnackbar(l, 'getPlaceDetailById'),
        (r) {
      placeDetail = r;
      return;
    });
  }

  makeDiseaseChartData() {
    List<ChartData> diseaseData = [];
    int totalDiseaseNum = placeDetail.diseasePercentInfo.totalDisease;

    if (totalDiseaseNum != 0) {
      placeDetail.diseasePercentInfo.diseaseCountMap.forEach((key, value) {
        ChartData chartData = ChartData(
            value: value,
            percent:
                calculatePercent(totalNum: totalDiseaseNum, valueNum: value),
            color: colorByDisease(key),
            title: diseaseTypeToKorean(key));
        if (value != 0) {
          diseaseData.add(chartData);
        }
      });

      diseaseData.sort((b, a) => a.percent.compareTo(b.percent));
      diseaseChartData.assignAll(diseaseData);
    }
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
  }

  getPlaceReview({required String locId, required bool onlyVerified}) async {
    Either<Failure, ReviewResponse> reviewResponseResult = await _mapRepository
        .getPlaceReview(locId: locId, onlyVisitVerified: onlyVerified);

    reviewResponseResult.fold(
        (l) => FailureInterpreter().mapFailureToSnackbar(l, 'getPlaceReview'),
        (r) => reviewResponse = r);
  }

  onOnlyVerifiedReviewChanged(bool onlyVerified) async {
    onlyVisitVerified.value = onlyVerified;
    await showLoading(() => getPlaceReview(
        locId: placeDetail.locId, onlyVerified: onlyVisitVerified.value));
    makeReviewChartData();
  }

  makeReviewChartData() async {
    int totalReview = reviewResponse.totalReview;
    List<ChartData> reviewData = [];

    reviewResponse.reviewList.forEach(((review) {
      ChartData chartData = ChartData(
          value: review.reviewNum,
          percent: calculatePercent(
              totalNum: totalReview, valueNum: review.reviewNum),
          color: colorByReview(review.reviewRate),
          title: reviewRateToKorean(review.reviewRate));
      reviewData.add(chartData);
    }));
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


// int touchedIndex = -1;
// List<PieChartSectionData> showingSections() {
//   return List.generate(4, (i) {
//     final isTouched = i == touchedIndex;
//     final fontSize = isTouched ? 25.0 : 16.0;
//     final radius = isTouched ? 50.0 : 40.0;
//     switch (i) {
//       case 0:
//         return PieChartSectionData(
//           color: WcColors.pinkLight,
//           value: 0,
//           title: '40%',
//           radius: radius,
//           titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: const Color(0xffffffff)),
//         );
//       case 1:
//         return PieChartSectionData(
//           color: WcColors.yellowLight,
//           value: 0,
//           title: '30%',
//           radius: radius,
//           titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: const Color(0xffffffff)),
//         );
//       case 2:
//         return PieChartSectionData(
//           color: WcColors.blueLight,
//           value: 5,
//           title: '15%',
//           radius: radius,
//           titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: const Color(0xffffffff)),
//         );
//       case 3:
//         return PieChartSectionData(
//           color: WcColors.mintLight,
//           value: 10,
//           title: '15%',
//           radius: radius,
//           titleStyle: TextStyle(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: const Color(0xffffffff)),
//         );
//       default:
//         throw Error();
//     }
//   });
// }
