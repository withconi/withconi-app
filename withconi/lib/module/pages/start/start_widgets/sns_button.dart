// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/module/theme/colors.dart';

class SnsButtonWidget extends StatelessWidget {
  SnsButtonWidget({
    Key? key,
    required this.imageSrc,
    this.label,
    this.onTap,
  }) : super(key: key);

  String imageSrc;
  String? label;
  void Function()? onTap;
  double height = 90;
  double iconHeight = 58;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Image.asset(
              imageSrc,
              height: iconHeight,
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            label ?? '',
            style: GoogleFonts.notoSans(
                color: WcColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
