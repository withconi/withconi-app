import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/constants/enum_color.dart';
import 'package:withconi/configs/constants/enum_icon.dart';
import 'package:withconi/controller/diagnosis_controller/diagnosis_step1_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/theme/text_theme.dart';
import 'package:withconi/ui/widgets/button/check_icon_selection_button.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import 'package:withconi/ui/widgets/checkbox/custom_checkbox.dart';
import '../../../controller/diagnosis_controller/diagnosis_step2_controller.dart';
import '../../widgets/button/text_button.dart';
import '../signup/signup_widgets/gender_toggle_button.dart';

class DiagnosisStep2Page extends StatelessWidget {
  const DiagnosisStep2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DiagnosisStep2Controller _controller = Get.put(DiagnosisStep2Controller());

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
                          spacing: 10,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: WcWideButtonWidget(
                      active: _controller.validateButton(),
                      activeButtonColor: WcColors.blue100,
                      activeTextColor: WcColors.white,
                      buttonText: '다음',
                      buttonWidth: WcWidth - 40,
                      onTap: () {},
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
                'assets/icons/diagnosis/symptoms_${symptomsToValue(symptom)}.png',
                height: 100,
              ),
            ),
          ),
        ),
        Text(
          '${symptomsToKorean(symptom)}이상',
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
