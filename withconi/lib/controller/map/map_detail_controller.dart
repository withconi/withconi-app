import 'package:fl_chart/fl_chart.dart';

import '../../configs/constants/enum.dart';
import '../../import_basic.dart';

class MapDetailPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late String placeId;
  RxBool isBusinessHourInfoOpen = false.obs;
  final List<Widget> tabs = <Widget>[
    Container(
        width: 130,
        child: Tab(
          text: '정보',
        )),
    Container(
        width: 130,
        child: Tab(
          text: '리뷰',
        )),
  ];

  late TabController tabController;

  final dataMap = <String, double>{
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  final legendLabels = <String, String>{
    "Flutter": "Flutter legend",
    "React": "React legend",
    "Xamarin": "Xamarin legend",
    "Ionic": "Ionic legend",
  };

  PieChartData data =
      PieChartData(sections: showingSections(), centerSpaceRadius: 20);

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  @override
  onInit() async {
    super.onInit();
    // placeId = Get.arguments as String;
    tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  getPlaceDetailById({required String placeId}) {}
}

// class MyTabController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   final List<Tab> myTabs = <Tab>[
//     Tab(text: 'LEFT'),
//     Tab(text: 'RIGHT'),
//   ];

//   late TabController controller;

//   @override
//   void onInit() {
//     super.onInit();
//     controller = TabController(vsync: this, length: myTabs.length);
//   }

//   @override
//   void onClose() {
//     controller.dispose();
//     super.onClose();
//   }
// }

int touchedIndex = -1;
List<PieChartSectionData> showingSections() {
  return List.generate(4, (i) {
    final isTouched = i == touchedIndex;
    final fontSize = isTouched ? 25.0 : 16.0;
    final radius = isTouched ? 50.0 : 40.0;
    switch (i) {
      case 0:
        return PieChartSectionData(
          color: WcColors.pinkLight,
          value: 40,
          title: '40%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      case 1:
        return PieChartSectionData(
          color: WcColors.yellowLight,
          value: 30,
          title: '30%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      case 2:
        return PieChartSectionData(
          color: WcColors.blueLight,
          value: 15,
          title: '15%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      case 3:
        return PieChartSectionData(
          color: WcColors.mintLight,
          value: 15,
          title: '15%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      default:
        throw Error();
    }
  });
}
