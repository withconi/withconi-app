import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/constants/enum_color.dart';
import 'package:withconi/controller/map/map_detail_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/map/map_widgets/opening_status_text.dart';
import 'package:withconi/ui/theme/text_theme.dart';
import 'package:withconi/ui/widgets/divider/circle_divider.dart';
import 'package:withconi/ui/widgets/snackbar.dart';
import '../../widgets/button/wide_button.dart';
import '../../widgets/expansion_tile.dart/custom_expansion_tile.dart';
import '../../widgets/graph/percentage_graph.dart';
import 'map_review_page.dart';
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
                  onTap: _controller.goToNewReviewPage,
                  buttonWidth: WcWidth - 30 - 60,
                  activeButtonColor: WcColors.blue100,
                  active: true,
                  activeTextColor: WcColors.white),
            ],
          ),
        )
      ],
      backgroundColor: WcColors.white,
      body: Obx(
        () => (!_controller.placeInited.value)
            ? SizedBox.shrink()
            : NestedScrollView(
                headerSliverBuilder: (context, isopen) => [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      width: WcWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: WcWidth,
                                height: 220,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            _controller.placeDetail.thumbnail),
                                        fit: BoxFit.cover,
                                        onError: (exception, stackTrace) =>
                                            Container(
                                              child: SvgPicture.asset(
                                                  'assets/icons/withconi_grey.svg'),
                                            ))),
                              ),
                              Positioned(
                                left: 15,
                                top: 30,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: WcColors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: WcColors.grey120,
                                              blurRadius: 5,
                                              offset: Offset(0, 5),
                                              spreadRadius: -1)
                                        ]),
                                    child: SvgPicture.asset(
                                      'assets/icons/arrow_back_long.svg',
                                      color: WcColors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                top: 30,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    padding: EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: WcColors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: WcColors.grey120,
                                              blurRadius: 5,
                                              offset: Offset(0, 5),
                                              spreadRadius: -1)
                                        ]),
                                    child: SvgPicture.asset(
                                      'assets/icons/bookmark.svg',
                                      color: WcColors.grey110,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: WcWidth - 40,
                                  child: Text(
                                    _controller.placeDetail.name,
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
                                  // width: 300,
                                  child: Column(
                                    children: [
                                      Obx(
                                        () => Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                _controller
                                                        .isBusinessHourInfoOpen
                                                        .value =
                                                    !_controller
                                                        .isBusinessHourInfoOpen
                                                        .value;
                                              },
                                              child: Container(
                                                height: 25,
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
                                                      margin:
                                                          EdgeInsets.symmetric(
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
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              reverseDuration: const Duration(
                                                  milliseconds: 500),
                                              child: (_controller
                                                      .isBusinessHourInfoOpen
                                                      .value)
                                                  ? Container(
                                                      margin: EdgeInsets.only(
                                                        left: 12,
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10),
                                                      width: 300,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                              '토요일 09:00~18:00'),
                                                          Text(
                                                              '토요일 09:00~18:00'),
                                                          Text(
                                                              '토요일 09:00~18:00'),
                                                          Text(
                                                              '토요일 09:00~18:00'),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(width: 300),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/place_marker.svg'),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(_controller
                                                .placeDetail.address),
                                            GestureDetector(
                                              onTap: () {
                                                Clipboard.setData(ClipboardData(
                                                    text: _controller
                                                        .placeDetail.address));

                                                showCustomSnackbar(
                                                    text: '주소가 복사되었어요');
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 30,
                                                color: WcColors.white,
                                                padding: EdgeInsets.only(
                                                    top: 4, bottom: 5, left: 4),
                                                child: SvgPicture.asset(
                                                  'assets/icons/copy.svg',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        // margin:
                                        //     EdgeInsets.symmetric(vertical: 3),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/icons/phone.svg'),
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
                            height: 15,
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
                body: TabBarView(
                    controller: _controller.tabController,
                    children: [
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
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
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
                                        height: 55,
                                      ),
                                      PercentageGraph(
                                        graphWidth: WcWidth - 70,
                                        graphDataList: _controller
                                            .speciesChartData
                                            .map((conimalChartData) =>
                                                PercentageGraphData(
                                                    graphColor:
                                                        conimalChartData.color,
                                                    percent: conimalChartData
                                                        .percent))
                                            .toList(),
                                      ),
                                      Positioned(
                                        left: 15,
                                        top: 0,
                                        child: Image.asset(
                                          'assets/icons/dog.png',
                                          height: 45,
                                        ),
                                      ),
                                      Positioned(
                                        right: 5,
                                        top: 0,
                                        child: Image.asset(
                                          'assets/icons/cat.png',
                                          height: 47,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: _controller.speciesChartData
                                          .map(
                                            (conimalData) => Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  conimalData.title,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          WcFontFamily.notoSans,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '${conimalData.percent.round()}%',
                                                  style: GoogleFonts.openSans(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 17),
                                                ),
                                              ],
                                            ),
                                          )
                                          .toList(),
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '방문한 코니멀의 질병',
                                    style: TextStyle(
                                        fontFamily: WcFontFamily.notoSans,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  ),
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
                                            pieTouchData: PieTouchData(
                                                touchCallback: _controller
                                                    .onPieGraphTouched),
                                            borderData: FlBorderData(
                                              show: false,
                                            ),
                                            sectionsSpace: 3,
                                            centerSpaceRadius: 45,
                                            sections: (_controller
                                                    .diseaseChartData.isEmpty)
                                                ? [
                                                    PieChartSectionData(
                                                        color: WcColors.grey80,
                                                        value: 100,
                                                        title: '',
                                                        radius: 30,
                                                        showTitle: false)
                                                  ]
                                                : _controller.diseaseChartData
                                                    .map((diseaseChartData) {
                                                    return PieChartSectionData(
                                                        color: diseaseChartData
                                                            .color,
                                                        value: diseaseChartData
                                                            .percent
                                                            .toDouble(),
                                                        title: diseaseChartData
                                                            .title,
                                                        radius: 30,
                                                        showTitle: false);
                                                  }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: _controller.diseaseChartData
                                        .map(
                                          (diseaseData) => CustomExpansionTile(
                                            textColor: WcColors.black,
                                            collapsedIconColor:
                                                WcColors.grey160,
                                            iconColor: WcColors.grey160,
                                            collapsedTextColor: WcColors.black,
                                            tilePadding: EdgeInsets.all(0),
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 15,
                                                      height: 15,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              diseaseData.color,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3)),
                                                    ),
                                                    SizedBox(
                                                      width: 13,
                                                    ),
                                                    Text(
                                                      diseaseData.title,
                                                      style: TextStyle(
                                                        fontFamily: WcFontFamily
                                                            .notoSans,
                                                        fontSize: 15.5,
                                                        height: 1.2,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 46, 47, 48),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '${diseaseData.value}명',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        WcFontFamily.notoSans,
                                                    fontSize: 15.5,
                                                    height: 1.2,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromARGB(
                                                        255, 46, 47, 48),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '리뷰',
                                            style: TextStyle(
                                                fontFamily:
                                                    WcFontFamily.notoSans,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            _controller
                                                .reviewResponse.totalReview
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily:
                                                    WcFontFamily.notoSans,
                                                fontWeight: FontWeight.w500,
                                                color: WcColors.grey160,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 80,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: WcColors.blue40,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          '리뷰쓰기',
                                          style: TextStyle(
                                              fontFamily: WcFontFamily.notoSans,
                                              fontWeight: FontWeight.w500,
                                              color: WcColors.blue100,
                                              fontSize: 14),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      PercentageGraph(
                                        graphDataList: _controller
                                            .reviewChartData
                                            .map((chartData) =>
                                                PercentageGraphData(
                                                    graphColor: chartData.color,
                                                    percent: chartData.percent
                                                        .toInt()))
                                            .toList(),
                                      ),
                                      CustomCheckBox(
                                        value:
                                            _controller.onlyVisitVerified.value,
                                        isSelected:
                                            _controller.onlyVisitVerified.value,
                                        onChanged: (selected) {
                                          _controller
                                              .onOnlyVerifiedReviewChanged(
                                                  !selected);
                                        },
                                        text: '방문인증 리뷰만 보기',
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        iconHeight: 18,
                                        textSize: 15,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: ExpansionPanelList.radio(
                                elevation: 0,
                                dividerColor: Colors.transparent,
                                expandedHeaderPadding: EdgeInsets.all(0),
                                children: [
                                  ExpansionPanelRadio(
                                      value: 1,
                                      canTapOnHeader: true,
                                      headerBuilder: (context, isExpanded) =>
                                          SizedBox(
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/good_face.svg',
                                                  width: 25,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  '추천해요',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          WcFontFamily.notoSans,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  '${_controller.reviewResponse.reviewList[0].reviewNum}명',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          WcFontFamily.notoSans,
                                                      fontSize: 15,
                                                      color: WcColors.grey140,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ),
                                      body: Column(
                                        children: _controller.reviewResponse
                                            .reviewList[0].reviewItems.keys
                                            .map(
                                              (itemKey) => Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10,
                                                      bottom: 10,
                                                      right: 30,
                                                      left: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(_controller
                                                          .reviewResponse
                                                          .reviewList[0]
                                                          .reviewItemsToString(
                                                              itemKey)),
                                                      Text(
                                                          '${_controller.reviewResponse.reviewList[0].reviewItems[itemKey]}명'),
                                                    ],
                                                  )),
                                            )
                                            .toList(),
                                      )),
                                  ExpansionPanelRadio(
                                      value: 2,
                                      canTapOnHeader: true,
                                      headerBuilder: (context, isExpanded) =>
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/neutral_face.svg',
                                                width: 25,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                '적당해요',
                                                style: TextStyle(
                                                    fontFamily:
                                                        WcFontFamily.notoSans,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                '${_controller.reviewResponse.reviewList[1].reviewNum}명',
                                                style: TextStyle(
                                                    fontFamily:
                                                        WcFontFamily.notoSans,
                                                    fontSize: 15,
                                                    color: WcColors.grey140,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                      body: SizedBox(
                                        width: WcWidth,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: _controller.reviewResponse
                                                .reviewList[1].reviewItems.keys
                                                .map(
                                                  (itemKey) => Container(
                                                      margin: EdgeInsets.only(
                                                          top: 10,
                                                          bottom: 10,
                                                          right: 30,
                                                          left: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(_controller
                                                              .reviewResponse
                                                              .reviewList[1]
                                                              .reviewItemsToString(
                                                                  itemKey)),
                                                          Text(
                                                              '${_controller.reviewResponse.reviewList[1].reviewItems[itemKey]}명'),
                                                        ],
                                                      )),
                                                )
                                                .toList()),
                                      )),
                                  ExpansionPanelRadio(
                                      value: 3,
                                      canTapOnHeader: true,
                                      headerBuilder: (context, isExpanded) =>
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/bad_face.svg',
                                                width: 25,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                '아쉬워요',
                                                style: TextStyle(
                                                    fontFamily:
                                                        WcFontFamily.notoSans,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                '${_controller.reviewResponse.reviewList[2].reviewNum}명',
                                                style: TextStyle(
                                                    fontFamily:
                                                        WcFontFamily.notoSans,
                                                    fontSize: 15,
                                                    color: WcColors.grey140,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                      body: Column(
                                        children: _controller.reviewResponse
                                            .reviewList[2].reviewItems.keys
                                            .map(
                                              (itemKey) => Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10,
                                                      bottom: 10,
                                                      right: 30,
                                                      left: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(_controller
                                                          .reviewResponse
                                                          .reviewList[2]
                                                          .reviewItemsToString(
                                                              itemKey)),
                                                      Text(
                                                          '${_controller.reviewResponse.reviewList[2].reviewItems[itemKey]}명'),
                                                    ],
                                                  )),
                                            )
                                            .toList(),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
      ),
    );
  }
}
