import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:withconi/data/enums/enum.dart';

import 'package:withconi/import_basic.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/button/check_icon_selection_button.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import 'package:withconi/global_widgets/checkbox/custom_checkbox.dart';
import '../controllers/diagnosis_step2_controller.dart';
import '../../../global_widgets/button/text_button.dart';
import '../../signup/widgets/gender_toggle_button.dart';

class DiagnosisStep2Page extends StatelessWidget {
  const DiagnosisStep2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DiagnosisStep2Controller _controller = Get.find();

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: SizedBox(
              width: WcWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 25,
                  ),
                  Obx(
                    () => LinearPercentIndicator(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        barRadius: Radius.circular(10),
                        lineHeight: 5.0,
                        percent: _controller.progressPercents.value,
                        progressColor: WcColors.blue100,
                        backgroundColor: WcColors.grey80),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      '관찰한 부위별\n증상을 골라주세요',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 15,
                          runSpacing: 20,
                          children: Symptom.values
                              .map(
                                (symptom) => Obx(
                                  () => SymptomButton(
                                    selected: _controller
                                        .selectedSymptomGroupList
                                        .any((element) =>
                                            element.symptomType == symptom),
                                    symptom: symptom,
                                    onTap: (symptom) {
                                      _controller
                                          .goToSymptomSelectionPage(symptom);
                                    },
                                  ),
                                ),
                              )
                              .toList()),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: WcWideButtonWidget(
                        active: _controller.isButtonValid.value,
                        activeButtonColor: WcColors.blue100,
                        activeTextColor: WcColors.white,
                        buttonText: '분석하기',
                        buttonWidth: WcWidth - 40,
                        onTap: _controller.goToDiagnosisResultPage,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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

class SymptomButton extends StatelessWidget {
  SymptomButton({
    Key? key,
    required this.symptom,
    required this.selected,
    required this.onTap,
  }) : super(key: key);
  Symptom symptom;
  bool selected;
  void Function(Symptom) onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onTap.call(symptom);
          },
          child: Opacity(
            opacity: (selected) ? 1 : 0.7,
            child: ColorFiltered(
              colorFilter: (selected)
                  ? ColorFilter.mode(Colors.transparent, BlendMode.color)
                  : ColorFilter.matrix(<double>[
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                    ]),
              child: Image.asset(
                'assets/icons/diagnosis/symptoms_${symptom.codeENG}.png',
                height: 100,
              ),
            ),
          ),
        ),
        Text(
          '${symptom.displayName}이상',
          style: TextStyle(
              fontFamily: WcFontFamily.notoSans,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: (selected) ? WcColors.black : WcColors.grey140),
        )
      ],
    );
  }
}
