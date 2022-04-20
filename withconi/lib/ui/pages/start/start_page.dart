import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/routes/withconi_routes.dart';
import 'package:withconi/ui/pages/start/widgets/sns_button.dart';
import 'package:withconi/ui/theme/colors.dart';
import 'package:withconi/ui/theme/sizes.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import 'package:withconi/ui/widgets/text_field/textfield.dart';

import '../../widgets/text_field/label_textfield.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

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
                  height: 75,
                ),
                Image.asset(
                  'assets/icons/withconi.png',
                  height: 51,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '함께 코니멀의\n질병관리를 시작해볼까요?',
                  style: GoogleFonts.notoSans(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 60,
                ),
                WcTextFieldWidget(
                  hintText: '이메일을 입력해주세요',
                  onChanged: (String) {},
                  textController: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 40,
                ),
                WcWideButtonWidget(
                  active: true,
                  activeButtonColor: blue100,
                  activeTextColor: white,
                  buttonText: '다음',
                  buttonWidth: WcWidth - 40,
                  onTap: () {
                    Get.toNamed(Routes.SIGNUP_NAME_PW);
                  },
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SnsButtonWidget(
                        imageSrc: 'assets/icons/kakao.png',
                        label: '카카오톡',
                        onTap: () {},
                      ),
                      SnsButtonWidget(
                        imageSrc: 'assets/icons/google.png',
                        label: '구글',
                        onTap: () {},
                      ),
                      SnsButtonWidget(
                        imageSrc: 'assets/icons/naver.png',
                        label: '네이버',
                        onTap: () {},
                      ),
                      SnsButtonWidget(
                        imageSrc: 'assets/icons/apple.png',
                        label: '애플',
                        onTap: () {},
                      ),
                    ],
                  ),
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
