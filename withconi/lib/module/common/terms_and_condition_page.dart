import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/global_widgets/button/icon_button.dart';
import 'package:withconi/global_widgets/button/icon_text_button.dart';
import 'package:withconi/module/common/controllers/terms_and_condition_controller.dart';
import 'package:withconi/module/home/home_page.dart';
import 'package:withconi/module/home/widgets/icon_big_button.dart';
import 'package:withconi/module/signup/controllers/signup_pw_controller.dart';
import 'package:withconi/module/theme/colors.dart';
import 'package:withconi/module/theme/sizes.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import '../../../global_widgets/text_field/textfield.dart';
import '../theme/text_theme.dart';

class TermsAndConditionPage extends StatelessWidget {
  const TermsAndConditionPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TermsAndConditionController _controller = Get.find();

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              height: WcHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 45,
                    ),
                    Text(
                      '이용 약관 동의',
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Obx(
                      () => Center(
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            WcWideButtonWidget(
                              active: true,
                              activeButtonColor:
                                  (_controller.privacyPolicyConfirmed.value &&
                                          _controller.termsConfirmed.value)
                                      ? WcColors.blue100
                                      : WcColors.grey40,
                              activeTextColor:
                                  (_controller.privacyPolicyConfirmed.value &&
                                          _controller.termsConfirmed.value)
                                      ? WcColors.white
                                      : WcColors.grey200,
                              buttonText: '네, 모두 동의합니다.',
                              buttonWidth: WcWidth - 80,
                              onTap: () {
                                _controller.onAllConfirmButtonTap(!(_controller
                                        .privacyPolicyConfirmed.value &&
                                    _controller.termsConfirmed.value));
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: SvgPicture.asset(
                                'assets/icons/check.svg',
                                height: 16,
                                color:
                                    (_controller.privacyPolicyConfirmed.value &&
                                            _controller.termsConfirmed.value)
                                        ? WcColors.white
                                        : WcColors.grey120,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Obx(
                      () => TermsAndConditionWidget(
                        confirmed: _controller.termsConfirmed.value,
                        onTap: _controller.onTermsButtonTap,
                        text: _controller.termsAndConditionText,
                        title: '이용약관',
                        onTapDetail: _controller.onTapTermsDetail,
                      ),
                    ),
                    Obx(
                      () => TermsAndConditionWidget(
                        confirmed: _controller.privacyPolicyConfirmed.value,
                        onTap: _controller.onPrivacyPolicyButtonTap,
                        text: _controller.privacyPolicyText,
                        title: '개인정보 처리방침',
                        onTapDetail: _controller.onTapPrivacyPolicyDetail,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Obx(() {
                      return WcWideButtonWidget(
                        active: _controller.termsConfirmed.value &&
                            _controller.privacyPolicyConfirmed.value,
                        activeButtonColor: WcColors.blue100,
                        activeTextColor: WcColors.white,
                        buttonText: '회원가입',
                        buttonWidth: WcWidth - 40,
                        onTap: _controller.signUp,
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
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

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({
    Key? key,
    required String title,
    required void Function(bool) onTap,
    required bool confirmed,
    required String text,
    required void Function() onTapDetail,
  })  : _title = title,
        _onTap = onTap,
        _confirmed = confirmed,
        _text = text,
        _onTapDetail = onTapDetail,
        super(key: key);

  final String _title;
  final bool _confirmed;
  final void Function(bool) _onTap;
  final String _text;
  final void Function() _onTapDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              _onTap.call(!_confirmed);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      (_confirmed)
                          ? SvgPicture.asset(
                              'assets/icons/check_circle_filled.svg',
                              width: 21,
                              color: WcColors.blue100,
                            )
                          : SvgPicture.asset(
                              'assets/icons/check_circle_unchecked.svg',
                              width: 21,
                            ),
                      SizedBox(
                        width: 10,
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(text: _title),
                          TextSpan(
                              text: ' (필수)',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 0, 92, 205),
                                  fontSize: 15,
                                  height: 1.5)),
                        ]),
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            color: WcColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.5),
                      ),
                    ],
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: _onTapDetail,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4.3, horizontal: 8),
                        alignment: Alignment.center,
                        // width: 80,
                        // height: 20,
                        child: Text(
                          '상세보기',
                          style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              color: WcColors.grey180,
                              fontSize: 12.5,
                              height: 1.23,
                              fontWeight: FontWeight.w400),
                        ),
                        decoration: BoxDecoration(
                            color: WcColors.grey80.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: WcWidth - 40,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: WcColors.grey20),
            child: TextField(
              autofocus: false,
              controller: TextEditingController(text: _text),
              style: TextStyle(
                  fontFamily: WcFontFamily.notoSans,
                  color: WcColors.grey140.withOpacity(0.8),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 1.5),
              maxLines: 20,
              minLines: 5,
              readOnly: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(17, 13, 17, 12),
                isDense: true,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
