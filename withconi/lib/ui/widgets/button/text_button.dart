// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/ui/theme/colors.dart';
import 'package:withconi/ui/theme/sizes.dart';

class WcTextButton extends StatelessWidget {
  WcTextButton({
    Key? key,
    this.valueText,
    required this.valueTextStyle,
    required this.active,
    required this.suffixText,
    required this.suffixTextStyle,
    required this.hintText,
    required this.hintTextStyle,
    this.suffixIcon,
    this.onTap,
  }) : super(key: key);

  String? valueText;
  String suffixText;
  String hintText;
  TextStyle hintTextStyle;
  TextStyle valueTextStyle;
  TextStyle suffixTextStyle;
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
        height: 45,
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
                              style: valueTextStyle,
                            ),
                            Text(suffixText, style: suffixTextStyle),
                          ],
                        )
                      : SizedBox(),
                  (active)
                      ? SizedBox()
                      : Expanded(child: Text(hintText, style: hintTextStyle)),
                  suffixIcon ?? SizedBox(),
                ],
              ),
            ),
            Container(
              height: 0.6,
              color: WcColors.grey100,
            )
          ],
        ),
      ),
    );
  }
}
