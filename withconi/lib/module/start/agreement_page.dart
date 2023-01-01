// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/start/agreement_controller.dart';
import 'package:withconi/module/start/start_controller.dart';
import 'package:withconi/module/start/start_widgets/sns_button.dart';
import 'package:withconi/module/theme/colors.dart';
import 'package:withconi/module/theme/sizes.dart';
import 'package:withconi/module/theme/text_theme.dart';
import '../../global_widgets/button/state_button.dart';
import '../../global_widgets/text_field/textfield.dart';

class AgreementPage extends StatelessWidget {
  AgreementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AgreementController _controller = Get.put(AgreementController());

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            constraints: BoxConstraints(minHeight: WcHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icons/withconi.png',
                        height: 45,
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      const Text(
                        '위드코니 이용을 위해 다음과\n같은 접근 권한이 필요해요.',
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            fontSize: 26,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),

                  // const SizedBox(
                  //   height: 70,
                  // ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 50, top: 38),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '필수 수집 데이터',
                                style: TextStyle(
                                    fontFamily: WcFontFamily.notoSans,
                                    fontSize: 15,
                                    height: 1,
                                    color: WcColors.grey100,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 23,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 13),
                                    child: SvgPicture.asset(
                                      'assets/icons/check.svg',
                                      height: 16,
                                      color: WcColors.blue100,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '이메일 및 이름',
                                        style: TextStyle(
                                            fontFamily: WcFontFamily.notoSans,
                                            fontSize: 16,
                                            height: 1,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        '회원가입/로그인 사용자 식별',
                                        style: TextStyle(
                                            fontFamily: WcFontFamily.notoSans,
                                            fontSize: 14,
                                            height: 1,
                                            color: WcColors.grey140,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '선택 접근 권한',
                                style: TextStyle(
                                    fontFamily: WcFontFamily.notoSans,
                                    fontSize: 15,
                                    height: 1,
                                    color: WcColors.grey100,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 13),
                                    child: SvgPicture.asset(
                                      'assets/icons/check.svg',
                                      height: 16,
                                      color: WcColors.blue100,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '위치',
                                        style: TextStyle(
                                            fontFamily: WcFontFamily.notoSans,
                                            fontSize: 16,
                                            height: 1,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        '동물병원/약국 찾기 시 이용',
                                        style: TextStyle(
                                            fontFamily: WcFontFamily.notoSans,
                                            fontSize: 14,
                                            height: 1,
                                            color: WcColors.grey140,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 23,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 13),
                                    child: SvgPicture.asset(
                                      'assets/icons/check.svg',
                                      height: 16,
                                      color: WcColors.blue100,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '카메라',
                                        style: TextStyle(
                                            fontFamily: WcFontFamily.notoSans,
                                            fontSize: 16,
                                            height: 1,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        '게시물 작성 시 이용',
                                        style: TextStyle(
                                            fontFamily: WcFontFamily.notoSans,
                                            fontSize: 14,
                                            height: 1,
                                            color: WcColors.grey140,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 23,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 13),
                                    child: SvgPicture.asset(
                                      'assets/icons/check.svg',
                                      height: 16,
                                      color: WcColors.blue100,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '사진/미디어/파일',
                                        style: TextStyle(
                                            fontFamily: WcFontFamily.notoSans,
                                            fontSize: 16,
                                            height: 1,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        '게시물 작성 시 이용',
                                        style: TextStyle(
                                            fontFamily: WcFontFamily.notoSans,
                                            fontSize: 14,
                                            height: 1,
                                            color: WcColors.grey140,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  WcWideButtonWidget(
                      buttonText: '위드코니 시작하기',
                      onTap: _controller.onStartWithconiTap,
                      active: true),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
