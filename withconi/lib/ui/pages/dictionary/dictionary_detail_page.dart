import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/dictionary/dictionary_detail_controller.dart';
import 'package:withconi/data/model/symptom.dart';
import 'package:withconi/ui/theme/text_theme.dart';
import 'package:withconi/ui/widgets/appbar/appbar.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';

import '../../../configs/constants/enum.dart';
import '../../../configs/constants/enum_color.dart';
import '../../../data/model/conimal.dart';
import '../../../data/model/disease.dart';
import '../../../import_basic.dart';
import '../../theme/colors.dart';
import '../../widgets/badge/badge.dart';
import '../../widgets/dialog/disease_editing_dialog.dart';

class DictionaryDetailPage extends StatelessWidget {
  DictionaryDetailPage({Key? key}) : super(key: key);
  DictionaryDetailController _controller =
      Get.put(DictionaryDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: WcColors.white,
          width: WcWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _controller.editConimalDiseases(context);
                      },
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: (_controller.isManagingDisease.value)
                            ? WcColors.red100
                            : WcColors.grey110,
                        child: SvgPicture.asset(
                          'assets/icons/paw.svg',
                          color: WcColors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '관리중인 질병',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontSize: 16,
                          height: 1,
                          color: (_controller.isManagingDisease.value)
                              ? WcColors.red100
                              : WcColors.grey120,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              WcWideButtonWidget(
                buttonWidth: 140,
                buttonHeight: 45,
                buttonText: '커뮤니티 가기',
                onTap: () {},
                active: true,
              )
            ],
          ),
        )
      ],
      appBar: WcAppBar(title: '질병백과'),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _controller.disease.diseaseType!.displayName + '질환',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 15.5,
                      height: 1,
                      color: WcColors.black,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  // _controller.disease.name.replaceRange(
                  //     _controller.disease.name
                  //         .indexOf(RegExp(r'[\(][A-Z][a-z]')),
                  //     _controller.disease.name.length,
                  //     ''
                  _controller.disease.name,
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 23,
                      height: 1,
                      color: WcColors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    WcBadge(
                      width: 55,
                      margin: EdgeInsets.only(right: 8),
                      text: Species.dog.displayName,
                      textSize: 12,
                      backgroundColor: speciesBackgroundColor(Species.dog),
                      textColor: speciesTypeTextColor(Species.dog),
                    ),
                    WcBadge(
                      width: 55,
                      margin: EdgeInsets.only(right: 8),
                      text: Species.cat.displayName,
                      textSize: 12,
                      backgroundColor: speciesBackgroundColor(Species.cat),
                      textColor: speciesTypeTextColor(Species.cat),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: WcWidth - 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '정의',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 18,
                      height: 1,
                      color: WcColors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '저엉ㄴ어랸어랴ㅐ너래저러ㅐ저ㅐㅈ러재러재러래ㅓㄹ재ㅓ래ㅑ더퓨패패ㅠㅐㅠㅐㅠㅐㅠㅐㅠ째ㅐ저더댜저댜러재ㅑㅓㅈ대ㅑ렂댜ㅐ저대ㅑ러ㅐ',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 15,
                      height: 1.3,
                      color: WcColors.grey180,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(
            height: 80,
            thickness: 10,
            color: WcColors.grey40,
          ),
          SizedBox(
            width: WcWidth - 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '관찰 가능한 증상',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 18,
                      height: 1,
                      color: WcColors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                    spacing: 10,
                    runSpacing: 25,
                    children: _controller.disease.symptomGroups
                        .map((e) => SymptomGroupWrap(symptomGroup: e))
                        .toList()),
              ],
            ),
          ),
          Divider(
            height: 80,
            thickness: 10,
            color: WcColors.grey40,
          ),
          SizedBox(
            width: WcWidth - 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '진단법',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 18,
                      height: 1,
                      color: WcColors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '저엉ㄴ어랸어랴ㅐ너래저러ㅐ저ㅐㅈ러재러재러래ㅓㄹ재ㅓ래ㅑ더퓨패패ㅠㅐㅠㅐㅠㅐㅠㅐㅠ째ㅐ저더댜저댜러재ㅑㅓㅈ대ㅑ렂댜ㅐ저대ㅑ러ㅐ',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 15,
                      height: 1.3,
                      color: WcColors.grey180,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(
            height: 80,
            thickness: 10,
            color: WcColors.grey40,
          ),
          SizedBox(
            width: WcWidth - 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '치료법',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 18,
                      height: 1,
                      color: WcColors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '저엉ㄴ어랸어랴ㅐ너래저러ㅐ저ㅐㅈ러재러재러래ㅓㄹ재ㅓ래ㅑ더퓨패패ㅠㅐㅠㅐㅠㅐㅠㅐㅠ째ㅐ저더댜저댜러재ㅑㅓㅈ대ㅑ렂댜ㅐ저대ㅑ러ㅐ',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 15,
                      height: 1.3,
                      color: WcColors.grey180,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(
            height: 80,
            thickness: 10,
            color: WcColors.grey40,
          ),
          SizedBox(
            width: WcWidth - 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '보호자에 대한 조언',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 18,
                      height: 1,
                      color: WcColors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '저엉ㄴ어랸어랴ㅐ너래저러ㅐ저ㅐㅈ러재러재러래ㅓㄹ재ㅓ래ㅑ더퓨패패ㅠㅐㅠㅐㅠㅐㅠㅐㅠ째ㅐ저더댜저댜러재ㅑㅓㅈ대ㅑ렂댜ㅐ저대ㅑ러ㅐ',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 15,
                      height: 1.3,
                      color: WcColors.grey180,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      )),
    );
  }
}

class SymptomGroupWrap extends StatelessWidget {
  SymptomGroupWrap({
    Key? key,
    // required this.symptomItems,
    required this.symptomGroup,
  }) : super(key: key);

  // List<Widget> symptomItems;
  SymptomGroup symptomGroup;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (WcWidth - 50) / 2,
      // color: WcColors.blue40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              'assets/icons/diagnosis/symptoms_${symptomGroup.symptomType.code}.png',
              height: 27,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              symptomGroup.symptomType.displayName + '이상',
              style: TextStyle(
                  height: 1,
                  fontFamily: WcFontFamily.notoSans,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w500),
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 7,
            runSpacing: 7,
            children: symptomGroup.symptomList
                .map((symptomString) => SymptomItemBox(
                      symptomString: symptomString,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

class SymptomItemBox extends StatelessWidget {
  SymptomItemBox({
    Key? key,
    required this.symptomString,
  }) : super(key: key);

  String symptomString;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
        // height: 30,
        child: Text(
          symptomString,
          style: TextStyle(
              fontFamily: WcFontFamily.notoSans, fontSize: 13.5, height: 1.5),
        ),
        decoration: BoxDecoration(
            color: WcColors.grey40, borderRadius: BorderRadius.circular(5)));
  }
}
