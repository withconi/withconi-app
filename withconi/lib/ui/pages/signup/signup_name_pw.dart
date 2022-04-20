import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/routes/withconi_routes.dart';
import 'package:withconi/ui/theme/colors.dart';
import 'package:withconi/ui/theme/sizes.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import '../../widgets/text_field/label_textfield.dart';

class SignupPageNamePw extends StatelessWidget {
  const SignupPageNamePw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  height: 45,
                ),
                Text(
                  '비밀번호와 이름을\n입력해주세요',
                  style: GoogleFonts.notoSans(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 50,
                ),
                WcLabelTextFieldWidget(
                  labelText: '이메일',
                  hintText: '이메일',
                  onChanged: (String) {},
                  textController: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 30,
                ),
                WcLabelTextFieldWidget(
                  labelText: '비밀번호',
                  hintText: '비밀번호',
                  onChanged: (String) {},
                  textController: TextEditingController(),
                  keyboardType: TextInputType.visiblePassword,
                  textObscure: true,
                ),
                SizedBox(
                  height: 30,
                ),
                WcLabelTextFieldWidget(
                  hintText: '비밀번호 확인',
                  labelText: '비밀번호 확인',
                  onChanged: (String) {},
                  textController: TextEditingController(),
                  keyboardType: TextInputType.visiblePassword,
                  textObscure: true,
                ),
                SizedBox(
                  height: 30,
                ),
                WcLabelTextFieldWidget(
                  labelText: '이름',
                  hintText: '이름',
                  onChanged: (String) {},
                  textController: TextEditingController(),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 60,
                ),
                WcWideButtonWidget(
                  active: true,
                  activeButtonColor: blue100,
                  activeTextColor: white,
                  buttonText: '다음',
                  buttonWidth: WcWidth - 40,
                  onTap: () {
                    Get.toNamed(Routes.SIGNUP_CONIMAL_STEP1);
                  },
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
