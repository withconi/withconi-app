import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/controller/signup/signup_name_pw_controller.dart';
import 'package:withconi/routes/withconi_routes.dart';
import 'package:withconi/ui/theme/colors.dart';
import 'package:withconi/ui/theme/sizes.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import '../../widgets/text_field/label_textfield.dart';

class SignupPageNamePw extends StatelessWidget {
  SignupPageNamePw({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SignUpNamePWController _controller = Get.put(SignUpNamePWController());

    return Scaffold(
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
                  height: 45,
                ),
                Text(
                  '비밀번호와 이름을\n입력해주세요',
                  style: GoogleFonts.notoSans(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 45,
                ),
                WcLabelTextField(
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
                  return WcLabelTextField(
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
                  return WcLabelTextField(
                    errorText: _controller.confirmPasswordErrorText.value,
                    hintText: '비밀번호 확인',
                    labelText: '비밀번호 확인',
                    onChanged: _controller.onConfirmPasswordChanged,
                    textController: _controller.confirmPasswordTextController,
                    keyboardType: TextInputType.visiblePassword,
                    textObscure: true,
                  );
                }),
                const SizedBox(
                  height: 24,
                ),
                Obx(() {
                  return WcLabelTextField(
                    errorText: _controller.nameErrorText.value,
                    labelText: '이름',
                    hintText: '이름',
                    onChanged: _controller.onNameChanged,
                    textController: _controller.nameTextController,
                    keyboardType: TextInputType.name,
                  );
                }),
                const SizedBox(
                  height: 60,
                ),
                Obx(() {
                  return WcWideButtonWidget(
                    active: _controller.validateButton(),
                    activeButtonColor: blue100,
                    activeTextColor: white,
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
    );
  }
}
