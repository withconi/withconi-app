import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:withconi/data/enums/enum.dart';

import 'package:withconi/global_widgets/button/date_selection_button.dart';
import 'package:withconi/module/diagnosis/controllers/diagnosis_step1_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/button/check_icon_selection_button.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import 'package:withconi/global_widgets/checkbox/custom_checkbox.dart';
import '../../../global_widgets/button/text_button.dart';
import '../../signup/widgets/gender_toggle_button.dart';

class DiagnosisStep1Page extends StatelessWidget {
  const DiagnosisStep1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DiagnosisStep1Controller _controller = Get.find();

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
                        percent: _controller.progressPercent.value,
                        progressColor: WcColors.blue100,
                        backgroundColor: WcColors.grey80),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      '진단할 코니멀에 대한\n기본정보를 선택해주세요',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Obx(
                      () => Row(
                        children: [
                          CheckIconSelectionButton(
                            selected: (_controller.conimalSpecies.value ==
                                Species.cat),
                            value: Species.cat,
                            selectedImageSrc: 'assets/icons/cat_black.png',
                            unselectedImageSrc: 'assets/icons/cat_grey.png',
                            text: Species.cat.displayName,
                            onChanged: (species) {
                              _controller.onSpeicesChanged(species as Species);
                            },
                          ),
                          CheckIconSelectionButton(
                            selected: (_controller.conimalSpecies.value ==
                                Species.dog),
                            value: Species.dog,
                            selectedImageSrc: 'assets/icons/dog.png',
                            unselectedImageSrc: 'assets/icons/dog_grey.png',
                            text: Species.dog.displayName,
                            onChanged: (species) {
                              _controller.onSpeicesChanged(species as Species);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '성별',
                          style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              color: WcColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Obx(
                              () => GenderToggleButton(
                                svgIconSrcList:
                                    Gender.values.map((e) => e.svgSrc).toList(),
                                selectionList: Gender.values.toList(),
                                onPressed: (gender) {
                                  Get.focusScope!.unfocus();
                                  _controller.onGenderChanged(gender);
                                },
                                selectedValue: _controller.conimalGender.value,
                                backgroundColorList: Gender.values
                                    .map((e) => e.backgoundColor)
                                    .toList(),
                                mainColorList: Gender.values
                                    .map((e) => e.mainColor)
                                    .toList(),
                                textList: Gender.values
                                    .map((e) => e.displayName)
                                    .toList(),

                                // selectedValue: null,
                                // value: null,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Obx(
                              () => CustomCheckBox(
                                  value: _controller.isNeutered.value,
                                  text: '중성화 완료함',
                                  iconHeight: 18,
                                  isSelected: _controller.isNeutered.value,
                                  onChanged: (neutered) {
                                    _controller.onNeuteredChanged(!neutered);
                                  }),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '출생일',
                          style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            color: WcColors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          return DateValueButton(
                            onTap: _controller.selectBirthDate,
                            dateTime: _controller.birthDate,
                            hintText: '출생일 선택',
                            suffixText: '출생',
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '묘종/견종',
                          style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            color: WcColors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => TextValueButton(
                            onTap: _controller.goToSearchBreedPage,
                            valueText: _controller.selectedBreed.value,
                            hintText: '묘종/견종 검색',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Obx(
                      () => WcWideButtonWidget(
                        active: _controller.validateButton(),
                        activeButtonColor: WcColors.blue100,
                        activeTextColor: WcColors.white,
                        buttonText: '다음',
                        buttonWidth: WcWidth - 40,
                        onTap: () {
                          Get.toNamed(Routes.DIAGNOSIS_STEP2);
                        },
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
