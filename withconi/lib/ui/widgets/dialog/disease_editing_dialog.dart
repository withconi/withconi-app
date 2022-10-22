import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/configs/constants/enum_color.dart';
import 'package:withconi/configs/helpers/calculator.dart';
import 'package:withconi/ui/entities/place_verfication.dart';
import 'package:withconi/ui/theme/text_theme.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import 'package:withconi/ui/widgets/snackbar.dart';
import '../../../configs/constants/enum_icon.dart';
import '../../../data/model/conimal.dart';
import '../../../data/model/disease.dart';
import '../../../import_basic.dart';

showDiseaseEditDialog(
    {required Disease disease,
    required List<Conimal> conimalList,
    required BuildContext context}) async {
  Map<Conimal, List<Disease>> diseaseConimalMap = {};

  conimalList.forEach(
    (element) => diseaseConimalMap[element] =
        element.diseases.map((e) => e as Disease).toList(),
  );
  return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(
                vertical: (WcHeight - (230 + (45 * (conimalList.length)))) / 2),
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
                                  fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: conimalList
                              .map((e) => SizedBox(
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
                                              child: speciesToImage(e.species),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                                width: 45,
                                                child: Text(e.name,
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
                                              width: 40,
                                              child: Text(
                                                  "${TimeCalculator().calculateAge(e.birthDate).toString()}살",
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                (diseaseConimalMap[e]!.any(
                                                        (element) =>
                                                            element.code ==
                                                            disease.code))
                                                    ? "관리중"
                                                    : "관리안함",
                                                style: TextStyle(
                                                    color: (diseaseConimalMap[
                                                                e]!
                                                            .any((element) =>
                                                                element.code ==
                                                                disease.code))
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
                                                    if ((diseaseConimalMap[e]!
                                                        .any((element) =>
                                                            element.code ==
                                                            disease.code))) {
                                                      diseaseConimalMap[e]!
                                                          .removeWhere(
                                                              (element) =>
                                                                  element
                                                                      .code ==
                                                                  disease.code);
                                                    } else {
                                                      diseaseConimalMap[e]!
                                                          .add(disease);
                                                    }
                                                  },
                                                );
                                              },
                                              child: SvgPicture.asset(
                                                'assets/icons/check_circle_filled.svg',
                                                color: (diseaseConimalMap[e]!
                                                        .any((element) =>
                                                            element.code ==
                                                            disease.code))
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
                              List<Conimal> editedConimal = conimalList
                                  .map((e) => e.copyWith(
                                      diseases: diseaseConimalMap[e]!))
                                  .toList();

                              Get.back(result: editedConimal);
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
