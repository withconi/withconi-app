import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/map/controllers/map_detail_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/map/widgets/opening_status_text.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/divider/circle_divider.dart';
import 'package:withconi/global_widgets/snackbar.dart';
import '../auth/auth_controller.dart';
import '../../global_widgets/button/wide_button.dart';
import '../../global_widgets/checkbox/custom_checkbox.dart';
import '../../global_widgets/expansion_tile.dart/custom_expansion_tile.dart';
import '../../global_widgets/graph/percentage_graph.dart';
import '../../global_widgets/loading/loading_page.dart';
import 'widgets/phone_button.dart';

class MapDetailPage extends StatelessWidget {
  MapDetailPage({
    Key? key,
  }) : super(key: key);
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    MapDetailPageController _controller = Get.find();

    return Obx(
      () => (!_controller.dataInitialized.value)
          ? LoadingPage()
          : Scaffold(
              backgroundColor: WcColors.white,
              body: SafeArea(
                child: NestedScrollView(
                  // controller: _controller.pageScrollController,
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
          PhoneCallButton(phoneNumber: _controller.placeDetail.value.phone),
          SizedBox(
            width: 10,
          ),
          WcWideButtonWidget(
              buttonText: '이 장소 리뷰쓰기',
              onTap: () => _controller.goToNewReviewPage(placeSelected: true),
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
                        image: _controller
                            .placeDetail.value.thumbnailImage.getImageByType,
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) => Container(
                              child: SvgPicture.asset(
                                  'assets/icons/withconi_grey.svg'),
                            ))),
              ),
              Positioned(
                left: 15,
                top: 13,
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
                              color: WcColors.grey120.withOpacity(0.8),
                              blurRadius: 5,
                              offset: Offset(0, 3),
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
                top: 13,
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
                    _controller.placeDetail.value.name,
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
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    _controller.openHourInfo.value =
                                        !_controller.openHourInfo.value;
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 21,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '토요일 09:00~18:00',
                                              style: TextStyle(
                                                  height: 1.2,
                                                  fontSize: 15,
                                                  fontFamily:
                                                      WcFontFamily.notoSans),
                                              softWrap: false,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            RotatedBox(
                                              quarterTurns: (_controller
                                                      .openHourInfo.value)
                                                  ? 2
                                                  : 0,
                                              child: SvgPicture.asset(
                                                'assets/icons/arrow_down.svg',
                                                width: 13,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Offstage(
                                        offstage:
                                            !_controller.openHourInfo.value,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Column(
                                            children: [
                                              Text(
                                                '토요일 09:00~18:00',
                                                style: TextStyle(
                                                    height: 1,
                                                    fontSize: 15,
                                                    fontFamily:
                                                        WcFontFamily.notoSans),
                                                softWrap: false,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),

                            // AnimatedSize(
                            //   curve: Curves.fastOutSlowIn,
                            //   duration: const Duration(milliseconds: 500),
                            //   reverseDuration:
                            //       const Duration(milliseconds: 500),
                            //   child: Container(
                            //     height:
                            //         (_controller.isBusinessHourInfoOpen.value)
                            //             ? 100
                            //             : 0,
                            //     margin: EdgeInsets.only(
                            //       left: 12,
                            //     ),
                            //     padding: EdgeInsets.symmetric(vertical: 10),
                            //     width: 200,
                            //     child: Column(
                            //       children: [
                            //         Text('토요일 09:00~18:00'),
                            //         Text('토요일 09:00~18:00'),
                            //         Text('토요일 09:00~18:00'),
                            //         Text('토요일 09:00~18:00'),
                            //       ],
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      Container(
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
                            Obx(
                              () => InkWell(
                                onTap: () {
                                  _controller.openDetailAddress.value =
                                      !_controller.openDetailAddress.value;
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        constraints: BoxConstraints(
                                            maxWidth: WcWidth - 148),
                                        child: Text(
                                          _controller.placeDetail.value.address,
                                          softWrap: (_controller
                                                  .openDetailAddress.value)
                                              ? true
                                              : false,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(height: 1.2),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 2),
                                        child: RotatedBox(
                                          quarterTurns: (_controller
                                                  .openDetailAddress.value)
                                              ? 2
                                              : 0,
                                          child: SvgPicture.asset(
                                            'assets/icons/arrow_down.svg',
                                            width: 13,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                    text:
                                        _controller.placeDetail.value.address));

                                showCustomSnackbar(text: '주소가 복사되었어요');
                              },
                              child: Container(
                                color: WcColors.white,
                                padding: EdgeInsets.only(
                                    top: 1, left: 10, right: 20),
                                child: SvgPicture.asset(
                                  'assets/icons/copy.svg',
                                  width: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_controller.placeDetail.value.phone.isNotEmpty) {
                            Clipboard.setData(ClipboardData(
                                text: _controller.placeDetail.value.phone));

                            showCustomSnackbar(text: '전화번호가 복사되었어요');
                          }
                        },
                        child: SizedBox(
                          height: 30,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/phone.svg'),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                (_controller.placeDetail.value.phone.isEmpty)
                                    ? '정보없음'
                                    : '${_controller.placeDetail.value.phone}',
                                style: TextStyle(height: 1.3),
                              ),
                            ],
                          ),
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
            tabs: [
              Container(
                  width: 140,
                  child: Tab(
                    height: 55,
                    child: Text(
                      '정보',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontSize: 16,
                          height: 1,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
              Container(
                  width: 140,
                  child: Tab(
                    child: Text(
                      '리뷰',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontSize: 16,
                          height: 1,
                          fontWeight: FontWeight.w500),
                    ),
                    height: 55,
                  )),
            ],
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
                          fontSize: 17.5),
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
                    Obx(
                      () => PercentageGraph(
                        graphWidth: WcWidth - 70,
                        graphDataList: _controller
                            .placeDetail.value.speciesChartData
                            .map((chartData) => PercentageGraphData(
                                graphColor: chartData.color,
                                percent: chartData.percent))
                            .toList(),
                      ),
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
                SizedBox(
                  height: 5,
                ),
                Obx(
                  () => Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _controller.placeDetail.value.speciesChartData
                          .map(
                            (conimalData) => Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  conimalData.title,
                                  style: TextStyle(
                                      fontFamily: WcFontFamily.notoSans,
                                      fontSize: 15,
                                      height: 1,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${conimalData.percent.round()}%',
                                  style: GoogleFonts.workSans(
                                      height: 1,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
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
                      fontSize: 17.5),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Card(
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
                            sections: (_controller
                                    .placeDetail.value.diseaseChartData.isEmpty)
                                ? [
                                    PieChartSectionData(
                                        color: WcColors.grey80,
                                        value: 100,
                                        title: '',
                                        radius: 30,
                                        showTitle: false)
                                  ]
                                : _controller.placeDetail.value.diseaseChartData
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
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Visibility(
                    visible: _controller
                        .placeDetail.value.diseaseHistoryList.isNotEmpty,
                    replacement: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '아직 방문 데이터가 없네요.',
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                fontSize: 18,
                                height: 1.5,
                                color: WcColors.grey180,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '리뷰를 통해 첫 방문자가 되어주시겠어요?',
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                fontSize: 15,
                                height: 1.8,
                                color: WcColors.grey140,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    child: Column(
                      children: _controller.placeDetail.value.diseaseHistoryList
                          .map(
                            (diseaseHistory) => CustomExpansionTile(
                                textColor: WcColors.black,
                                collapsedIconColor: WcColors.grey160,
                                iconColor: WcColors.grey160,
                                collapsedTextColor: WcColors.black,
                                tilePadding: EdgeInsets.all(0),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 13,
                                          height: 13,
                                          decoration: BoxDecoration(
                                              color: diseaseHistory
                                                  .diseaseType.color,
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                        ),
                                        SizedBox(
                                          width: 13,
                                        ),
                                        Text(
                                          diseaseHistory
                                              .diseaseType.displayName,
                                          style: TextStyle(
                                              fontFamily: WcFontFamily.notoSans,
                                              fontSize: 16,
                                              height: 1.2,
                                              fontWeight: FontWeight.w500,
                                              color: WcColors.grey200),
                                        ),
                                      ],
                                    ),
                                    Text.rich(
                                      TextSpan(children: [
                                        TextSpan(
                                            text:
                                                '${diseaseHistory.totalDiseaseType} ',
                                            style: GoogleFonts.workSans(
                                              fontSize: 16,
                                              height: 1,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        TextSpan(
                                          text: '마리',
                                        )
                                      ]),
                                      style: TextStyle(
                                        fontFamily: WcFontFamily.notoSans,
                                        fontSize: 15,
                                        height: 1,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 46, 47, 48),
                                      ),
                                    ),
                                  ],
                                ),
                                children: diseaseHistory.diseaseTypeItemList
                                    .map(
                                      (item) => Container(
                                          margin: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              right: 40,
                                              left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                  child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20),
                                                child: Text(
                                                  item.diseaseName,
                                                  softWrap: false,
                                                ),
                                              )),
                                              Text(
                                                item.diseasePercent.toString() +
                                                    '%',
                                                style: GoogleFonts.workSans(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          )),
                                    )
                                    .toList()),
                          )
                          .toList(),
                    ),
                  ),
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
                          width: 8,
                        ),
                        Obx(
                          () => Text(
                            _controller.placeDetail.value.totalReviewCount
                                .toString(),
                            style: GoogleFonts.workSans(
                                height: 1.5,
                                fontWeight: FontWeight.w600,
                                color: WcColors.grey180,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    Offstage(
                      offstage: !_controller.showReviewHistory.value,
                      child: GestureDetector(
                        onTap: () =>
                            _controller.goToNewReviewPage(placeSelected: true),
                        child: Container(
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
                        ),
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
                          graphDataList: _controller
                              .placeDetail.value.reviewChartData
                              .map((chartData) => PercentageGraphData(
                                  graphColor: chartData.color,
                                  percent: chartData.percent.toInt()))
                              .toList(),
                        ),
                        CustomCheckBox(
                          value: _controller.onlyPhotoReview.value,
                          isSelected: _controller.onlyPhotoReview.value,
                          onChanged: (selected) {
                            _controller.onOnlyVerifiedReviewChanged(!selected);
                          },
                          text: '사진인증된 리뷰만 보기',
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
                          children: ReviewRate.values.map((reviewRate) {
                            return ExpansionPanelRadio(
                              value: reviewRate,
                              canTapOnHeader: true,
                              headerBuilder: (context, isExpanded) => SizedBox(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      reviewRate.activeIconSrc,
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      reviewRate.displayName,
                                      style: TextStyle(
                                          fontFamily: WcFontFamily.notoSans,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Obx(
                                      () => Text(
                                        '${_controller.placeDetail.value.reviewHistoryMap[reviewRate]!.totalReviewRateCount}',
                                        style: GoogleFonts.workSans(
                                            fontSize: 16,
                                            height: 1.2,
                                            fontWeight: FontWeight.w400,
                                            color: WcColors.grey180),
                                      ),
                                    ),
                                    Text(
                                      '명',
                                      style: TextStyle(
                                          fontFamily: WcFontFamily.notoSans,
                                          fontSize: 15,
                                          height: 1.25,
                                          fontWeight: FontWeight.w400,
                                          color: WcColors.grey180),
                                    )
                                  ],
                                ),
                              ),
                              body: Obx(
                                () => Column(
                                  children:
                                      reviewRate.reviewItems.map((reviewItem) {
                                    return Container(
                                        margin: EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            right: 30,
                                            left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(reviewItem
                                                .displayText(reviewRate)),
                                            Container(
                                              height: 22,
                                              width: 45,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: WcColors.grey40,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Text(
                                                '${_controller.placeDetail.value.reviewHistoryMap[reviewRate]!.reviewHistoryMap[reviewItem]}',
                                                style: GoogleFonts.workSans(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: WcColors.grey180),
                                              ),
                                            ),
                                          ],
                                        ));
                                  }).toList(),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),

                  // Container(
                  //   padding: EdgeInsets.only(left: 20),
                  //   child: Column(
                  //     children: [
                  //       ExpansionPanelList.radio(
                  //         elevation: 0,
                  //         dividerColor: Colors.transparent,
                  //         expandedHeaderPadding: EdgeInsets.all(0),
                  //         children: _controller.placeDetail.reviewHistoryList
                  //             .map((e) {
                  //           return e.when(
                  //               high: (reviewRate, totalRateType,
                  //                       reviewHistoryItems) =>
                  //                   ExpansionPanelRadio(
                  //                       value: _controller
                  //                           .placeDetail.reviewHistoryList
                  //                           .indexOf(e),
                  //                       canTapOnHeader: true,
                  //                       headerBuilder: (context, isExpanded) =>
                  //                           SizedBox(
                  //                             child: Row(
                  //                               children: [
                  //                                 SvgPicture.asset(
                  //                                   reviewRate.activeIconSrc,
                  //                                   width: 25,
                  //                                 ),
                  //                                 SizedBox(
                  //                                   width: 8,
                  //                                 ),
                  //                                 Text(
                  //                                   reviewRate.displayName,
                  //                                   style: TextStyle(
                  //                                       fontFamily: WcFontFamily
                  //                                           .notoSans,
                  //                                       fontSize: 15,
                  //                                       fontWeight:
                  //                                           FontWeight.w500),
                  //                                 ),
                  //                                 SizedBox(
                  //                                   width: 8,
                  //                                 ),
                  //                                 Text(
                  //                                   '$totalRateType',
                  //                                   style: GoogleFonts.workSans(
                  //                                       fontSize: 16,
                  //                                       height: 1.2,
                  //                                       fontWeight:
                  //                                           FontWeight.w400,
                  //                                       color:
                  //                                           WcColors.grey180),
                  //                                 ),
                  //                                 Text(
                  //                                   '명',
                  //                                   style: TextStyle(
                  //                                       fontFamily: WcFontFamily
                  //                                           .notoSans,
                  //                                       fontSize: 15,
                  //                                       height: 1.25,
                  //                                       fontWeight:
                  //                                           FontWeight.w400,
                  //                                       color:
                  //                                           WcColors.grey180),
                  //                                 )
                  //                               ],
                  //                             ),
                  //                           ),
                  //                       body: Column(
                  //                         children: HighRateReviewItem.values
                  //                             .map(
                  //                               (itemKey) => Container(
                  //                                   margin: EdgeInsets.only(
                  //                                       top: 10,
                  //                                       bottom: 10,
                  //                                       right: 30,
                  //                                       left: 10),
                  //                                   child: Row(
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment
                  //                                             .spaceBetween,
                  //                                     crossAxisAlignment:
                  //                                         CrossAxisAlignment
                  //                                             .center,
                  //                                     children: [
                  //                                       Text(itemKey
                  //                                           .displayText),
                  //                                       Container(
                  //                                         height: 22,
                  //                                         width: 45,
                  //                                         alignment:
                  //                                             Alignment.center,
                  //                                         decoration: BoxDecoration(
                  //                                             color: WcColors
                  //                                                 .grey40,
                  //                                             borderRadius:
                  //                                                 BorderRadius
                  //                                                     .circular(
                  //                                                         15)),
                  //                                         child: Text(
                  //                                           '${reviewHistoryItems[itemKey] ?? 0}',
                  //                                           style: GoogleFonts.workSans(
                  //                                               fontSize: 14,
                  //                                               fontWeight:
                  //                                                   FontWeight
                  //                                                       .w500,
                  //                                               color: WcColors
                  //                                                   .grey180),
                  //                                         ),
                  //                                       ),
                  //                                     ],
                  //                                   )),
                  //                             )
                  //                             .toList(),
                  //                       )),
                  //               middle: (reviewRate, totalRateType,
                  //                       reviewHistoryItems) =>
                  //                   ExpansionPanelRadio(
                  //                       value: _controller
                  //                           .placeDetail.reviewHistoryList
                  //                           .indexOf(e),
                  //                       canTapOnHeader: true,
                  //                       headerBuilder: (context, isExpanded) =>
                  //                           SizedBox(
                  //                             child: Row(
                  //                               children: [
                  //                                 SvgPicture.asset(
                  //                                   e.activeIconSrc,
                  //                                   width: 25,
                  //                                 ),
                  //                                 SizedBox(
                  //                                   width: 8,
                  //                                 ),
                  //                                 Text(
                  //                                   e.text,
                  //                                   style: TextStyle(
                  //                                       fontFamily: WcFontFamily
                  //                                           .notoSans,
                  //                                       fontSize: 15,
                  //                                       fontWeight:
                  //                                           FontWeight.w500),
                  //                                 ),
                  //                                 SizedBox(
                  //                                   width: 8,
                  //                                 ),
                  //                                 Text(
                  //                                   '${e.reviewNum}',
                  //                                   style: GoogleFonts.workSans(
                  //                                       fontSize: 16,
                  //                                       height: 1.2,
                  //                                       fontWeight:
                  //                                           FontWeight.w400,
                  //                                       color:
                  //                                           WcColors.grey180),
                  //                                 ),
                  //                                 Text(
                  //                                   '명',
                  //                                   style: TextStyle(
                  //                                       fontFamily: WcFontFamily
                  //                                           .notoSans,
                  //                                       fontSize: 15,
                  //                                       height: 1.25,
                  //                                       fontWeight:
                  //                                           FontWeight.w400,
                  //                                       color:
                  //                                           WcColors.grey180),
                  //                                 )
                  //                               ],
                  //                             ),
                  //                           ),
                  //                       body: Column(
                  //                         children: e.reviewItemsMap.keys
                  //                             .map(
                  //                               (itemKey) => Container(
                  //                                   margin: EdgeInsets.only(
                  //                                       top: 10,
                  //                                       bottom: 10,
                  //                                       right: 30,
                  //                                       left: 10),
                  //                                   child: Row(
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment
                  //                                             .spaceBetween,
                  //                                     crossAxisAlignment:
                  //                                         CrossAxisAlignment
                  //                                             .center,
                  //                                     children: [
                  //                                       Text(e
                  //                                           .reviewItemsToString(
                  //                                               itemKey)),
                  //                                       Container(
                  //                                         height: 22,
                  //                                         width: 45,
                  //                                         alignment:
                  //                                             Alignment.center,
                  //                                         decoration: BoxDecoration(
                  //                                             color: WcColors
                  //                                                 .grey40,
                  //                                             borderRadius:
                  //                                                 BorderRadius
                  //                                                     .circular(
                  //                                                         15)),
                  //                                         child: Text(
                  //                                           '${e.reviewItemsMap[itemKey]}',
                  //                                           style: GoogleFonts.workSans(
                  //                                               fontSize: 14,
                  //                                               fontWeight:
                  //                                                   FontWeight
                  //                                                       .w500,
                  //                                               color: WcColors
                  //                                                   .grey180),
                  //                                         ),
                  //                                       ),
                  //                                     ],
                  //                                   )),
                  //                             )
                  //                             .toList(),
                  //                       )),
                  //               low: low);
                  //         }).toList(),
                  //       ),
                  //       SizedBox(
                  //         height: 20,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              Obx(
                () => Visibility(
                  visible: !_controller.showReviewHistory.value,
                  child: Positioned(
                    top: 0,
                    child: Container(
                      height: 380,
                      width: WcWidth,
                      color: Colors.transparent,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: -6),
                        child: Container(
                          alignment: Alignment.center,
                          color: WcColors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  // visible: !AuthController.to.userInfo!.isWrittenReview,
                  visible: !_controller.showReviewHistory.value,
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(text: '리뷰 '),
                                TextSpan(
                                    text: '1',
                                    style: GoogleFonts.workSans(
                                        fontSize: 17,
                                        color: WcColors.blue100,
                                        fontWeight: FontWeight.w500)),
                                TextSpan(text: '개만 남기면 모든 리뷰를 볼 수 있어요.'),
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
                                onTap: () => _controller.goToNewReviewPage(
                                    placeSelected: false),
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
                                      color: WcColors.black,
                                      fontWeight: FontWeight.w500,
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
                                      color: WcColors.black,
                                      fontWeight: FontWeight.w500,
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
                                      color: WcColors.black,
                                      fontWeight: FontWeight.w500,
                                    )),
                                TextSpan(text: '이 됩니다.'),
                              ]),
                              style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                color: WcColors.grey180,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )),
                  ),
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
                  color: WcColors.grey120.withOpacity(0.8),
                  blurRadius: 5,
                  offset: Offset(0, 3),
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
