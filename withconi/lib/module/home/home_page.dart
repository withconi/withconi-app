import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/home/home_controller.dart';
import 'package:withconi/module/navigation/navigation_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/home/widgets/conimal_setting_button.dart';
import 'package:withconi/module/home/widgets/cominal_toggle_button.dart';
import 'package:withconi/module/home/widgets/hot_post_listtile.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/button/icon_button.dart';

class HomePage extends StatelessWidget {
  const HomePage([Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _controller = Get.find();
    final double _heightSection1 = (WcHeight / 7) * 2.67;
    const double _maxSection1Height = 285;

    return Scaffold(
      body: SafeArea(
        top: true,
        child: RefreshIndicator(
          strokeWidth: 2.5,
          backgroundColor: Color.fromARGB(255, 248, 249, 249),
          color: WcColors.blue100,
          onRefresh: _controller.refreshPage,
          child: Obx(
            () => (_controller.isLoading.value)
                ? SizedBox.shrink()
                : SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: (_heightSection1 > _maxSection1Height)
                              ? _maxSection1Height
                              : _heightSection1,
                          child: Stack(children: [
                            Container(
                                height: (_heightSection1 > _maxSection1Height)
                                    ? _maxSection1Height - 35
                                    : _heightSection1 - 35,
                                width: WcWidth,
                                decoration: const BoxDecoration(
                                  color: WcColors.white,
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(23),
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(15, 0, 0, 0),
                                      spreadRadius: 0,
                                      blurRadius: 15,
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20, top: 10),
                                          child: Image.asset(
                                            'assets/icons/withconi.png',
                                            width: 34,
                                            isAntiAlias: true,
                                            // color: WcColors.grey180.withOpacity(0.6),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 5, top: 10),
                                          child: WcIconButton(
                                              active: true,
                                              onTap: () {
                                                Get.toNamed(
                                                    Routes.SETTING_MAIN);
                                              },
                                              iconSrc: 'assets/icons/user.svg',
                                              touchHeight: 30,
                                              touchWidth: 50,
                                              iconHeight: 23,
                                              iconMainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              activeIconColor: WcColors.grey140
                                                  .withOpacity(0.8),
                                              inactiveIconColor:
                                                  WcColors.grey140),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 40, right: 40, bottom: 25),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                (_controller
                                                        .conimalList.isEmpty)
                                                    ? Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text('등록된 코니멀이\n없습니다',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      WcFontFamily
                                                                          .notoSans,
                                                                  height: 1.4,
                                                                  fontSize: 22,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: WcColors
                                                                      .grey200)),
                                                          SizedBox(
                                                            height: 12,
                                                          ),
                                                          Text('아이콘을 눌러 등록해보세요',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      WcFontFamily
                                                                          .notoSans,
                                                                  height: 1.4,
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: WcColors
                                                                      .grey200)),
                                                        ],
                                                      )
                                                    : Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text.rich(
                                                            TextSpan(
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                  text: (_controller
                                                                          .conimalList
                                                                          .isEmpty)
                                                                      ? ''
                                                                      : _controller
                                                                          .conimalList[_controller
                                                                              .selectedConimalIndex
                                                                              .value]
                                                                          .name,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                                TextSpan(
                                                                    text:
                                                                        '와\n함께한지',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            WcFontFamily
                                                                                .notoSans,
                                                                        height:
                                                                            1.4,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color: WcColors
                                                                            .black)),
                                                              ],
                                                            ),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    WcFontFamily
                                                                        .notoSans,
                                                                fontSize: 21.5,
                                                                height: 1.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: WcColors
                                                                    .black),
                                                          ),
                                                          const SizedBox(
                                                            height: 13,
                                                          ),
                                                          Text.rich(
                                                            TextSpan(
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                    text:
                                                                        '+${_controller.conimalList[_controller.selectedConimalIndex.value].daysAfterAdoption}',
                                                                    style: GoogleFonts.workSans(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        height:
                                                                            1.3)),
                                                                TextSpan(
                                                                  text: '일째',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      height:
                                                                          1.3,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                GestureDetector(
                                                  onTap: _controller
                                                      .goToManageConimalPage,
                                                  child: Image.asset(
                                                    (_controller.conimalList
                                                            .isEmpty)
                                                        ? 'assets/icons/withconi_grey.png'
                                                        : _controller
                                                            .conimalList[_controller
                                                                .selectedConimalIndex
                                                                .value]
                                                            .species!
                                                            .imageSrc,
                                                    height: 85,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Positioned(
                              bottom: 7,
                              right: 20,
                              child: Container(
                                height: 55,
                                child: Row(
                                  children: [
                                    Obx(
                                      () => ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              _controller.conimalList.length,
                                          itemBuilder: ((context, index) =>
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                child: ConimalToggleButton(
                                                  backgroundColor:
                                                      WcColors.grey60,
                                                  index: index,
                                                  selectedIndex: _controller
                                                      .selectedConimalIndex
                                                      .value,
                                                  species: _controller
                                                      .conimalList[index]
                                                      .species!,
                                                  onTap: () {
                                                    _controller
                                                        .onSelectedConimalChanged(
                                                            index);
                                                  },
                                                ),
                                              ))),
                                    ),
                                    Offstage(
                                      offstage: _controller.conimalList.isEmpty,
                                      child: ConimalSettingButton(
                                        onTap:
                                            _controller.goToManageConimalPage,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ),

                        Container(
                          width: WcWidth - 40,
                          margin: const EdgeInsets.fromLTRB(20, 7, 20, 3),
                          decoration: BoxDecoration(
                            color: WcColors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              // BoxShadow(
                              //   color: Color.fromARGB(40, 0, 0, 0),
                              //   spreadRadius: -3,
                              //   blurRadius: 9,
                              //   offset: Offset(0, 2),
                              // ),
                              BoxShadow(
                                color: Color.fromARGB(25, 0, 0, 0),
                                spreadRadius: -2,
                                blurRadius: 30,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 15, top: 15, bottom: 4),
                                child: Text('내 코니멀의 질병',
                                    style: TextStyle(
                                        fontFamily: WcFontFamily.notoSans,
                                        fontSize: 16.5,
                                        fontWeight: FontWeight.w600,
                                        color: WcColors.black)),
                              ),
                              ListTileTheme(
                                dense: true,
                                child: ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    Theme(
                                      data: ThemeData().copyWith(
                                        dividerColor: Colors.transparent,
                                      ),
                                      child: Obx(
                                        () => ExpansionTile(
                                            onExpansionChanged: (value) {
                                              _controller.isExpansionOneOpened
                                                  .value = value;
                                            },
                                            textColor: WcColors.black,
                                            iconColor: WcColors.black,
                                            tilePadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 16),
                                            backgroundColor: Colors.transparent,
                                            title: (_controller
                                                    .conimalList.isEmpty)
                                                ? Text('관리중인 코니멀 없음',
                                                    style: TextStyle(
                                                        fontFamily: WcFontFamily
                                                            .notoSans,
                                                        fontSize: 15.5,
                                                        height: 1.3,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            WcColors.grey200))
                                                : RichText(
                                                    text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                              text:
                                                                  '${_controller.conimalList[_controller.selectedConimalIndex.value].name}',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      WcFontFamily
                                                                          .notoSans,
                                                                  fontSize:
                                                                      15.5,
                                                                  height: 1,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: WcColors
                                                                      .black)),
                                                          TextSpan(
                                                              text:
                                                                  '의 관리중인 질병'),
                                                          TextSpan(
                                                              text:
                                                                  ' ${_controller.conimalList[_controller.selectedConimalIndex.value].diseases.length}',
                                                              style: GoogleFonts.workSans(
                                                                  height: 1.5,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: WcColors
                                                                      .black,
                                                                  fontSize:
                                                                      16)),
                                                          TextSpan(text: '개')
                                                        ],
                                                        style: TextStyle(
                                                            fontFamily:
                                                                WcFontFamily
                                                                    .notoSans,
                                                            fontSize: 15.5,
                                                            height: 1.5,
                                                            fontWeight: (_controller
                                                                    .isExpansionOneOpened
                                                                    .value)
                                                                ? FontWeight
                                                                    .w500
                                                                : FontWeight
                                                                    .w400,
                                                            color: (_controller
                                                                    .conimalList
                                                                    .isEmpty)
                                                                ? WcColors
                                                                    .grey160
                                                                : WcColors
                                                                    .grey200)),
                                                  ),

                                            // : Text(
                                            //     (_controller.conimalList
                                            //             .isEmpty)
                                            //         ? '관리중인 코니멀 없음'
                                            //         : '${_controller.conimalList[_controller.selectedConimalIndex.value].name}의 관리중인 질병 ${_controller.conimalList[_controller.selectedConimalIndex.value].diseases.length}개',

                                            children: [
                                              Column(
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: (_controller
                                                              .conimalList
                                                              .isEmpty)
                                                          ? []
                                                          : _controller
                                                              .conimalList[
                                                                  _controller
                                                                      .selectedConimalIndex
                                                                      .value]
                                                              .diseases
                                                              .map(
                                                                (disease) =>
                                                                    ListTile(
                                                                  title:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      _controller
                                                                          .goToDictionaryDetailPage(
                                                                              disease);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      height:
                                                                          40,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 8),
                                                                        child:
                                                                            Text(
                                                                          disease
                                                                              .name,
                                                                          overflow:
                                                                              TextOverflow.fade,
                                                                          style:
                                                                              GoogleFonts.notoSans(
                                                                            fontSize:
                                                                                14.5,
                                                                          ),
                                                                          maxLines:
                                                                              1,
                                                                          softWrap:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  trailing:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      _controller.deleteDisease(
                                                                          _controller
                                                                              .selectedConimalIndex
                                                                              .value,
                                                                          disease);
                                                                    },
                                                                    child:
                                                                        SizedBox(
                                                                      width: 20,
                                                                      height:
                                                                          30,
                                                                      child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            // WcIconButton(
                                                                            //   onTap:
                                                                            //       () {
                                                                            //     print('asdf');
                                                                            //   },
                                                                            //   touchWidth:
                                                                            //       20,
                                                                            //   iconSrc:
                                                                            //       'assets/icons/info.svg',
                                                                            //   activeIconColor:
                                                                            //       WcColors.grey120.withOpacity(0.7),
                                                                            //   inactiveIconColor:
                                                                            //       WcColors.grey120.withOpacity(0.7),
                                                                            //   iconMainAxisAlignment:
                                                                            //       MainAxisAlignment.start,
                                                                            // ),
                                                                            // Icon(
                                                                            //   Icons.remove_circle_rounded,
                                                                            //   color: WcColors.red100.withOpacity(0.7),
                                                                            //   size: 20,
                                                                            // ),

                                                                            SvgPicture.asset(
                                                                              'assets/icons/minus.svg',
                                                                              height: 20,
                                                                            )

                                                                            // InkWell(
                                                                            //   onTap: () =>
                                                                            //       Get.toNamed(
                                                                            //     Routes.COMMUNITY_POST_LIST,
                                                                            //   ),
                                                                            //   child:
                                                                            //       Container(
                                                                            //     alignment: Alignment.center,
                                                                            //     height: 27,
                                                                            //     width: 60,
                                                                            //     decoration: BoxDecoration(
                                                                            //       color: WcColors.grey110,
                                                                            //       borderRadius: BorderRadius.circular(
                                                                            //         5,
                                                                            //       ),
                                                                            //     ),
                                                                            //     child: Text(
                                                                            //       '커뮤니티',
                                                                            //       style: TextStyle(fontFamily: WcFontFamily.notoSans, color: WcColors.black, fontSize: 12, fontWeight: FontWeight.w500, height: 1),
                                                                            //     ),
                                                                            //   ),
                                                                            // ),
                                                                          ]),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                              .toList()),
                                                  (_controller.conimalList
                                                              .isNotEmpty &&
                                                          _controller
                                                                  .conimalList[
                                                                      _controller
                                                                          .selectedConimalIndex
                                                                          .value]
                                                                  .diseases
                                                                  .length <
                                                              3)
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            _controller.addDisease(
                                                                _controller
                                                                    .selectedConimalIndex
                                                                    .value);
                                                          },
                                                          child: ListTile(
                                                            title:
                                                                GestureDetector(
                                                              child: SizedBox(
                                                                width:
                                                                    (WcWidth -
                                                                        40),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 8),
                                                                  child: Row(
                                                                    children: [
                                                                      SvgPicture
                                                                          .asset(
                                                                        'assets/icons/add_button.svg',
                                                                        height:
                                                                            29,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        '질병 추가',
                                                                        style: GoogleFonts.notoSans(
                                                                            fontSize:
                                                                                14.5,
                                                                            color:
                                                                                WcColors.grey200),
                                                                        // overflow: TextOverflow.ellipsis,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox.shrink()
                                                ],
                                              )
                                            ]),
                                      ),
                                    ),
                                    Theme(
                                      data: ThemeData().copyWith(
                                          dividerColor: Colors.transparent),
                                      child: Obx(
                                        () => ExpansionTile(
                                            onExpansionChanged: (value) {
                                              _controller.isExpansionTwoOpened
                                                  .value = value;
                                            },
                                            textColor: WcColors.black,
                                            iconColor: WcColors.black,
                                            tilePadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 16),
                                            backgroundColor: Colors.transparent,
                                            title: RichText(
                                              text: TextSpan(
                                                  children: [
                                                    TextSpan(text: '관련 질병 게시판'),
                                                    TextSpan(
                                                        text:
                                                            ' ${_controller.relatedBoardList.length}',
                                                        style: GoogleFonts
                                                            .workSans(
                                                                height: 1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: WcColors
                                                                    .black,
                                                                fontSize: 16)),
                                                    TextSpan(text: '개')
                                                  ],
                                                  style: TextStyle(
                                                      fontFamily:
                                                          WcFontFamily.notoSans,
                                                      fontSize: 15.5,
                                                      height: 1,
                                                      fontWeight: (_controller
                                                              .isExpansionTwoOpened
                                                              .value)
                                                          ? FontWeight.w500
                                                          : FontWeight.w400,
                                                      color: (_controller
                                                              .conimalList
                                                              .isEmpty)
                                                          ? WcColors.grey160
                                                          : WcColors.grey200)),
                                            ),
                                            children:
                                                _controller.relatedBoardList
                                                    .map(
                                                      (board) => ListTile(
                                                        title: InkWell(
                                                          onTap: () {
                                                            Get.toNamed(
                                                                Routes
                                                                    .COMMUNITY_POST_LIST,
                                                                arguments:
                                                                    board);
                                                          },
                                                          child: Container(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              height: 40,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            8),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          10,
                                                                      width: 10,
                                                                      decoration: BoxDecoration(
                                                                          color: board
                                                                              .diseaseType
                                                                              .color,
                                                                          borderRadius:
                                                                              BorderRadius.circular(2)),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                      '${board.title}',
                                                                      overflow:
                                                                          TextOverflow
                                                                              .fade,
                                                                      style: TextStyle(
                                                                          fontFamily: WcFontFamily
                                                                              .notoSans,
                                                                          fontSize:
                                                                              14.5,
                                                                          height:
                                                                              1,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                      softWrap:
                                                                          false,
                                                                    ),
                                                                    Text(
                                                                      ' 질환 게시판',
                                                                      overflow:
                                                                          TextOverflow
                                                                              .fade,
                                                                      style: TextStyle(
                                                                          fontFamily: WcFontFamily
                                                                              .notoSans,
                                                                          fontSize:
                                                                              14.5,
                                                                          height:
                                                                              1,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                      softWrap:
                                                                          false,
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                        ),
                                                        trailing: SizedBox(
                                                          width: 100,
                                                          height: 40,
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () => Get.toNamed(
                                                                      Routes
                                                                          .COMMUNITY_POST_LIST,
                                                                      arguments:
                                                                          board),
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    height: 30,
                                                                    width: 100,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: WcColors
                                                                          .grey80,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                        5,
                                                                      ),
                                                                    ),
                                                                    child: Text(
                                                                      '게시판 바로가기',
                                                                      style: TextStyle(
                                                                          fontFamily: WcFontFamily
                                                                              .notoSans,
                                                                          color: WcColors
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          height:
                                                                              1),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                      ),
                                                    )
                                                    .toList()),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SelfDiagnosisButton(),

                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          width: WcWidth - 40,
                          decoration: BoxDecoration(
                            color: WcColors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(25, 0, 0, 0),
                                spreadRadius: -1,
                                blurRadius: 20,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text('이번주 커뮤니티 인기글 🔥',
                                    style: TextStyle(
                                        fontFamily: WcFontFamily.notoSans,
                                        fontSize: 16.5,
                                        fontWeight: FontWeight.w600,
                                        color: WcColors.black)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: _controller.hotPostList.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      HotPostListTile(
                                        hotPost: _controller.hotPostList[index],
                                        onPostTap:
                                            _controller.goToPostDetailPage,
                                      ))
                            ],
                          ),
                        ),
                        // Container(
                        //   width: WcWidth,
                        //   height: heightSection3,
                        //   // color: WcColors.blue100,
                        //   padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       Column(
                        //         children: [
                        //           SizedBox(
                        //             child: Row(
                        //               children: [
                        //                 Expanded(
                        //                   flex: 1,
                        //                   child: IconBigButton(
                        //                     imageSrc: 'assets/icons/diagnosis.png',
                        //                     text: '자가진단',
                        //                     onTap: () {
                        //                       // NavigationController.to
                        //                       //     .onNavChanged(currentNavIndex: 1);
                        //                     },
                        //                   ),
                        //                 ),
                        //                 const SizedBox(
                        //                   width: 10,
                        //                 ),
                        //                 Expanded(
                        //                   flex: 1,
                        //                   child: IconBigButton(
                        //                     imageSrc: 'assets/icons/location.png',
                        //                     text: '병원/약국찾기',
                        //                     onTap: () {
                        //                       showSelectionDialog(
                        //                           confirmText: '네',
                        //                           title: '정보를 수정할까요?',
                        //                           subtitle: '변경된 정보를 저장합니다.',
                        //                           cancleText: '아니요');
                        //                     },
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             height: 10,
                        //           ),
                        //           Row(
                        //             children: [
                        //               Expanded(
                        //                 flex: 1,
                        //                 child: IconBigButton(
                        //                   imageSrc: 'assets/icons/community.png',
                        //                   text: '커뮤니티',
                        //                   onTap: () {
                        //                     // NavigationController.to
                        //                     //     .onNavChanged(currentNavIndex: 3);
                        //                   },
                        //                 ),
                        //               ),
                        //               const SizedBox(
                        //                 width: 10,
                        //               ),
                        //               Expanded(
                        //                 flex: 1,
                        //                 child: IconBigButton(
                        //                   imageSrc: 'assets/icons/dictionary.png',
                        //                   text: '질병백과',
                        //                   onTap: () {
                        //                     // NavigationController.to
                        //                     //     .onNavChanged(currentNavIndex: 4);
                        //                   },
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class SelfDiagnosisButton extends StatelessWidget {
  const SelfDiagnosisButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DIAGNOSIS_MAIN);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 60,
        width: WcWidth - 40,
        decoration: BoxDecoration(
          color: WcColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(25, 0, 0, 0),
              spreadRadius: -1,
              blurRadius: 20,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    'assets/icons/cross.png',
                    color: Color.fromARGB(255, 0, 64, 215),
                    height: 15,
                  ),
                  radius: 15,
                  backgroundColor: WcColors.blue60,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('코니멀 자가진단하기',
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 16.5,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 0, 80, 177))),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(right: 3),
                child: SvgPicture.asset('assets/icons/arrow_right.svg',
                    color: Color.fromARGB(255, 0, 80, 177)))
          ],
        ),
      ),
    );
  }
}

class WcTextButton extends StatelessWidget {
  WcTextButton(
      {Key? key,
      this.height = 27,
      this.width = 60,
      required this.text,
      this.textSize = 12,
      this.textWeight = FontWeight.w500,
      this.onTap,
      this.active = true,
      this.activeButtonColor = WcColors.blue100,
      this.activeTextColor = WcColors.white,
      this.inactiveButtonColor = WcColors.grey100,
      this.inactiveTextColor = WcColors.grey180})
      : super(key: key);

  double height;
  double width;

  String text;

  double textSize;
  FontWeight textWeight;
  void Function()? onTap;
  bool active;
  Color activeButtonColor;
  Color inactiveButtonColor;
  Color activeTextColor;
  Color inactiveTextColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: (active) ? activeButtonColor : inactiveButtonColor,
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.notoSans(
              color: (active) ? activeTextColor : inactiveTextColor,
              fontSize: textSize,
              fontWeight: textWeight),
        ),
      ),
    );
  }
}
