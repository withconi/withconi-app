import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:withconi/module/theme/colors.dart';
import 'package:withconi/module/theme/sizes.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'controllers/email_verification_controller.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EmailVerificationController _controller = Get.find();
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
          child: SizedBox(
            height: WcHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 75,
                  ),
                  SizedBox(
                    width: 55,
                    child: Image.asset(
                      'assets/icons/send_mail.png',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    '이메일 인증을\n진행해주세요',
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        height: 1.4),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Text('${_controller.email}으로',
                  //     style: GoogleFonts.workSans(
                  //         fontSize: 17, fontWeight: FontWeight.w500)),

                  // Text(
                  //   '로 인증 코드가 전송되었어요.',
                  //   style: TextStyle(
                  //       fontFamily: WcFontFamily.notoSans,
                  //       fontSize: 15,
                  //       color: WcColors.black),
                  // ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: '${_controller.email}',
                            style: GoogleFonts.workSans(
                                fontSize: 17, fontWeight: FontWeight.w500)),
                        TextSpan(
                          text: '으로\n6자리의 인증 코드가 전송되었어요.',
                        ),
                        TextSpan(
                          text: '\n회원정보 수정에는 이메일 인증이 반드시 필요해요.',
                        ),
                      ],
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontSize: 15,
                          height: 1.7,
                          color: WcColors.black),
                    ),
                  ),
                  // const Text('회원정보 수정에는 이메일 인증이 반드시 필요해요.'),
                  const SizedBox(
                    height: 30,
                  ),
                  PinCodeTextField(
                    onCompleted: _controller.onPinCodeCompleted,
                    textStyle: GoogleFonts.workSans(
                      fontSize: 23,
                    ),
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                        selectedColor: WcColors.grey120,
                        inactiveColor: WcColors.grey100,
                        activeColor: WcColors.blue100),
                    appContext: context,
                    length: 6,
                    onChanged: _controller.onPinCodeChanged,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  Obx(
                    () => Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        _controller.timeCountText.value,
                        textAlign: TextAlign.right,
                        style: GoogleFonts.workSans(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: WcColors.black),
                      ),
                    ),
                  ),

                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // const Text('비밀번호 찾기와 회원정보 수정에는\n이메일 인증이 반드시 필요해요.'),
                  const SizedBox(
                    height: 20,
                  ),
                  // WcWideButtonWidget(
                  //   active: true,
                  //   activeButtonColor: WcColors.blue100,
                  //   activeTextColor: WcColors.white,
                  //   buttonText: '이메일 인증완료',
                  //   buttonWidth: WcWidth - 40,
                  //   onTap: null,
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => WcWideButtonWidget(
                      active: _controller.isResendButtonValid.value,
                      activeButtonColor: WcColors.blue100,
                      activeTextColor: WcColors.white,
                      buttonText: '인증메일 재전송',
                      buttonWidth: WcWidth - 40,
                      onTap: _controller.resendVerificationEmail,
                    ),
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: _controller.skipEmailVerification,
                      child: Container(
                        width: 89,
                        height: 35,
                        color: WcColors.white,
                        child: Column(
                          children: [
                            const Text(
                              '다음에 하기',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  color: WcColors.grey140,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Container(
                              width: 76,
                              height: 1,
                              color: WcColors.grey140,
                            )
                          ],
                        ),
                      ),
                    ),
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
