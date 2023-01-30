import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/global_widgets/button/item_text_button.dart';
import 'package:withconi/module/common/controllers/edit_conimal_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import 'package:withconi/global_widgets/checkbox/custom_checkbox.dart';
import '../../global_widgets/button/date_selection_button.dart';
import '../theme/text_theme.dart';
import '../../global_widgets/button/text_button.dart';
import '../../global_widgets/text_field/textfield.dart';
import '../signup/widgets/gender_toggle_button.dart';
import '../signup/widgets/species_radio_button.dart';

class ConimalEditPage extends StatelessWidget {
  const ConimalEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditConimalController _controller = Get.find();

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: WcAppBar(
          title: '내 코니멀 수정',
          onLeadingTap: _controller.getBack,
          action: Obx(
            () => GestureDetector(
              onTap: (_controller.isButtonValid.value)
                  ? _controller.onEditButtonTap
                  : () {},
              child: Text(
                '완료',
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    fontSize: 17,
                    color: (_controller.isButtonValid.value)
                        ? WcColors.blue100
                        : WcColors.grey120,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6),
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Obx(
          () => (!_controller.dataInited.value)
              ? SizedBox.shrink()
              : SingleChildScrollView(
                  child: SafeArea(
                    child: SizedBox(
                      width: WcWidth(context),
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
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                                height: 90,
                                child: Obx(
                                  () => SpeciesRadioButtonGroup(
                                    items: [
                                      SpeciesRadioButton(
                                        selectedValue: _controller
                                            .editConimal.value.species,
                                        value: Species.cat,
                                        disabledImage: Image.asset(
                                            'assets/icons/cat_grey.png'),
                                        selectedColor: WcColors.white,
                                        selectedImage: Image.asset(
                                            'assets/icons/cat_black.png'),
                                        onTap: () => _controller
                                            .onSpeicesChanged(Species.cat),
                                      ),
                                      SpeciesRadioButton(
                                        selectedValue: _controller
                                            .editConimal.value.species,
                                        value: Species.dog,
                                        disabledImage: Image.asset(
                                            'assets/icons/dog_grey.png'),
                                        selectedColor: WcColors.white,
                                        selectedImage:
                                            Image.asset('assets/icons/dog.png'),
                                        onTap: () => _controller
                                            .onSpeicesChanged(Species.dog),
                                      )
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: WcTextField(
                                    labelText: '코니멀 이름',
                                    hintText: '코니멀 이름',
                                    errorText:
                                        _controller.conimalNameErrorText.value,
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
                                            .map((e) => e.svgSrc)
                                            .toList(),
                                        selectionList: Gender.values.toList(),
                                        onPressed: (gender) {
                                          Get.focusScope!.unfocus();
                                          _controller.onGenderChanged(gender);
                                        },
                                        selectedValue: _controller
                                            .editConimal.value.gender,
                                        backgroundColorList: Gender.values
                                            .map((e) => e.backgoundColor)
                                            .toList(),
                                        mainColorList: Gender.values
                                            .map((e) => e.mainColor)
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
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Obx(
                                        () => CustomCheckBox(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            value: _controller.editConimal.value
                                                .isNeutralized,
                                            text: '중성화 완료함',
                                            iconHeight: 18,
                                            isSelected: _controller.editConimal
                                                .value.isNeutralized,
                                            onChanged: (p0) {
                                              _controller.onNeutralizedChanged(
                                                  p0 as bool);
                                            }),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Obx(() {
                              return DateValueButton(
                                onTap: _controller.selectBirthDate,
                                dateTime:
                                    _controller.editConimal.value.birthDate,
                                hintText: '출생일',
                                suffixText: '출생',
                              );
                            }),
                            const SizedBox(
                              height: 30,
                            ),
                            Obx(() {
                              return DateValueButton(
                                onTap: _controller.selectAdoptedDate,
                                dateTime:
                                    _controller.editConimal.value.adoptedDate,
                                hintText: '입양일',
                                suffixText: '입양',
                              );
                            }),
                            const SizedBox(
                              height: 30,
                            ),
                            Obx(
                              () => TextValueButton(
                                onTap: _controller.goToSearchBreedPage,
                                valueText: _controller.editConimal.value.breed,
                                hintText: '묘종/견종 검색',
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Obx(() => ItemListValueButton(
                                  onTapButton: _controller.selectDisease,
                                  hintText: '질병 추가 (선택항목)',
                                  itemTextList: _controller.selectedDiseaseList
                                      .map((element) => element.name)
                                      .toList(),
                                  onItemDelete: _controller.onDeleteDiseaseItem,
                                )),
                            const SizedBox(
                              height: 50,
                            ),
                            // Obx(
                            //   () => WcWideButtonWidget(
                            //     active: _controller.isButtonValid.value,
                            //     activeButtonColor: WcColors.blue100,
                            //     activeTextColor: WcColors.white,
                            //     buttonText: '수정하기',
                            //     buttonWidth: WcWidth(context) - 40,
                            //     onTap: _controller.onEditButtonTap,
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
