// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/ui/theme/colors.dart';
import 'package:withconi/ui/theme/sizes.dart';

import '../../theme/text_theme.dart';

class WcUnderlinedTextButton extends StatelessWidget {
  WcUnderlinedTextButton({
    Key? key,
    this.valueText,
    this.valueTextStyle,
    required this.active,
    required this.suffixText,
    this.suffixTextStyle,
    required this.hintText,
    this.hintTextStyle,
    this.suffixIcon,
    this.onTap,
  }) : super(key: key);

  String? valueText;
  String suffixText;
  String hintText;
  TextStyle? hintTextStyle;
  TextStyle? valueTextStyle;
  TextStyle? suffixTextStyle;
  Widget? suffixIcon;
  bool active;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        width: WcWidth - 40,
        height: 43,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (active)
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              valueText ?? '',
                              style: valueTextStyle ??
                                  TextStyle(
                                      fontFamily: WcFontFamily.notoSans,
                                      color: WcColors.black,
                                      fontSize: 16,
                                      height: 1,
                                      fontWeight: FontWeight.w600),
                            ),
                            Text(
                              suffixText,
                              style: suffixTextStyle ??
                                  TextStyle(
                                      fontFamily: WcFontFamily.notoSans,
                                      color: WcColors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      : SizedBox(),
                  (active)
                      ? SizedBox()
                      : Expanded(
                          child: Text(hintText,
                              style: hintTextStyle ??
                                  TextStyle(
                                      fontFamily: WcFontFamily.notoSans,
                                      color: WcColors.grey100,
                                      fontSize: 16,
                                      height: 1,
                                      fontWeight: FontWeight.w400))),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: suffixIcon ?? SizedBox(),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: WcColors.grey110,
            )
          ],
        ),
      ),
    );
  }
}
