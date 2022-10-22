import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/ui/theme/colors.dart';
import 'package:withconi/ui/theme/sizes.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import '../../../controller/common_controller/email_verification_controller.dart';

class EmailVerificationPage extends StatelessWidget {
  EmailVerificationPage({Key? key}) : super(key: key);
  final EmailVerificationController _controller =
      Get.put(EmailVerificationController());
  @override
  Widget build(BuildContext context) {
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
                    width: 60,
                    child: Image.asset(
                      'assets/icons/send_mail.png',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    '이메일 인증을\n완료해주세요',
                    style: GoogleFonts.notoSans(
                        fontSize: 25, fontWeight: FontWeight.w600, height: 1.4),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Text('${_controller.email}로 \n인증 메일이 전송되었어요.'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('비밀번호 찾기와 회원정보 수정에는\n이메일 인증이 필요해요.'),
                  const SizedBox(
                    height: 50,
                  ),
                  WcWideButtonWidget(
                    active: true,
                    activeButtonColor: WcColors.blue100,
                    activeTextColor: WcColors.white,
                    buttonText: '이메일 인증완료',
                    buttonWidth: WcWidth - 40,
                    onTap: () {
                      _controller.checkEmailVerified();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  WcWideButtonWidget(
                    active: true,
                    activeButtonColor: WcColors.grey80,
                    activeTextColor: WcColors.grey180,
                    buttonText: '인증메일 재전송',
                    buttonWidth: WcWidth - 40,
                    onTap: () {
                      _controller.resendVerificationEmail();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        _controller.skipEmailVerification();
                      },
                      child: Container(
                        width: 80,
                        height: 35,
                        color: WcColors.white,
                        child: Column(
                          children: [
                            const Text('다음에 하기'),
                            Container(
                              width: 70,
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
