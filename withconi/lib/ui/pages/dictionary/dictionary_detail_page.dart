import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/dictionary/dictionary_detail_controller.dart';
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
          child: Container(
              child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _controller.disease.name.replaceRange(
                      _controller.disease.name
                          .indexOf(RegExp(r'[\(][A-Z][a-z]')),
                      _controller.disease.name.length,
                      ''),
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 22,
                      height: 1,
                      color: WcColors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    WcBadge(
                      margin: EdgeInsets.only(right: 8),
                      text: speciesToKorean(Species.dog),
                      backgroundColor: speciesBackgroundColor(Species.dog),
                      textColor: speciesTypeTextColor(Species.dog),
                    ),
                    WcBadge(
                      margin: EdgeInsets.only(right: 8),
                      text: speciesToKorean(Species.cat),
                      backgroundColor: speciesBackgroundColor(Species.cat),
                      textColor: speciesTypeTextColor(Species.cat),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ))),
    );
  }
}
