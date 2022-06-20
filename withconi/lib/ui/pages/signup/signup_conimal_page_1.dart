import 'package:flutter_svg/svg.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import '../../../controller/signup/signup_conimal_1_controller.dart';
import '../../widgets/button/text_button.dart';
import '../../widgets/text_field/textfield.dart';
import 'signup_widgets/gender_toggle_button.dart';
import 'signup_widgets/species_radio_button.dart';

class SignupConimalPage1 extends StatelessWidget {
  SignupConimalPage1({Key? key}) : super(key: key);
  String controllerId = DateTime.now().millisecondsSinceEpoch.toString();

  @override
  Widget build(BuildContext context) {
    SignupConimal1Controller _controller =
        Get.put(SignupConimal1Controller(), tag: controllerId, permanent: true);
    _controller.controllerTag.value = controllerId;

    return Scaffold(
      body: SafeArea(
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
                Obx(() {
                  return Text(
                    '${_controller.userName}님과 함께하는\n코니멀에 대해 알려주세요',
                    style: GoogleFonts.notoSans(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  );
                }),
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
                            value: Species.CAT,
                            disabledImage:
                                Image.asset('assets/icons/cat_grey.png'),
                            selectedColor: WcColors.white,
                            selectedImage: Image.asset('assets/icons/cat.png'),
                            onTap: () =>
                                _controller.onSpeicesChanged(Species.CAT),
                          ),
                          SpeciesRadioButton(
                            selectedValue: _controller.conimalSpecies.value,
                            value: Species.DOG,
                            disabledImage:
                                Image.asset('assets/icons/dog_grey.png'),
                            selectedColor: WcColors.white,
                            selectedImage: Image.asset('assets/icons/dog.png'),
                            onTap: () =>
                                _controller.onSpeicesChanged(Species.DOG),
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
                        selectionList: _controller.genderSelectionList.toList(),
                        onPressed: (index) {
                          if (index == 0) {
                            _controller.onGenderChanged(Gender.FEMALE);
                            _controller.genderSelectionList[0] = true;
                            _controller.genderSelectionList[1] = false;
                          } else {
                            _controller.onGenderChanged(Gender.FEMALE);
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
                  return WcTextButton(
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
                  return WcTextButton(
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
                Obx(() => WcTextButton(
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
                  height: 60,
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(
                  () => IgnorePointer(
                    ignoring: !_controller.showAddConimalButton.value,
                    child: AnimatedOpacity(
                      curve: Curves.easeIn,
                      opacity:
                          _controller.showAddConimalButton.value ? 1.0 : 00,
                      duration: const Duration(milliseconds: 100),
                      child: WcWideButtonWidget(
                          active: _controller.showAddConimalButton.value,
                          activeButtonColor: WcColors.grey80,
                          activeTextColor: WcColors.grey200,
                          buttonText: '더 추가하기',
                          buttonWidth: WcWidth - 40,
                          onTap: _controller.addConimal),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(
                  () => WcWideButtonWidget(
                    active: _controller.validateButton(),
                    activeButtonColor: WcColors.blue100,
                    activeTextColor: WcColors.white,
                    buttonText: '등록',
                    buttonWidth: WcWidth - 40,
                    onTap: _controller.finishAddConimal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
