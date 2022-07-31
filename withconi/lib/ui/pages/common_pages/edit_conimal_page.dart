import 'package:flutter_svg/svg.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/common_controller/edit_conimal_controller.dart';
import 'package:withconi/controller/signup/signup_conimal_edit_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/widgets/appbar/appbar.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import '../../widgets/button/text_button.dart';
import '../../widgets/text_field/textfield.dart';
import '../signup/signup_widgets/gender_toggle_button.dart';
import '../signup/signup_widgets/species_radio_button.dart';

class EditConimalPage extends StatelessWidget {
  EditConimalPage({Key? key}) : super(key: key);

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
                      '등록된 코니멀의\n정보를 수정해주세요',
                      style: GoogleFonts.notoSans(
                          fontSize: 25, fontWeight: FontWeight.w600),
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WcTextField(
                          width: (WcWidth) / 1.65,
                          labelText: '코니멀 이름',
                          hintText: '코니멀 이름',
                          onChanged: _controller.onConimalNameChanged,
                          textController: _controller.conimalNameTextController,
                          keyboardType: TextInputType.name,
                        ),
                        Obx(
                          () => GenderToggleButton(
                            selectionList:
                                _controller.genderSelectionList.toList(),
                            onPressed: (index) {
                              if (index == 0) {
                                _controller.onGenderChanged(Gender.female);
                                _controller.genderSelectionList[0] = true;
                                _controller.genderSelectionList[1] = false;
                              } else {
                                _controller.onGenderChanged(Gender.female);
                                _controller.genderSelectionList[0] = false;
                                _controller.genderSelectionList[1] = true;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(() {
                      return WcUnderlinedTextButton(
                        active: _controller.birthDateSelected.value,
                        onTap: _controller.selectBirthDate,
                        valueText: _controller.birthDateString,
                        suffixTextStyle: GoogleFonts.notoSans(
                            color: WcColors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w300),
                        valueTextStyle: GoogleFonts.montserrat(
                            color: WcColors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                        hintText: '출생일',
                        hintTextStyle: GoogleFonts.notoSans(
                            color: WcColors.grey100,
                            fontSize: 17,
                            fontWeight: FontWeight.w300),
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
                        suffixTextStyle: GoogleFonts.notoSans(
                            color: WcColors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w300),
                        valueTextStyle: GoogleFonts.montserrat(
                            color: WcColors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                        hintText: '입양일',
                        hintTextStyle: GoogleFonts.notoSans(
                            color: WcColors.grey100,
                            fontSize: 17,
                            fontWeight: FontWeight.w300),
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
                          suffixTextStyle: GoogleFonts.notoSans(
                              color: WcColors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
                          valueTextStyle: GoogleFonts.notoSans(
                              color: WcColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          hintText: '질병 추가',
                          hintTextStyle: GoogleFonts.notoSans(
                              color: WcColors.grey100,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
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
