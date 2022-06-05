// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/ui/theme/colors.dart';
import 'package:withconi/ui/theme/sizes.dart';

class WcTextButton extends StatelessWidget {
  WcTextButton({
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
        width: WcWidth - 40,
        height: 45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.montserrat(
                        color: (active) ? activeTextColor : inactiveTextColor,
                        fontSize: 18,
                        fontWeight:
                            (active) ? FontWeight.w500 : FontWeight.w400),
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
