import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/data/model/dto/joined_dto/symptom.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/module/community/controllers/custom_state_mixin.dart';
import 'package:withconi/module/dictionary/controllers/dictionary_detail_controller.dart';

import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';

import '../../../data/enums/enum.dart';

import '../../../global_widgets/error_widget/error_widget.dart';
import '../../../global_widgets/loading/loading_page.dart';
import '../../../import_basic.dart';
import '../../theme/colors.dart';
import '../../../global_widgets/badge/badge.dart';
import '../../../global_widgets/dialog/disease_editing_dialog.dart';

class DictionaryDetailPage extends StatelessWidget {
  const DictionaryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DictionaryDetailController _controller = Get.find();
    return Scaffold(
        persistentFooterButtons: (AuthController.to.isUserValid)
            ? [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  color: WcColors.white,
                  width: WcWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => DiseaseManageButton(
                          onButtonTap: () {
                            _controller.editConimalDiseases(context);
                          },
                          context: context,
                          isDiseaseManaged: _controller.isDiseaseManaged.value,
                        ),
                      ),
                      WcWideButtonWidget(
                        buttonWidth: 140,
                        buttonHeight: 45,
                        buttonText: '커뮤니티 가기',
                        onTap: _controller.goToRelatedCommunity,
                        active: true,
                      )
                    ],
                  ),
                )
              ]
            : null,
        appBar: WcAppBar(title: '질병백과'),
        body: Obx(() => _controller.pageStatus.value.maybeMap(
              orElse: () => SizedBox.shrink(),
              error: (errorObject) => WcErrorWidget(
                height: WcHeight - 300,
                image: Image.asset(
                  'assets/icons/no_result.png',
                  height: 80,
                ),
                title: errorObject.message,
                message: '',
              ),
              loading: (value) => LoadingPage(
                height: WcHeight - 150,
              ),
              success: (value) => SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color:
                                        _controller.disease.diseaseType.color),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                _controller.disease.diseaseType.displayName +
                                    '질환',
                                style: TextStyle(
                                    fontFamily: WcFontFamily.notoSans,
                                    fontSize: 15.5,
                                    height: 1.3,
                                    color: WcColors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Text(
                            _controller.disease.name,
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                fontSize: 23,
                                height: 1.3,
                                color: WcColors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Row(
                            children: [
                              WcBadge(
                                // width: 55,
                                margin: EdgeInsets.only(right: 8),
                                text: Species.dog.displayName,
                                // textSize: 12,
                                backgroundColor: Species.dog.backgroundColor,
                                textColor: Species.dog.mainColor,
                              ),
                              WcBadge(
                                // width: 55,
                                margin: EdgeInsets.only(right: 8),
                                text: Species.cat.displayName,
                                // textSize: 12,
                                backgroundColor: Species.cat.backgroundColor,
                                textColor: Species.cat.mainColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
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
                                fontSize: 18.5,
                                height: 1,
                                color: WcColors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            _controller.disease.definition,
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                fontSize: 16,
                                height: 1.5,
                                color: WcColors.grey200,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 70,
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
                                fontSize: 18.5,
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
                              children: _controller.disease.symptomGroup
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
                    Offstage(
                      offstage: _controller.disease.diagnosisTechnique.isEmpty,
                      child: Column(
                        children: [
                          SizedBox(
                            width: WcWidth - 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '진단법',
                                  style: TextStyle(
                                      fontFamily: WcFontFamily.notoSans,
                                      fontSize: 18.5,
                                      height: 1,
                                      color: WcColors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  _controller.disease.diagnosisTechnique,
                                  style: TextStyle(
                                      fontFamily: WcFontFamily.notoSans,
                                      fontSize: 16,
                                      height: 1.5,
                                      color: WcColors.grey200,
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
                        ],
                      ),
                    ),
                    Offstage(
                      offstage: _controller.disease.treatment.isEmpty,
                      child: Column(
                        children: [
                          SizedBox(
                            width: WcWidth - 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '치료법',
                                  style: TextStyle(
                                      fontFamily: WcFontFamily.notoSans,
                                      fontSize: 18.5,
                                      height: 1,
                                      color: WcColors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  _controller.disease.treatment,
                                  style: TextStyle(
                                      fontFamily: WcFontFamily.notoSans,
                                      fontSize: 16,
                                      height: 1.5,
                                      color: WcColors.grey200,
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
                        ],
                      ),
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
                                fontSize: 18.5,
                                height: 1,
                                color: WcColors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            _controller.disease.advice,
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                fontSize: 16,
                                height: 1.5,
                                color: WcColors.grey200,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            )));
  }
}

class DiseaseManageButton extends StatelessWidget {
  DiseaseManageButton({
    Key? key,
    required this.onButtonTap,
    required this.isDiseaseManaged,
    required this.context,
  }) : super(key: key);

  // final DictionaryDetailController _controller;
  void Function() onButtonTap;
  bool isDiseaseManaged;
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onButtonTap,
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor:
                  (isDiseaseManaged) ? WcColors.red100 : WcColors.grey110,
              child: SvgPicture.asset(
                'assets/icons/paw.svg',
                color: WcColors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              (isDiseaseManaged) ? '관리중인 질병' : '관리중이 아닌 질병',
              style: TextStyle(
                  fontFamily: WcFontFamily.notoSans,
                  fontSize: 16,
                  height: 1,
                  color:
                      (isDiseaseManaged) ? WcColors.red100 : WcColors.grey120,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ));
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
