import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/module/community/controllers/community_new_post_controller.dart';
import 'package:withconi/module/map/controllers/map_new_review_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/review_ui_class.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/global_widgets/button/text_radio_button.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';

import '../controllers/community_new_report_controller.dart';
import '../../../global_widgets/button/check_selection_button.dart';
import '../../../global_widgets/button/photo_verification_button.dart';
import '../../../global_widgets/checkbox/custom_checkbox.dart';
import '../../../global_widgets/scaffold/loading_scaffold.dart';

class CommunityReportPage extends StatelessWidget {
  CommunityReportPage({Key? key}) : super(key: key);

  final CommunityNewReportController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WcAppBar(
        title: '신고하기',
        leading: SvgPicture.asset(
          'assets/icons/arrow_back.svg',
          color: WcColors.grey200,
        ),
      ),
      backgroundColor: WcColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  '어떤 문제로 신고하시나요?',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      color: WcColors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Column(
                    children: ReportItem.values
                        .map((reportItem) => CustomCheckBox(
                            value: reportItem,
                            text: reportItem.displayName,
                            isSelected:
                                reportItem == _controller.reportItem.value,
                            onChanged: (item) {
                              _controller
                                  .onReportItemChanged(item as ReportItem);
                            }))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '구체적인 신고 이유를 알려주시겠어요?',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      color: WcColors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: WcColors.blue20),
                  child: TextField(
                    onChanged: _controller.onReportTextChanged,
                    keyboardType: TextInputType.text,
                    controller: _controller.reportDetailTextController,
                    style: GoogleFonts.notoSans(
                        color: WcColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.5),
                    maxLines: 20,
                    minLines: 5,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        isDense: true,
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.notoSans(
                            color: WcColors.grey120,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 1.5),
                        hintText: '신고 내용을 자세히 적어주시면 빠른 탐색과 처리에 도움이 됩니다.'),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Obx(
                  () => WcWideButtonWidget(
                      buttonText: '신고하기',
                      onTap: _controller.onButtonTap,
                      activeButtonColor: WcColors.blue100,
                      active: _controller.validateButton(),
                      activeTextColor: WcColors.white),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
