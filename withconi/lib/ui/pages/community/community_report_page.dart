import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/community/community_new_post_controller.dart';
import 'package:withconi/controller/map/map_new_review_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/entities/review_rate_entity.dart';
import 'package:withconi/ui/theme/text_theme.dart';
import 'package:withconi/ui/widgets/appbar/appbar.dart';
import 'package:withconi/ui/widgets/button/text_radio_button.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';

import '../../../controller/community/community_new_report_controller.dart';
import '../../../data/model/conimal.dart';
import '../../widgets/button/check_selection_button.dart';
import '../../widgets/button/place_verification_button.dart';
import '../../widgets/checkbox/custom_checkbox.dart';
import '../../widgets/scaffold/loading_scaffold.dart';

class CommunityNewReportPage extends StatelessWidget {
  CommunityNewReportPage({Key? key}) : super(key: key);

  final CommunityNewReportController _controller =
      Get.put(CommunityNewReportController());

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
                    children: _controller.reportItemList
                        .map((e) => CustomCheckBox(
                            value: e,
                            text: reportItemToKorean(e),
                            isSelected:
                                e == _controller.selectedReportItem.value,
                            onChanged: (reportItem) {
                              _controller.onReportItemChanged(
                                  reportItem as ReportItem);
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
