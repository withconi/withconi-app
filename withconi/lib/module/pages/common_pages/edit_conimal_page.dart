import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/controller/common_controller/edit_conimal_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/widgets/appbar/appbar.dart';
import 'package:withconi/module/widgets/button/wide_button.dart';
import 'package:withconi/module/widgets/checkbox/custom_checkbox.dart';
import '../../../data/enums/enum_color.dart';
import '../../../data/enums/enum_icon.dart';
import '../../theme/text_theme.dart';
import '../../widgets/button/text_button.dart';
import '../../widgets/text_field/textfield.dart';
import '../signup/signup_widgets/gender_toggle_button.dart';
import '../signup/signup_widgets/species_radio_button.dart';

class EditConimalPage extends StatelessWidget {
  const EditConimalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditConimalController _controller = Get.put(EditConimalController());

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: WcAppBar(
          title: '내 코니멀 관리',
          onLeadingTap: _controller.getBack,
        ),
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
                      height: 20,
                    ),
                    Text(
                      '등록된 코니멀의\n정보를 수정할 수 있어요',
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
                                    .map((gender) => genderToSvgSrc(gender))
                                    .toList(),
                                selectionList: Gender.values.toList(),
                                onPressed: (gender) {
                                  Get.focusScope!.unfocus();
                                  _controller.onGenderChanged(gender);
                                },
                                selectedValue: _controller.conimalGender.value,
                                backgroundColorList: Gender.values
                                    .map((gender) =>
                                        backgroundColorByGender(gender))
                                    .toList(),
                                mainColorList: Gender.values
                                    .map((gender) => textColorByGender(gender))
                                    .toList(),
                                textList: Gender.values
                                    .map((gender) => gender.displayName)
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
                          // valueTextWidth: 120,
                          valueText: _controller.diseaseText.value,

                          hintText: '묘종/견종 검색',

                          suffixText: _controller.diseaseSuffixText.value,
                          suffixIcon: SvgPicture.asset(
                            'assets/icons/search.svg',
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(() => WcUnderlinedTextButton(
                          active: _controller.diseaseSelected.value,
                          onTap: () {
                            _controller.selectDisease();
                          },
                          // valueTextWidth: 120,
                          valueText: _controller.diseaseText.value,

                          hintText: '질병 추가 (선택항목)',

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
                        buttonText: '수정하기',
                        buttonWidth: WcWidth - 40,
                        onTap: _controller.onEditButtonTap,
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
      ),
    );
  }
}
