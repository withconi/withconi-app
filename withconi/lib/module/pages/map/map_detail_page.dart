import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/enums/enum_color.dart';
import 'package:withconi/controller/map/map_detail_controller/map_detail_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/pages/map/map_widgets/opening_status_text.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/module/widgets/divider/circle_divider.dart';
import 'package:withconi/module/widgets/scaffold/loading_scaffold.dart';
import 'package:withconi/module/widgets/snackbar.dart';
import '../../../controller/auth_controller.dart';
import '../../widgets/button/wide_button.dart';
import '../../widgets/checkbox/custom_checkbox.dart';
import '../../widgets/expansion_tile.dart/custom_expansion_tile.dart';
import '../../widgets/graph/percentage_graph.dart';
import '../../widgets/loading/loading_page.dart';
import 'map_new_review_page.dart';
import 'map_widgets/phone_button.dart';

class MapDetailPage extends StatelessWidget {
  MapDetailPage({
    Key? key,
  }) : super(key: key);
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    MapDetailPageController _controller = Get.put(MapDetailPageController());

    return Obx(
      () => (!_controller.dataInitialized.value)
          ? const LoadingPage()
          : Scaffold(
              backgroundColor: WcColors.white,
              body: NestedScrollView(
                headerSliverBuilder: (context, isopen) => [
                  SliverToBoxAdapter(
                    child: _getPlaceDescription(_controller),
                  ),
                ],
                body: TabBarView(
                    controller: _controller.tabController,
                    children: [
                      _getFirstTabbar(_controller),
                      _getSecondTabbar(_controller)
                    ]),
              ),
              persistentFooterButtons: [
                _getNewReviewFooterButton(_controller),
              ],
            ),
    );
  }

  Container _getNewReviewFooterButton(MapDetailPageController _controller) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 70,
      color: WcColors.white,
      width: WcWidth,
      child: Row(
        children: [
          PhoneCallButton(phoneNumber: _controller.placeDetail.phone),
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
    );
  }

  SizedBox _getPlaceDescription(MapDetailPageController _controller) {
    return SizedBox(
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
                        image: NetworkImage(_controller.placeDetail.thumbnail),
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) => Container(
                              child: SvgPicture.asset(
                                  'assets/icons/withconi_grey.svg'),
                            ))),
              ),
              Positioned(
                left: 15,
                top: 18,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 47,
                    height: 47,
                    padding: EdgeInsets.all(12),
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
                top: 18,
                child: Obx(
                  () => BookmarkButton(
                    isBookmarked: _controller.isBookmarked.value,
                    onTap: _controller.onBookmarkTap,
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
                                _controller.isBusinessHourInfoOpen.value =
                                    !_controller.isBusinessHourInfoOpen.value;
                              },
                              child: Container(
                                height: 25,
                                color: WcColors.white,
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/clock.svg'),
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
                                          EdgeInsets.symmetric(horizontal: 6),
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
                              duration: const Duration(milliseconds: 500),
                              reverseDuration:
                                  const Duration(milliseconds: 500),
                              child: (_controller.isBusinessHourInfoOpen.value)
                                  ? Container(
                                      margin: EdgeInsets.only(
                                        left: 12,
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
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
                        // height: 25,
                        width: WcWidth - 40,
                        padding: EdgeInsets.only(top: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/place_marker.svg',
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            SizedBox(
                                width: 200,
                                child: Text(_controller.placeDetail.address)),
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                    text: _controller.placeDetail.address));

                                showCustomSnackbar(text: '주소가 복사되었어요');
                              },
                              child: Container(
                                // height: 25,
                                width: 30,
                                color: WcColors.white,
                                padding: EdgeInsets.only(
                                  top: 1,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/copy.svg',
                                  width: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 27,
                        // margin:
                        //     EdgeInsets.symmetric(vertical: 3),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }

  SingleChildScrollView _getFirstTabbar(MapDetailPageController _controller) {
    return SingleChildScrollView(
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
                      height: 55,
                    ),
                    PercentageGraph(
                      graphWidth: WcWidth - 70,
                      graphDataList: _controller.speciesChartData
                          .map((conimalChartData) => PercentageGraphData(
                              graphColor: conimalChartData.color,
                              percent: conimalChartData.percent))
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
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _controller.speciesChartData
                        .map(
                          (conimalData) => Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                conimalData.title,
                                style: TextStyle(
                                    fontFamily: WcFontFamily.notoSans,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${conimalData.percent.round()}%',
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600, fontSize: 17),
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
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                              touchCallback: _controller.onPieGraphTouched),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 3,
                          centerSpaceRadius: 45,
                          sections: (_controller.diseaseChartData.isEmpty)
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
                                      color: diseaseChartData.color,
                                      value:
                                          diseaseChartData.percent.toDouble(),
                                      title: diseaseChartData.title,
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
                          collapsedIconColor: WcColors.grey160,
                          iconColor: WcColors.grey160,
                          collapsedTextColor: WcColors.black,
                          tilePadding: EdgeInsets.all(0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        color: diseaseData.color,
                                        borderRadius: BorderRadius.circular(3)),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Text(
                                    diseaseData.title,
                                    style: TextStyle(
                                        fontFamily: WcFontFamily.notoSans,
                                        fontSize: 15.5,
                                        height: 1.2,
                                        fontWeight: FontWeight.w500,
                                        color: WcColors.grey200),
                                  ),
                                ],
                              ),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: '${diseaseData.value}',
                                      style: GoogleFonts.openSans(
                                        fontSize: 15.5,
                                        height: 1.2,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  TextSpan(
                                    text: '명',
                                  )
                                ]),
                                style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontSize: 15.5,
                                  height: 1.2,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 46, 47, 48),
                                ),
                              ),
                            ],
                          ),
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    top: 10, bottom: 10, right: 30, left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('비대성 심근증'),
                                    Text('34%'),
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.only(
                                    top: 5, bottom: 5, right: 30, left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('비대성 심근증'),
                                    Text('34%'),
                                  ],
                                ))
                          ],
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _getSecondTabbar(MapDetailPageController _controller) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '리뷰',
                          style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          _controller.reviewResponse.totalReview.toString(),
                          style: GoogleFonts.openSans(
                              height: 1.5,
                              fontWeight: FontWeight.w600,
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
                          borderRadius: BorderRadius.circular(5)),
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
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        PercentageGraph(
                          graphDataList: _controller.reviewChartData
                              .map((chartData) => PercentageGraphData(
                                  graphColor: chartData.color,
                                  percent: chartData.percent.toInt()))
                              .toList(),
                        ),
                        CustomCheckBox(
                          value: _controller.onlyVisitVerified.value,
                          isSelected: _controller.onlyVisitVerified.value,
                          onChanged: (selected) {
                            _controller.onOnlyVerifiedReviewChanged(!selected);
                          },
                          text: '방문인증 리뷰만 보기',
                          mainAxisAlignment: MainAxisAlignment.end,
                          iconHeight: 18,
                          textSize: 15,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        ExpansionPanelList.radio(
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
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            '${_controller.reviewResponse.reviewList[0].reviewNum}명',
                                            style: GoogleFonts.openSans(
                                                fontSize: 15.5,
                                                height: 1.2,
                                                fontWeight: FontWeight.w500,
                                                color: WcColors.grey180),
                                          )
                                        ],
                                      ),
                                    ),
                                body: Column(
                                  children: _controller.reviewResponse
                                      .reviewList[0].reviewItemsMap.keys
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
                                                Text(_controller.reviewResponse
                                                    .reviewList[0]
                                                    .reviewItemsToString(
                                                        itemKey)),
                                                Text(
                                                    '${_controller.reviewResponse.reviewList[0].reviewItemsMap[itemKey]}개'),
                                              ],
                                            )),
                                      )
                                      .toList(),
                                )),
                            ExpansionPanelRadio(
                                value: 2,
                                canTapOnHeader: true,
                                headerBuilder: (context, isExpanded) => Row(
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
                                              fontFamily: WcFontFamily.notoSans,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '${_controller.reviewResponse.reviewList[1].reviewNum}명',
                                          style: GoogleFonts.openSans(
                                              fontSize: 15.5,
                                              height: 1.2,
                                              fontWeight: FontWeight.w500,
                                              color: WcColors.grey180),
                                        )
                                      ],
                                    ),
                                body: SizedBox(
                                  width: WcWidth,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: _controller.reviewResponse
                                          .reviewList[1].reviewItemsMap.keys
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
                                                        '${_controller.reviewResponse.reviewList[1].reviewItemsMap[itemKey]}개'),
                                                  ],
                                                )),
                                          )
                                          .toList()),
                                )),
                            ExpansionPanelRadio(
                                value: 3,
                                canTapOnHeader: true,
                                headerBuilder: (context, isExpanded) => Row(
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
                                              fontFamily: WcFontFamily.notoSans,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '${_controller.reviewResponse.reviewList[2].reviewNum}명',
                                          style: GoogleFonts.openSans(
                                              fontSize: 15.5,
                                              height: 1.2,
                                              fontWeight: FontWeight.w500,
                                              color: WcColors.grey180),
                                        )
                                      ],
                                    ),
                                body: Column(
                                  children: _controller.reviewResponse
                                      .reviewList[2].reviewItemsMap.keys
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
                                                Text(_controller.reviewResponse
                                                    .reviewList[2]
                                                    .reviewItemsToString(
                                                        itemKey)),
                                                Text(
                                                    '${_controller.reviewResponse.reviewList[2].reviewItemsMap[itemKey]}개'),
                                              ],
                                            )),
                                      )
                                      .toList(),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: !AuthController.to.wcUser.value!.isWrittenReview!,
                child: Positioned(
                  top: 0,
                  child: Container(
                    height: 380,
                    width: WcWidth,
                    color: Colors.transparent,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: -6),
                      child: Container(
                        alignment: Alignment.center,
                        color: WcColors.grey40.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !AuthController.to.wcUser.value!.isWrittenReview!,
                child: Positioned(
                  top: 35,
                  child: Container(
                      width: WcWidth,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/paw.svg'),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '소중한 리뷰를 남겨주시겠어요?',
                                style: TextStyle(
                                    fontFamily: WcFontFamily.notoSans,
                                    color: WcColors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(text: '리뷰 '),
                              TextSpan(
                                  text: '1개',
                                  style: TextStyle(
                                    color: WcColors.blue100,
                                  )),
                              TextSpan(text: '를 남기면 모든 리뷰를 볼 수 있어요.'),
                            ]),
                            style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              color: WcColors.grey200,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          WcWideButtonWidget(
                              buttonText: '내 리뷰 쓰러 가기',
                              buttonHeight: 43,
                              buttonWidth: 200,
                              onTap: () {},
                              activeButtonColor:
                                  WcColors.purple100.withOpacity(0.7),
                              active: true,
                              activeTextColor: WcColors.white),
                          SizedBox(
                            height: 15,
                          ),
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(text: '저희는 '),
                              TextSpan(
                                  text: '영리적 목적 없이',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  )),
                              TextSpan(text: ' 코니멀들을 위해'),
                            ]),
                            style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text: '많은 정보가 공유',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  )),
                              TextSpan(text: '될 수 있도록 힘쓰고 있어요.'),
                            ]),
                            style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              color: WcColors.grey200,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                text: '리뷰 하나가 ',
                              ),
                              TextSpan(
                                  text: '코니멀들에게 큰 도움',
                                  style: TextStyle(
                                    // color: WcColors.black,
                                    fontWeight: FontWeight.w600,
                                  )),
                              TextSpan(text: '이 됩니다.'),
                            ]),
                            style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              color: WcColors.grey200,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BookmarkButton extends StatelessWidget {
  BookmarkButton({Key? key, this.onTap, required this.isBookmarked})
      : super(key: key);
  void Function(bool)? onTap;
  bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call(!isBookmarked);
      },
      child: Container(
        width: 47,
        height: 47,
        padding: EdgeInsets.all(12),
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
          color: (isBookmarked) ? WcColors.blue100 : WcColors.grey110,
        ),
      ),
    );
  }
}
