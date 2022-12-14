import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/data/model/diagnosis_result_response_dto.dart';

import 'package:withconi/import_basic.dart';
import 'package:withconi/module/home/home_page.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/global_widgets/button/check_icon_selection_button.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import 'package:withconi/global_widgets/checkbox/custom_checkbox.dart';
import 'package:withconi/global_widgets/loading/loading_page.dart';
import '../controllers/diagnosis_result_controller.dart';
import '../controllers/diagnosis_step2_controller.dart';
import '../../../global_widgets/button/text_button.dart';
import '../../signup/widgets/gender_toggle_button.dart';

class DiagnosisResultPage extends StatelessWidget {
  const DiagnosisResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DiagnosisResultController _controller = Get.find();

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(
            () => (_controller.isLoading.value)
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LottieBuilder.asset(
                        'assets/json/search_result.json',
                        height: 170,
                      ),
                      Text(
                        '의심되는 질병 탐색 중..',
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            fontSize: 16,
                            color: WcColors.grey200,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ))
                : SingleChildScrollView(
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  '자가진단 결과',
                                  style: TextStyle(
                                      fontFamily: WcFontFamily.notoSans,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '자가진단 결과는 정확한 진단이 아닙니다.\n정확한 진단과 치료를 위해\n반드시 병원에 내원하실 것을 권고합니다.',
                                  style: TextStyle(
                                      fontFamily: WcFontFamily.notoSans,
                                      fontSize: 15,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                // Column(
                                //   children: _controller.diseaseResultList
                                //       .map(
                                //         (diseaseResultItem) =>
                                //             DiseaseResultListTile(
                                //           diseaseResultItem:
                                //               diseaseResultItem,
                                //           index: null,
                                //         ),
                                //       )
                                //       .toList(),
                                // ),

                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        _controller.diseaseResultList.length,
                                    itemBuilder: (context, index) {
                                      return DiseaseResultListTile(
                                        onTap: _controller
                                            .onDiagnosisResultItemTap,
                                        diseaseResultItem: _controller
                                            .diseaseResultList[index],
                                        index: index,
                                      );
                                    }),

                                const SizedBox(
                                  height: 50,
                                ),
                                // WcWideButtonWidget(
                                //   active: false,
                                //   activeButtonColor: WcColors.blue100,
                                //   activeTextColor: WcColors.white,
                                //   buttonText: '선택완료',
                                //   buttonWidth: WcWidth - 40,
                                //   onTap: () {},
                                // ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
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

class DiseaseResultListTile extends StatelessWidget {
  DiseaseResultListTile(
      {Key? key,
      required this.diseaseResultItem,
      required this.index,
      required this.onTap})
      : super(key: key);

  int index;
  DiagnosisResultResponseDTO diseaseResultItem;
  void Function(DiagnosisResultResponseDTO diseaseResultItem) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(diseaseResultItem),
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 13, 15, 15),
        margin: EdgeInsets.only(bottom: 17),
        height: 76,
        width: WcWidth - 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: WcColors.white,
            boxShadow: [
              BoxShadow(
                  color: WcColors.black.withOpacity(0.17),
                  offset: Offset(0, 1.5),
                  blurRadius: 10,
                  spreadRadius: -3)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 25,
                    child: Text(
                      (index + 1).toString(),
                      style: GoogleFonts.workSans(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: diseaseResultItem.posibility.mainColor,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              diseaseResultItem.posibility.displayName,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: WcFontFamily.notoSans,
                                  color: diseaseResultItem.posibility.mainColor,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Text(
                          diseaseResultItem.diseaseName,
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: WcFontFamily.notoSans,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: SvgPicture.asset('assets/icons/arrow_right.svg'),
            )
          ],
        ),
      ),
    );
  }
}

class SymptomItemButton extends StatelessWidget {
  SymptomItemButton({
    Key? key,
    required this.symptomItemText,
    required this.selected,
    required this.onTap,
  }) : super(key: key);
  String symptomItemText;
  bool selected;
  void Function(String) onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call(symptomItemText);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: (selected) ? WcColors.blue100 : WcColors.grey80,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          symptomItemText,
          style: TextStyle(
              fontFamily: WcFontFamily.notoSans,
              fontSize: 16,
              height: 1.3,
              color: (selected) ? WcColors.white : WcColors.grey200,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
