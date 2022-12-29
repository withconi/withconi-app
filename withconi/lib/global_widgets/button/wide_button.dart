import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/module/theme/text_theme.dart';
import '../../module/theme/colors.dart';
import '../../module/theme/sizes.dart';

class WcWideButtonWidget extends StatelessWidget {
  WcWideButtonWidget(
      {Key? key,
      required this.buttonText,
      required this.onTap,
      this.inactiveButtonColor = WcColors.grey80,
      this.activeButtonColor = WcColors.blue100,
      this.buttonWidth = double.infinity,
      this.buttonHeight = 50,
      required this.active,
      this.activeTextColor = WcColors.white,
      this.inactiveTextColor = WcColors.grey120})
      : super(key: key);
  String buttonText;
  double buttonHeight;
  double buttonWidth;
  Color inactiveButtonColor;
  Color activeButtonColor;
  Color inactiveTextColor;
  Color activeTextColor;
  void Function()? onTap;

  bool active;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (active) ? activeButtonColor : inactiveButtonColor),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: (active) ? onTap : () {},
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                  fontFamily: WcFontFamily.notoSans,
                  color: (active) ? activeTextColor : inactiveTextColor,
                  fontSize: 16,
                  letterSpacing: 0.5,
                  height: 1,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
