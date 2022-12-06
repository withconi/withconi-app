import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/module/theme/colors.dart';
import 'package:withconi/module/theme/sizes.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'controllers/change_password_page2_controller.dart';
import 'controllers/email_verification_controller.dart';

class ChangePasswordPage2 extends StatelessWidget {
  const ChangePasswordPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChangePasswordController2 _controller = Get.find();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                    width: 60,
                    child: Image.asset(
                      'assets/icons/send_mail.png',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    '비밀번호 재설정\n전송 완료',
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        height: 1.4),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  RichText(
                      text: TextSpan(
                          children: [
                        TextSpan(
                          text: _controller.email,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        TextSpan(
                          text: ' 으로\n비밀번호 재설정 링크가 전송되었어요.\n',
                          // style: TextStyle(height: 1.5),
                        ),
                        TextSpan(
                          text: '새로운 비밀번호로 변경한 후\n다시 로그인해주세요.',
                          // style: TextStyle(height: 1.5),
                        ),
                      ],
                          style: TextStyle(
                              fontSize: 15,
                              color: WcColors.black,
                              height: 1.5))),
                  const SizedBox(
                    height: 60,
                  ),
                  WcWideButtonWidget(
                    active: true,
                    activeButtonColor: WcColors.blue100,
                    activeTextColor: WcColors.white,
                    buttonText: '다시 로그인하기',
                    buttonWidth: WcWidth - 40,
                    onTap: _controller.goToSignIn,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
