// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/module/theme/colors.dart';

import '../../../data/enums/enum.dart';

class SnsButtonWidget extends StatelessWidget {
  SnsButtonWidget({
    Key? key,
    // required this.imageSrc,
    required this.provider,
    required this.onTap,
  }) : super(key: key);

  void Function(Provider) onTap;
  double height = 90;
  double iconHeight = 58;
  Provider provider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              onTap.call(provider);
            },
            child: Image.asset(
              'assets/icons/${provider.code}.png',
              height: iconHeight,
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            provider.displayName,
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
