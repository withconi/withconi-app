import 'package:lottie/lottie.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/module/widgets/button/wide_button.dart';

import '../../../controller/navigation_controller.dart';

import '../../widgets/navbar/bottom_navbar.dart';

class DiagnosisMainPage extends StatelessWidget {
  const DiagnosisMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WcColors.white,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: SizedBox(
            width: WcWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 45,
                ),
                SizedBox(
                  width: WcWidth - 40,
                  child: Text('자가진단',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontWeight: FontWeight.w600,
                          fontSize: 24)),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: WcWidth - 40,
                  child: Text('간단한 증상을 입력하면\n의심되는 질병을 보여줘요.',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          color: WcColors.grey180,
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 80),
                      height: 200,
                      child: LottieBuilder.asset(
                        'assets/json/health_care.json',
                        fit: BoxFit.contain,
                        repeat: false,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: WcWideButtonWidget(
                        buttonText: '자가진단 시작',
                        onTap: () {
                          Get.toNamed(Routes.DIAGNOSIS_STEP1);
                        },
                        active: true,
                        buttonWidth: WcWidth - 40,
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
