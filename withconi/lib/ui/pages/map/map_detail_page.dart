import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/controller/map/map_detail_controller.dart';
import 'package:withconi/controller/map/map_main_page_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/map/map_widgets/opening_status_text.dart';
import 'package:withconi/ui/theme/text_theme.dart';
import 'package:withconi/ui/widgets/divider/circle_divider.dart';

import '../../widgets/button/wide_button.dart';
import 'map_widgets/phone_button.dart';

class MapDetailPage extends StatelessWidget {
  MapDetailPage({
    Key? key,
  }) : super(key: key);
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    MapDetailPageController _controller = Get.put(MapDetailPageController());

    return Scaffold(
      persistentFooterButtons: [
        Container(
          padding: EdgeInsets.only(left: 10),
          height: 70,
          color: WcColors.white,
          width: WcWidth,
          child: Row(
            children: [
              PhoneButton(),
              SizedBox(
                width: 10,
              ),
              WcWideButtonWidget(
                  buttonText: '리뷰쓰기',
                  onTap: () {},
                  buttonWidth: WcWidth - 30 - 60,
                  activeButtonColor: WcColors.blue100,
                  active: true,
                  activeTextColor: WcColors.white),
            ],
          ),
        )
      ],
      backgroundColor: WcColors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, isopen) => [
          SliverToBoxAdapter(
            child: SizedBox(
              width: WcWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: WcWidth,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://scontent-ssn1-1.xx.fbcdn.net/v/t39.30808-6/298500558_471821374952690_8516637459808297916_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=RW-D0BIhRZ8AX_a8xZW&_nc_ht=scontent-ssn1-1.xx&oh=00_AT_akP2K5b68ZP9PGrzSOXlGYVJ9CFws7y_aaA9X9geMKg&oe=631BC9D7'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: WcWidth - 40,
                          child: Text(
                            '행복한 동물병원',
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              Obx(
                                () => Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _controller
                                                .isBusinessHourInfoOpen.value =
                                            !_controller
                                                .isBusinessHourInfoOpen.value;
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 2),
                                        color: WcColors.white,
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/clock.svg'),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            OpeningStatusText(
                                              isOpen: true,
                                              fontSize: 15,
                                              hasIndicator: false,
                                            ),
                                            WcCircleDivider(
                                              color: WcColors.grey100,
                                              radius: 2,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 6),
                                            ),
                                            Text('토요일 09:00~18:00'),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/arrow_down.svg',
                                              width: 13,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    AnimatedSize(
                                      curve: Curves.fastOutSlowIn,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      reverseDuration:
                                          const Duration(milliseconds: 500),
                                      child: (_controller
                                              .isBusinessHourInfoOpen.value)
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                left: 12,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              width: 300,
                                              child: Column(
                                                children: [
                                                  Text('토요일 09:00~18:00'),
                                                  Text('토요일 09:00~18:00'),
                                                  Text('토요일 09:00~18:00'),
                                                  Text('토요일 09:00~18:00'),
                                                ],
                                              ),
                                            )
                                          : Container(width: 300),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 3),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/place_marker.svg'),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text('서울시 성동구 자동차시장 1길'),
                                    SvgPicture.asset(
                                      'assets/icons/copy.svg',
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 3),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/phone.svg'),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text('02-123-2344'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  TabBar(
                    controller: _controller.tabController,
                    tabs: _controller.tabs,
                    labelColor: WcColors.black,
                    indicatorColor: WcColors.black,
                    unselectedLabelColor: WcColors.grey140,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: WcColors.grey60,
                  )
                ],
              ),
            ),
          ),
        ],
        body: TabBarView(controller: _controller.tabController, children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '방문한 코니멀의 비율',
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: WcWidth,
                            height: 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: (WcWidth - 50) * 0.4,
                                height: 23,
                                decoration: BoxDecoration(
                                    color: WcColors.mintLight,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5))),
                              ),
                              Container(
                                width: (WcWidth - 50) * 0.6,
                                height: 23,
                                decoration: BoxDecoration(
                                    color: WcColors.blue80,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5))),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 15,
                            top: 0,
                            child: Image.asset(
                              'assets/icons/dog.png',
                              height: 49,
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 0,
                            child: Image.asset(
                              'assets/icons/cat.png',
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('강아지'),
                                Text('34'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('54'),
                                Text('고양이'),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 15,
                  width: WcWidth,
                  color: WcColors.grey40,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('방문한 코니멀의 질병'),
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 0,
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: PieChart(
                              PieChartData(
                                  pieTouchData: PieTouchData(touchCallback:
                                      (FlTouchEvent event, pieTouchResponse) {
                                    // setState(() {
                                    //   if (!event
                                    //           .isInterestedForInteractions ||
                                    //       pieTouchResponse == null ||
                                    //       pieTouchResponse.touchedSection ==
                                    //           null) {
                                    //     touchedIndex = -1;
                                    //     return;
                                    //   }
                                    //   touchedIndex = pieTouchResponse
                                    //       .touchedSection!
                                    //       .touchedSectionIndex;
                                    // });
                                  }),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 40,
                                  sections: showingSections()),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(),
            ],
          )
        ]),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 50.0 : 35.0;
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
}
