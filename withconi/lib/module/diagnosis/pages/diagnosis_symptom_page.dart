import 'package:withconi/module/diagnosis/controllers/diagnosis_symptom_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/home/home_page.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/global_widgets/button/check_icon_selection_button.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import 'package:withconi/global_widgets/checkbox/custom_checkbox.dart';
import 'package:withconi/global_widgets/loading/loading_page.dart';
import '../controllers/diagnosis_step2_controller.dart';
import '../../../global_widgets/button/text_button.dart';
import '../../signup/widgets/gender_toggle_button.dart';

class DiagnosisSymptomPage extends StatelessWidget {
  const DiagnosisSymptomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DiagnosisSymptomController _controller = Get.find();

    return Scaffold(
      appBar: WcAppBar(
        title: '',
        onActionTap: _controller.getBack,
        action: Text(
          '완료',
          style: TextStyle(
              fontFamily: WcFontFamily.notoSans,
              fontSize: 17,
              color: WcColors.blue100,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Obx(
        () => (_controller.isLoading.value)
            ? LoadingPage()
            : SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'assets/icons/diagnosis/symptoms_${_controller.symptom.codeENG}.png',
                          height: 80,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_controller.symptom.displayName}이상',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '1개 이상의 증상을 선택해주세요',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontSize: 17,
                                  height: 2,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: _controller.symptomList
                                  .map(
                                    (symptom) => Obx(
                                      () => SymptomItemButton(
                                        onTap: _controller.onSymptomItemTap,
                                        selected: _controller
                                            .selectedSymptomItemList
                                            .contains(symptom),
                                        symptomItemText: symptom,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            // WcWideButtonWidget(
                            //   active: false,
                            //   activeButtonColor: WcColors.blue100,
                            //   activeTextColor: WcColors.white,
                            //   buttonText: '선택완료',
                            //   buttonWidth: WcWidth(context) - 40,
                            //   onTap: () {},
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class SymptomItemButton extends StatelessWidget {
  SymptomItemButton({
    Key? key,
    required this.symptomItemText,
    required this.selected,
    required this.onTap,
  }) : super(key: key);
  String symptomItemText;
  bool selected;
  void Function(String) onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call(symptomItemText);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: (selected) ? WcColors.blue100 : WcColors.grey80,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          symptomItemText,
          style: TextStyle(
              fontFamily: WcFontFamily.notoSans,
              fontSize: 16,
              height: 1.3,
              color: (selected) ? WcColors.white : WcColors.grey200,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
