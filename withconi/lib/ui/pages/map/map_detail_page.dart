import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/controller/map/map_detail_controller.dart';
import 'package:withconi/controller/map/map_main_page_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/map/map_widgets/opening_status_text.dart';
import 'package:withconi/ui/theme/text_theme.dart';
import 'package:withconi/ui/widgets/divider/circle_divider.dart';
import 'package:withconi/ui/widgets/loading.dart';
import 'package:withconi/ui/widgets/snackbar.dart';

import '../../widgets/button/wide_button.dart';
import '../../widgets/expansion_tile.dart/custom_expansion_tile.dart';
import 'map_widgets/phone_button.dart';

class MapDetailPage extends StatelessWidget {
  MapDetailPage({
    Key? key,
  }) : super(key: key);
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    MapDetailPageController _controller = Get.put(MapDetailPageController());

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                                              _controller.thisPlace.thumbnail),
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
                                      _controller.thisPlace.name,
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
                                                        margin: EdgeInsets
                                                            .symmetric(
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
                                                        padding: EdgeInsets
                                                            .symmetric(
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
                                                  .thisPlace.address),
                                              GestureDetector(
                                                onTap: () {
                                                  Clipboard.setData(
                                                      ClipboardData(
                                                          text: _controller
                                                              .thisPlace
                                                              .address));

                                                  showCustomSnackbar(
                                                      text: '주소가 복사되었어요');
                                                },
                                                child: Container(
                                                  height: 25,
                                                  width: 30,
                                                  color: WcColors.white,
                                                  padding: EdgeInsets.only(
                                                      top: 4,
                                                      bottom: 5,
                                                      left: 4),
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
                              height: 30,
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
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
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
                                          graphDataList: [
                                            PercentageGraphData(
                                                graphColor: WcColors.mintLight,
                                                value: (((0 / 3) * 10.ceil())
                                                        .isNaN)
                                                    ? 0
                                                    : ((0 / 3) * 10).ceil()),
                                            PercentageGraphData(
                                                graphColor: WcColors.blue80,
                                                value: (((0 / 3) * 10.ceil())
                                                        .isNaN)
                                                    ? 0
                                                    : ((0 / 3) * 10).ceil()),
                                          ],
                                          totalValue: 10,
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
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '강아지',
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
                                                '${_controller.thisPlace.totalVisitingDogs / _controller.thisPlace.totalVisiting}%',
                                                style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 17),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '34%',
                                                style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 17),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '고양이',
                                                style: TextStyle(
                                                    fontFamily:
                                                        WcFontFamily.notoSans,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
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
                                                    touchCallback:
                                                        (FlTouchEvent event,
                                                            pieTouchResponse) {
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
                                                centerSpaceRadius: 45,
                                                sections: showingSections()),
                                          ),
                                        ),
                                      ),
                                    ),
                                    CustomExpansionTile(
                                      textColor: WcColors.black,
                                      collapsedIconColor: WcColors.black,
                                      iconColor: WcColors.black,
                                      collapsedTextColor: WcColors.black,
                                      tilePadding: EdgeInsets.all(0),
                                      title: Row(
                                        children: [
                                          Container(
                                            width: 13,
                                            height: 13,
                                            color: WcColors.yellowLight,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text('심/혈관계')
                                        ],
                                      ),
                                      children: [
                                        Container(child: Text('심/혈관계'))
                                      ],
                                    ),
                                    CustomExpansionTile(
                                      textColor: WcColors.black,
                                      collapsedIconColor: WcColors.black,
                                      iconColor: WcColors.black,
                                      collapsedTextColor: WcColors.black,
                                      tilePadding: EdgeInsets.all(0),
                                      title: Row(
                                        children: [
                                          Container(
                                            width: 13,
                                            height: 13,
                                            color: WcColors.yellowLight,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text('심/혈관계')
                                        ],
                                      ),
                                    ),
                                    CustomExpansionTile(
                                      textColor: WcColors.black,
                                      collapsedIconColor: WcColors.black,
                                      iconColor: WcColors.black,
                                      collapsedTextColor: WcColors.black,
                                      tilePadding: EdgeInsets.all(0),
                                      title: Row(
                                        children: [
                                          Container(
                                            width: 13,
                                            height: 13,
                                            color: WcColors.yellowLight,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text('심/혈관계')
                                        ],
                                      ),
                                    ),
                                    // ExpansionPanelList.radio(
                                    //   elevation: 0,
                                    //   dividerColor: Colors.transparent,
                                    //   expandedHeaderPadding: EdgeInsets.all(0),
                                    //   children: [
                                    //     ExpansionPanelRadio(
                                    //         value: 1,
                                    //         headerBuilder: (context, isExpanded) => SizedBox(
                                    //               child: Row(
                                    //                 children: [
                                    //                   Container(
                                    //                     width: 10,
                                    //                     height: 10,
                                    //                     color: WcColors.yellowLight,
                                    //                   ),
                                    //                   Text('심/혈관계')
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //         body: Column(
                                    //           children: [Text('갑상선 기능 항진증')],
                                    //         )),
                                    //     ExpansionPanelRadio(
                                    //         value: 2,
                                    //         headerBuilder: (context, isExpanded) => Row(
                                    //               children: [
                                    //                 Container(
                                    //                   width: 10,
                                    //                   height: 10,
                                    //                   color: WcColors.yellowLight,
                                    //                 ),
                                    //                 Text('심/혈관계')
                                    //               ],
                                    //             ),
                                    //         body: Column(
                                    //           children: [Text('갑상선 기능 항진증')],
                                    //         )),
                                    //     ExpansionPanelRadio(
                                    //         value: 3,
                                    //         headerBuilder: (context, isExpanded) => Row(
                                    //               children: [
                                    //                 Container(
                                    //                   width: 10,
                                    //                   height: 10,
                                    //                   color: WcColors.yellowLight,
                                    //                 ),
                                    //                 Text('심/혈관계')
                                    //               ],
                                    //             ),
                                    //         body: Column(
                                    //           children: [Text('갑상선 기능 항진증')],
                                    //         )),
                                    //   ],
                                    // )
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
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 30),
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
                                              _controller.thisPlace.totalReviews
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
                                                fontFamily:
                                                    WcFontFamily.notoSans,
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
                                    PercentageGraph(
                                      graphDataList: [
                                        PercentageGraphData(
                                            graphColor: WcColors.blue80,
                                            value: ((1 / 36) * 10).ceil()),
                                        PercentageGraphData(
                                            graphColor: WcColors.yellowLight,
                                            value: ((12 / 36) * 10).ceil()),
                                        PercentageGraphData(
                                            graphColor: WcColors.pinkLight,
                                            value: ((10 / 36) * 10).ceil()),
                                      ],
                                      totalValue: 10,
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
                                                        fontFamily: WcFontFamily
                                                            .notoSans,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    '46명',
                                                    style: TextStyle(
                                                        fontFamily: WcFontFamily
                                                            .notoSans,
                                                        fontSize: 15,
                                                        color: WcColors.grey140,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                            ),
                                        body: Column(
                                          children: [Text('갑상선 기능 항진증')],
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
                                                  '46명',
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
                                            children: [
                                              Container(
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
                                                      Text('설명이 상세해요'),
                                                      Text('4명'),
                                                    ],
                                                  )),
                                              Container(
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
                                                      Text('설명이 상세해요'),
                                                      Text('4명'),
                                                    ],
                                                  )),
                                            ],
                                          ),
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
                                                  '46명',
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
                                          children: [Text('갑상선 기능 항진증')],
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
      ),
    );
  }
}

