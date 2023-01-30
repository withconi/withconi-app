// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/module/theme/colors.dart';
import 'package:withconi/module/theme/sizes.dart';

class DateTextButton extends StatelessWidget {
  DateTextButton({
    Key? key,
    required this.text,
    required this.activeTextColor,
    required this.inactiveTextColor,
    required this.active,
    this.suffixIcon,
    this.onTap,
  }) : super(key: key);

  String text;
  Color inactiveTextColor;
  Color activeTextColor;
  Widget? suffixIcon;
  bool active;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        width: WcWidth(context) - 40,
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.workSans(
                        color: (active) ? activeTextColor : inactiveTextColor,
                        fontSize: 19,
                        fontWeight:
                            (active) ? FontWeight.w600 : FontWeight.w400),
                  ),
                  suffixIcon ?? SizedBox(),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: WcColors.grey100,
            )
          ],
        ),
      ),
    );
  }
}
