import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/core/tools/helpers/calculator.dart';
import 'package:withconi/data/model/dto/response_dto/conimal_response/conimal_response_dto.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import '../../import_basic.dart';

showDiseaseEditDialog(
    {required DiseaseUIModel currentDisease,
    required List<ConimalUIModel> originalList,
    required BuildContext context}) async {
  List<ConimalUIModel> _editConimalList = List.empty(growable: true);
  // late List<List<DiseaseUIModel>> _conimalDiseaseList =
  //     List.empty(growable: true);
  // _conimalDiseaseList = originalList.map((e) => e.diseases.toList()).toList();
  // originalList.map((e) => e.diseases);
  for (int x = 0; x < originalList.length; x++) {
    _editConimalList.add(ConimalUIModel(
        name: originalList[x].name,
        birthDate: originalList[x].birthDate,
        species: originalList[x].species,
        diseases: originalList[x].diseases.toList(),
        conimalId: originalList[x].conimalId));
  }
  // Map<ConimalUIModel, List<DiseaseUIModel>> diseaseConimalMap = {};

  print(_editConimalList);
  double maxVeticalPadding = (WcHeight - 245) / 2;
  return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(
                vertical: maxVeticalPadding - (_editConimalList.length * 15)),
            backgroundColor: Colors.transparent,
            content: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: const EdgeInsets.fromLTRB(23, 23, 23, 23),
                width: WcWidth,
                color: WcColors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Text('이 질병을 관리중인 코니멀',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: _editConimalList
                              .map((conimal) => SizedBox(
                                    height: 45,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 26,
                                              width: 26,
                                              child: Image.asset(
                                                  conimal.species!.imageSrc),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                                width: 45,
                                                child: Text(conimal.name,
                                                    style: TextStyle(
                                                        fontFamily: WcFontFamily
                                                            .notoSans,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500))),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            SizedBox(
                                              width: 55,
                                              child: Text('만 ${conimal.age}살',
                                                  style: GoogleFonts.workSans(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                conimal.diseases.contains(
                                                        currentDisease)
                                                    ? "관리중"
                                                    : "관리안함",
                                                style: TextStyle(
                                                    color: conimal.diseases
                                                            .contains(
                                                                currentDisease)
                                                        ? WcColors.red100
                                                        : WcColors.grey120,
                                                    fontFamily:
                                                        WcFontFamily.notoSans,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(
                                                  () {
                                                    print(conimal);
                                                    print(conimal.diseases);
                                                    if (conimal.diseases
                                                        .contains(
                                                            currentDisease)) {
                                                      conimal.diseases.remove(
                                                          currentDisease);
                                                    } else {
                                                      conimal.diseases
                                                          .add(currentDisease);
                                                    }
                                                  },
                                                );
                                              },
                                              child: SvgPicture.asset(
                                                'assets/icons/check_circle_filled.svg',
                                                color: (conimal.diseases
                                                        .contains(
                                                            currentDisease))
                                                    ? WcColors.red100
                                                    : WcColors.grey110,
                                                // color: WcColors.red100,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WcWideButtonWidget(
                            buttonWidth: (WcWidth - (48 + 46 + 10)) / 2,
                            buttonText: '취소',
                            onTap: () {
                              Get.back();
                            },
                            activeButtonColor: WcColors.grey80,
                            activeTextColor: WcColors.grey140,
                            active: true),
                        WcWideButtonWidget(
                            buttonWidth: (WcWidth - (48 + 46 + 10)) / 2,
                            buttonText: '수정하기',
                            onTap: () {
                              Get.back(result: _editConimalList);
                            },
                            active: true)
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
      });
}
