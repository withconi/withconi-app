import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/ui/theme/colors.dart';
import 'package:withconi/ui/theme/sizes.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import '../../widgets/button/textfield_button.dart';
import '../../widgets/text_field/label_textfield.dart';

class SignupPageConimalStep1 extends StatelessWidget {
  const SignupPageConimalStep1({Key? key}) : super(key: key);

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
                  '강지혜님과 함께하는\n코니멀에 대해 알려주세요',
                  style: GoogleFonts.notoSans(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 50,
                ),
                WcLabelTextFieldWidget(
                  labelText: '이름',
                  hintText: '이름',
                  onChanged: (String) {},
                  textController: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 30,
                ),
                WcLabelTextFieldWidget(
                  labelText: '나이',
                  hintText: '나이',
                  onChanged: (String) {},
                  textController: TextEditingController(),
                  keyboardType: TextInputType.visiblePassword,
                  textObscure: true,
                ),
                SizedBox(
                  height: 30,
                ),
                WcTextFieldButtonWidget(
                  hintText: '입양일',
                  labelText: '입양일',
                  onChanged: (String) {},
                  textController: TextEditingController(),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                WcTextFieldButtonWidget(
                  labelText: '질병 검색',
                  hintText: '질병 검색',
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
                  onTap: () {},
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
