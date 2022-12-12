import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/module/signup/controllers/signup_pw_controller.dart';
import 'package:withconi/module/theme/colors.dart';
import 'package:withconi/module/theme/sizes.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import '../../../global_widgets/text_field/textfield.dart';
import '../../theme/text_theme.dart';

class SignupPwPage extends StatelessWidget {
  SignupPwPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SignupPwController _controller = Get.find();

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
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
                      '비밀번호를\n설정해주세요',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    WcTextField(
                      enabled: false,
                      labelText: '',
                      hintText: '이메일',
                      onChanged: (String) {},
                      isEng: true,
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
                    Obx(() {
                      return WcTextField(
                        errorText: _controller.confirmPasswordErrorText.value,
                        hintText: '비밀번호 확인',
                        labelText: '비밀번호 확인',
                        onChanged: _controller.onConfirmPasswordChanged,
                        textController:
                            _controller.confirmPasswordTextController,
                        keyboardType: TextInputType.visiblePassword,
                        textObscure: true,
                      );
                    }),
                    const SizedBox(
                      height: 60,
                    ),
                    Obx(() {
                      return WcWideButtonWidget(
                        active: _controller.validateButton(),
                        activeButtonColor: WcColors.blue100,
                        activeTextColor: WcColors.white,
                        buttonText: '다음',
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
      ),
    );
  }
}