class PercentageGraph extends StatelessWidget {
  PercentageGraph(
      {Key? key, required this.totalValue, required this.graphDataList})
      : super(key: key);

  int totalValue;
  List<PercentageGraphData> graphDataList;

  @override
  Widget build(BuildContext context) {
    bool singleValidValue = false;
    var noneZeroList =
        graphDataList.where((element) => element.value > 0).toList();
    if (noneZeroList.length <= 1) {
      singleValidValue = true;
    }
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8.0),
      clipBehavior: Clip.antiAlias,
      child: Container(
          color: WcColors.grey60,
          width: WcWidth - 40,
          height: 22,
          child: Row(
            children: graphDataList.map((e) {
              return PercentageGraphData(
                graphColor: e.graphColor,
                value: e.value,
                isLastIndex:
                    (graphDataList.indexOf(e) == graphDataList.length - 1 ||
                            singleValidValue)
                        ? true
                        : false,
              );
            }).toList(),
          )),
    );
  }
}

class PercentageGraphData extends StatelessWidget {
  PercentageGraphData({
    Key? key,
    required this.graphColor,
    required this.value,
    this.isLastIndex = false,
  }) : super(key: key);

  Color graphColor;
  int value;
  bool isLastIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: value,
      child: Container(
        decoration: BoxDecoration(
            color: graphColor,
            border: Border(
                right: BorderSide(
                    color: WcColors.white,
                    width: (isLastIndex || value == 0) ? 0 : 3))),
      ),
    );
  }
}
