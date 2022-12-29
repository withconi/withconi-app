import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/setting/app_setting/controller/inquiry_controller.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import '../../../../global_widgets/checkbox/custom_checkbox.dart';

class InquiryPage extends StatelessWidget {
  const InquiryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InquiryController _controller =
        Get.put(InquiryController(Get.find()));
    return Scaffold(
      appBar: WcAppBar(
        title: '건의하기',
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
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '어떤 점을 건의하시나요?',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      color: WcColors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Column(
                    children: InquiryItem.values
                        .map((reportItem) => CustomCheckBox(
                            value: reportItem,
                            text: reportItem.displayName,
                            isSelected:
                                reportItem == _controller.inquiryItem.value,
                            onChanged: (item) {
                              _controller
                                  .onReportItemChanged(item as InquiryItem);
                            }))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  '자세한 건의 사항을 알려주시겠어요?',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      color: WcColors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: WcColors.grey40),
                  child: TextField(
                    onChanged: _controller.onReportTextChanged,
                    keyboardType: TextInputType.text,
                    controller: _controller.inquiryDetailTextController,
                    style: const TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        color: WcColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.5),
                    maxLines: 20,
                    minLines: 5,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        isDense: true,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            color: WcColors.grey120,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 1.5),
                        hintText:
                            '건의해주시는 내용을 꼼꼼히 살펴보고 있어요! 앱 사용시 느끼셨던 불편함이나 기능에 대한 제안이 있으시면 적어주세요 :)'),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Obx(
                  () => WcWideButtonWidget(
                      buttonText: '건의하기',
                      onTap: _controller.onButtonTap,
                      activeButtonColor: WcColors.blue100,
                      active: _controller.validateButton(),
                      activeTextColor: WcColors.white),
                ),
                const SizedBox(
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
