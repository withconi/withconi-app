import 'package:flutter_svg/svg.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/signup/signup_conimal_edit_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import '../../../configs/constants/enum_color.dart';
import '../../../configs/constants/enum_icon.dart';
import '../../theme/text_theme.dart';
import '../../widgets/button/text_button.dart';
import '../../widgets/checkbox/custom_checkbox.dart';
import '../../widgets/text_field/textfield.dart';
import 'signup_widgets/gender_toggle_button.dart';
import 'signup_widgets/species_radio_button.dart';

class SignupConimalEditPage extends StatelessWidget {
  SignupConimalEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignupConimalEditController _controller =
        Get.put(SignupConimalEditController());

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              width: WcWidth,
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
                      '등록한 코니멀의\n정보를 수정할 수 있어요',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontSize: 23,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                        height: 90,
                        child: Obx(
                          () => SpeciesRadioButtonGroup(
                            items: [
                              SpeciesRadioButton(
                                selectedValue: _controller.conimalSpecies.value,
                                value: Species.cat,
                                disabledImage:
                                    Image.asset('assets/icons/cat_grey.png'),
                                selectedColor: WcColors.white,
                                selectedImage:
                                    Image.asset('assets/icons/cat_black.png'),
                                onTap: () =>
                                    _controller.onSpeicesChanged(Species.cat),
                              ),
                              SpeciesRadioButton(
                                selectedValue: _controller.conimalSpecies.value,
                                value: Species.dog,
                                disabledImage:
                                    Image.asset('assets/icons/dog_grey.png'),
                                selectedColor: WcColors.white,
                                selectedImage:
                                    Image.asset('assets/icons/dog.png'),
                                onTap: () =>
                                    _controller.onSpeicesChanged(Species.dog),
                              )
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: WcTextField(
                            labelText: '코니멀 이름',
                            hintText: '코니멀 이름',
                            onChanged: _controller.onConimalNameChanged,
                            textController:
                                _controller.conimalNameTextController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => GenderToggleButton(
                                svgIconSrcList: Gender.values
                                    .map((e) => genderToSvgSrc(e))
                                    .toList(),
                                selectionList: Gender.values.toList(),
                                onPressed: (gender) {
                                  Get.focusScope!.unfocus();
                                  _controller.onGenderChanged(gender);
                                },
                                selectedValue: _controller.conimalGender.value,
                                backgroundColorList: Gender.values
                                    .map((e) => backgroundColorByGender(e))
                                    .toList(),
                                mainColorList: Gender.values
                                    .map((e) => textColorByGender(e))
                                    .toList(),
                                textList: Gender.values
                                    .map((e) => genderToKorean(e))
                                    .toList(),
                                // selectedValue: null,
                                // value: null,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomCheckBox(
                                mainAxisAlignment: MainAxisAlignment.end,
                                value: true,
                                text: '중성화 완료함',
                                iconHeight: 18,
                                isSelected: false,
                                onChanged: (p0) {}),
                          ],
                        ),
                      ],
                    ),
                    Obx(() {
                      return WcUnderlinedTextButton(
                        active: _controller.birthDateSelected.value,
                        onTap: _controller.selectBirthDate,
                        valueText: _controller.birthDateString,
                        hintText: '출생일',
                        suffixText: ' 출생',
                      );
                    }),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(() {
                      return WcUnderlinedTextButton(
                        active: _controller.adoptedDateSelected.value,
                        onTap: _controller.selectAdoptedDate,
                        valueText: _controller.adoptedDateString,
                        hintText: '입양일',
                        suffixText: ' 입양',
                      );
                    }),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(() => WcUnderlinedTextButton(
                          active: _controller.diseaseSelected.value,
                          onTap: () {
                            _controller.selectDisease();
                          },
                          valueText: _controller.diseaseText.value,
                          hintText: '질병 추가',
                          suffixText: _controller.diseaseSuffixText.value,
                          suffixIcon: SvgPicture.asset(
                            'assets/icons/search.svg',
                          ),
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    Obx(
                      () => WcWideButtonWidget(
                        active: _controller.validateButton(),
                        activeButtonColor: WcColors.blue100,
                        activeTextColor: WcColors.white,
                        buttonText: '수정',
                        buttonWidth: WcWidth - 40,
                        onTap: _controller.editConimal,
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
        ),
      ),
    );
  }
}
