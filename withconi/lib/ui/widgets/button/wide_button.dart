import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/colors.dart';
import '../../theme/sizes.dart';

class WcWideButtonWidget extends StatelessWidget {
  WcWideButtonWidget(
      {Key? key,
      required this.buttonText,
      required this.onTap,
      this.inactiveButtonColor = grey80,
      required this.activeButtonColor,
      required this.buttonWidth,
      this.buttonHeight = 50,
      required this.active,
      required this.activeTextColor,
      this.inactiveTextColor = grey120})
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
    return SizedBox(
      height: 50,
      width: WcWidth - 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          child: Ink(
            height: 50,
            width: WcWidth - 40,
            decoration: BoxDecoration(
                color: (active) ? activeButtonColor : inactiveButtonColor),
            child: InkWell(
              onTap: onTap,
              child: Center(
                child: Text(
                  buttonText,
                  style: GoogleFonts.notoSans(
                      color: (active) ? activeTextColor : inactiveTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
