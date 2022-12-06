import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/module/theme/colors.dart';
import 'package:withconi/module/theme/sizes.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'controllers/change_password_controller.dart';
import 'controllers/email_verification_controller.dart';

class ChangePasswordPage1 extends StatelessWidget {
  const ChangePasswordPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChangePasswordController _controller = Get.find();
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
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
                    width: 60,
                    child: Image.asset(
                      'assets/icons/send_mail.png',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    '비밀번호를\n변경할까요?',
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        height: 1.4),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  // Text(
                  //   '${_controller.email}',
                  //   style: TextStyle(height: 1.5),
                  // ),
                  // Text(
                  //   '로 전송된\n비밀번호 재설정 링크를 통해\n비밀번호를 변경할 수 있습니다.',
                  //   style: TextStyle(height: 1.5),
                  // ),
                  RichText(
                      text: TextSpan(
                          children: [
                        TextSpan(
                          text: _controller.email,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        TextSpan(
                          text: ' 으로 전송된\n비밀번호 재설정 링크를 통해\n비밀번호를 변경할 수 있습니다.',
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
                    buttonText: '비밀번호 재설정 메일 보내기',
                    buttonWidth: WcWidth - 40,
                    onTap: _controller.sendVerificationEmail,
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
