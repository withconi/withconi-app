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

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChangePasswordController _controller = Get.find();
    return Obx(
      () => WillPopScope(
        onWillPop: (!_controller.isPasswardEmailSent.value)
            ? null
            : () async {
                return Future.value(false);
              },
        child: GestureDetector(
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
                      // SizedBox(
                      //   width: 55,
                      //   child: Image.asset(
                      //     'assets/icons/send_mail.png',
                      //   ),
                      // ),

                      Icon(
                        Icons.lock_rounded,
                        color: WcColors.blue100,
                        size: 55,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        '비밀번호를\n재설정할까요?',
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            height: 1.4),
                      ),
                      const SizedBox(
                        height: 30,
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
                              style: GoogleFonts.workSans(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: ' 으로\n비밀번호 재설정 링크를 전송하여\n비밀번호를 변경할 수 있습니다.',
                              // style: TextStyle(height: 1.5),
                            ),
                          ],
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontSize: 15,
                                  color: WcColors.black,
                                  height: 1.5))),
                      const SizedBox(
                        height: 60,
                      ),

                      Obx(
                        () => WcWideButtonWidget(
                          active: !_controller.isPasswardEmailSent.value,
                          activeButtonColor: WcColors.blue100,
                          activeTextColor: WcColors.white,
                          buttonText: '비밀번호 재설정하기',
                          buttonWidth: WcWidth - 40,
                          onTap: _controller.sendVerificationEmail,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => WcWideButtonWidget(
                          active: _controller.isPasswardEmailSent.value,
                          activeButtonColor: WcColors.blue100,
                          activeTextColor: WcColors.white,
                          buttonText: '다시 로그인하기',
                          buttonWidth: WcWidth - 40,
                          onTap: _controller.goToStartPage,
                        ),
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
        ),
      ),
    );
  }
}
