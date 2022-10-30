import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/controller/home/home_controller.dart';
import 'package:withconi/controller/navigation_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/pages/home/widgets/conimal_setting_button.dart';
import 'package:withconi/module/pages/home/widgets/cominal_toggle_button.dart';
import 'package:withconi/module/pages/home/widgets/hot_post_listtile.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/module/widgets/button/icon_button.dart';
import '../../../data/model/board.dart';
import '../../../data/model/post.dart';
import '../../widgets/dialog/selection_dialog.dart';
import '../../widgets/navbar/bottom_navbar.dart';
import 'widgets/icon_big_button.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  // HomeController _controller = Get.find(tag: 'Initial');
  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.find(tag: 'Initial');
    double heightSection1 = (WcHeight / 7) * 2.67;
    double heightSection3 = (WcHeight / 7) * 3.2;
    double maxSection1Height = 285;

    return Scaffold(
      body: SafeArea(
        top: true,
        child: RefreshIndicator(
          strokeWidth: 2.5,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          color: WcColors.blue100,
          onRefresh: _controller.refreshPage,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: (heightSection1 > maxSection1Height)
                      ? maxSection1Height
                      : heightSection1,
                  child: Stack(children: [
                    Container(
                        height: (heightSection1 > maxSection1Height)
                            ? maxSection1Height - 35
                            : heightSection1 - 35,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20, top: 10),
                                  child: Image.asset(
                                    'assets/icons/withconi.png',
                                    width: 34,
                                    isAntiAlias: true,
                                    // color: WcColors.grey180.withOpacity(0.6),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 5, top: 10),
                                  child: WcIconButton(
                                      active: true,
                                      onTap: () {
                                        Get.toNamed(Routes.SETTING_MAIN);
                                      },
                                      iconSrc: 'assets/icons/user.svg',
                                      touchHeight: 30,
                                      touchWidth: 50,
                                      iconHeight: 23,
                                      iconMainAxisAlignment:
                                          MainAxisAlignment.center,
                                      activeIconColor:
                                          WcColors.grey140.withOpacity(0.8),
                                      inactiveIconColor: WcColors.grey140),
                                )
                              ],
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 40, right: 40, bottom: 25),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Obx(
                                              () => Text.rich(
                                                TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: _controller
                                                          .selectedConimal
                                                          .value!
                                                          .name,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    TextSpan(
                                                        text: '와\n함께한지',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                WcFontFamily
                                                                    .notoSans,
                                                            height: 1.4,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: WcColors
                                                                .black)),
                                                  ],
                                                ),
                                                style: TextStyle(
                                                    fontFamily:
                                                        WcFontFamily.notoSans,
                                                    fontSize: 21,
                                                    height: 1.4,
                                                    fontWeight: FontWeight.w500,
                                                    color: WcColors.black),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 13,
                                            ),
                                            Obx(
                                              () => Text.rich(
                                                TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text:
                                                            '+${_controller.daysAfterAdoption.value}',
                                                        style: GoogleFonts
                                                            .openSans(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                height: 1.3)),
                                                    TextSpan(
                                                      text: '일째',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          height: 1.3,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Obx(
                                          () => Image.asset(
                                            (_controller.selectedConimal.value!
                                                        .species ==
                                                    Species.cat)
                                                ? 'assets/icons/cat_black.png'
                                                : 'assets/icons/dog.png',
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
                      child: Obx(
                        () => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _controller.conimalList
                                  .map(
                                    (element) => Row(
                                      children: [
                                        ConimalToggleButton(
                                          backgroundColor: WcColors.grey60,
                                          index: _controller.conimalList
                                              .indexOf(element),
                                          selectedIndex: _controller
                                              .selectedConimalIndex.value,
                                          species: element.species,
                                          onTap: () {
                                            _controller
                                                .onSelectedConimalChanged(
                                                    _controller.conimalList
                                                        .indexOf(element));
                                          },
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2),
                              child: ConimalSettingButton(
                                onTap: _controller.manageConimal,
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
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 15, bottom: 4),
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
                                      _controller.isExpansionOneOpened.value =
                                          value;
                                    },
                                    textColor: WcColors.black,
                                    iconColor: WcColors.black,
                                    tilePadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 16),
                                    backgroundColor: Colors.transparent,
                                    title: Text(
                                        '${_controller.selectedConimal.value!.name}의 관리중인 질병 ${_controller.selectedConimal.value!.diseases.length}개',
                                        style: TextStyle(
                                            fontFamily: WcFontFamily.notoSans,
                                            fontSize: 15.5,
                                            height: 1,
                                            fontWeight: (_controller
                                                    .isExpansionOneOpened.value)
                                                ? FontWeight.w500
                                                : FontWeight.w400,
                                            color: WcColors.black)),
                                    children: [
                                      Column(
                                        children: [
                                          Column(
                                              children: _controller
                                                  .selectedConimal
                                                  .value!
                                                  .diseases
                                                  .map(
                                                    (disease) => ListTile(
                                                      title: InkWell(
                                                        onTap: () {
                                                          Get.toNamed(
                                                              Routes
                                                                  .DICTIONARY_DETAIL,
                                                              arguments:
                                                                  disease);
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 40,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 8),
                                                            child: Text(
                                                              disease.name,
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                              style: GoogleFonts
                                                                  .notoSans(
                                                                fontSize: 14.5,
                                                              ),
                                                              maxLines: 1,
                                                              softWrap: false,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      trailing: SizedBox(
                                                        width: 100,
                                                        height: 27,
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              WcIconButton(
                                                                onTap: () {
                                                                  print('asdf');
                                                                },
                                                                iconSrc:
                                                                    'assets/icons/info.svg',
                                                                activeIconColor:
                                                                    WcColors
                                                                        .grey120,
                                                                inactiveIconColor:
                                                                    WcColors
                                                                        .grey120,
                                                                iconMainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              InkWell(
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 27,
                                                                  width: 60,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: WcColors
                                                                        .blue100,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      5,
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                    '커뮤니티',
                                                                    style: GoogleFonts.notoSans(
                                                                        color: WcColors
                                                                            .white,
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                ),
                                                              ),
                                                            ]),
                                                      ),
                                                    ),
                                                  )
                                                  .toList()),
                                          (_controller.selectedConimal.value!
                                                      .diseases.length <
                                                  4)
                                              ? GestureDetector(
                                                  onTap: () {
                                                    _controller.addDisease(
                                                        selectedConimal:
                                                            _controller
                                                                .selectedConimal
                                                                .value!);
                                                  },
                                                  child: ListTile(
                                                    title: GestureDetector(
                                                      child: SizedBox(
                                                        width: (WcWidth - 40),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8),
                                                          child: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                'assets/icons/add_button.svg',
                                                                height: 30,
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                '질병 추가',
                                                                style: GoogleFonts.notoSans(
                                                                    fontSize:
                                                                        14.5,
                                                                    color: WcColors
                                                                        .grey200),
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
                              data: ThemeData()
                                  .copyWith(dividerColor: Colors.transparent),
                              child: Obx(
                                () => IgnorePointer(
                                  ignoring: _controller.allDiseasesList.isEmpty,
                                  child: ExpansionTile(
                                      onExpansionChanged: (value) {
                                        _controller.isExpansionTwoOpened.value =
                                            value;
                                      },
                                      textColor: WcColors.black,
                                      iconColor: WcColors.black,
                                      tilePadding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 16),
                                      backgroundColor: Colors.transparent,
                                      title: Text.rich(
                                          TextSpan(children: [
                                            TextSpan(
                                                text: (_controller
                                                        .allDiseasesList
                                                        .isEmpty)
                                                    ? '관리중인 질병 없음'
                                                    : '총 관리중인 질병 종류 ${_controller.allDiseasesList.length}개'),
                                          ]),
                                          style: TextStyle(
                                              height: 1,
                                              fontFamily: WcFontFamily.notoSans,
                                              fontSize: 15.5,
                                              fontWeight: (_controller
                                                      .isExpansionTwoOpened
                                                      .value)
                                                  ? FontWeight.w500
                                                  : FontWeight.w400,
                                              color: WcColors.black)),
                                      children: (_controller
                                              .allDiseasesList.isEmpty)
                                          ? [SizedBox.shrink()]
                                          : _controller.allDiseasesList
                                              .map(
                                                (disease) => ListTile(
                                                  title: InkWell(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          Routes
                                                              .DICTIONARY_DETAIL,
                                                          arguments: disease);
                                                    },
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 40,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8),
                                                          child: Text(
                                                            disease.name,
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                            style: GoogleFonts
                                                                .notoSans(
                                                                    fontSize:
                                                                        14.5,
                                                                    height: 1),
                                                            softWrap: false,
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
                                                          // WcTextButton(
                                                          //   text: '질병백과',
                                                          // ),
                                                          WcIconButton(
                                                            onTap: () {
                                                              print('asdf');
                                                            },
                                                            iconSrc:
                                                                'assets/icons/info.svg',
                                                            activeIconColor:
                                                                WcColors
                                                                    .grey120,
                                                            inactiveIconColor:
                                                                WcColors
                                                                    .grey120,
                                                            iconMainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          InkWell(
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 27,
                                                              width: 60,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: WcColors
                                                                    .blue100,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  5,
                                                                ),
                                                              ),
                                                              child: Text(
                                                                '커뮤니티',
                                                                style: GoogleFonts
                                                                    .notoSans(
                                                                        color: WcColors
                                                                            .white,
                                                                        fontSize:
                                                                            12),
                                                              ),
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                ),
                                              )
                                              .toList()),
                                ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text('이번주 커뮤니티 인기글',
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                fontSize: 16.5,
                                fontWeight: FontWeight.w600,
                                color: WcColors.black)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                          children: _controller.hotPostList
                              .map((e) => HotPostListTile(
                                    post: e,
                                  ))
                              .toList())
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
