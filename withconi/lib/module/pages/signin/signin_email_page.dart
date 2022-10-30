import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/controller/signin/signin_email_controller.dart';
import 'package:withconi/controller/signup/signup_pw_controller.dart';
import 'package:withconi/module/theme/colors.dart';
import 'package:withconi/module/theme/sizes.dart';
import 'package:withconi/module/widgets/button/wide_button.dart';
import '../../widgets/text_field/textfield.dart';

class SigninEmailPage extends StatelessWidget {
  SigninEmailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SigninEmailController _controller = Get.put(SigninEmailController());

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: WcHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 45,
                  ),
                  Text(
                    '로그인을 위해\n비밀번호를 입력해주세요',
                    style: GoogleFonts.notoSans(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  WcTextField(
                    enabled: false,
                    labelText: '',
                    hintText: '이메일',
                    onChanged: (String) {},
                    textController: _controller.emailTextController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return WcTextField(
                      errorText: _controller.passwordErrorText.value,
                      hintText: '비밀번호',
                      labelText: '비밀번호',
                      onChanged: _controller.onPasswordChanged,
                      textController: _controller.passwordTextController,
                      keyboardType: TextInputType.visiblePassword,
                      textObscure: true,
                    );
                  }),
                  const SizedBox(
                    height: 24,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Obx(() {
                    return WcWideButtonWidget(
                      active: _controller.validateButton(),
                      activeButtonColor: WcColors.blue100,
                      activeTextColor: WcColors.white,
                      buttonText: '로그인',
                      buttonWidth: WcWidth - 40,
                      onTap: (_controller.isButtonValid.value)
                          ? _controller.nextStep
                          : null,
                    );
                  }),
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
