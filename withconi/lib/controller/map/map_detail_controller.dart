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
import '../../import_basic.dart';

class MapDetailPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late String placeId;
  late PlaceDetail placeDetail;
  List<ChartData> diseaseChartData = [];
  List<ChartData> speciesChartData = [];
  List<ChartData> reviewChartData = [];
  RxInt picChartTouchedIndex = (-1).obs;
  RxBool placeInited = false.obs;
  MapRepository _mapRepository = MapRepository();
  RxBool isBusinessHourInfoOpen = false.obs;
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

    String locId = Get.arguments as String;
    await showLoading(() => initData(locId: locId));

    placeInited.value = true;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  initData({required String locId}) async {
    await getPlaceDetailById(locId: locId);
    makeDiseaseChartData();
    makeSpeciesChartData();
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

    placeDetail.diseasePercentInfo.diseaseCountMap.forEach((key, value) {
      ChartData chartData = ChartData(
          percent: (2 / 30) * 100,
          color: colorByDisease(key),
          title: diseaseTypeToKorean(key));
      diseaseData.add(chartData);
    });

    diseaseChartData.assignAll(diseaseData);
  }

  makeSpeciesChartData() {
    ChartData dogChartData = ChartData(
        percent: (1 / 10) * 100,
        color: colorBySpecies(Species.dog),
        title: '강아지');
    ChartData catChartData = ChartData(
        percent: (8 / 10) * 100,
        color: colorBySpecies(Species.cat),
        title: '고양이');
    speciesChartData.assignAll([dogChartData, catChartData]);
  }

  makeReviewChartData() {
    // int totalReview = placeDetail.diseasePercentInfo.totalDisease;
    // List<ChartData> diseaseData = [];

    // placeDetail.diseasePercentInfo.diseaseCountMap.forEach((key, value) {
    //   print(key);
    //   ChartData chartData = ChartData(
    //       percent: (2 / 30) * 100,
    //       color: WcColors.blue100,
    //       title: diseaseTypeToKorean(key));
    //   diseaseData.add(chartData);
    // });

    // diseaseChartData.assignAll(diseaseData);
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
