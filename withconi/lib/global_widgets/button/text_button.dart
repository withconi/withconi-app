// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:withconi/module/theme/colors.dart';
import 'package:withconi/module/theme/sizes.dart';

import '../../module/theme/text_theme.dart';

class TextValueButton extends StatelessWidget {
  TextValueButton({
    Key? key,
    required this.valueText,
    required this.hintText,
    this.suffixIcon,
    this.onTap,
  }) : super(key: key);

  String? valueText;

  String hintText;

  Widget? suffixIcon;
  // bool active;
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
                  (valueText != null && valueText!.isNotEmpty)
                      ? Expanded(
                          child: Text(
                            valueText!,
                            softWrap: false,
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                color: WcColors.black,
                                fontSize: 17,
                                overflow: TextOverflow.fade,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      : Expanded(
                          child: Text(
                            hintText,
                            style: TextStyle(
                                color: WcColors.grey100,
                                fontFamily: WcFontFamily.notoSans,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: suffixIcon ??
                        SvgPicture.asset(
                          'assets/icons/paw.svg',
                          color: (valueText != null && valueText!.isNotEmpty)
                              ? WcColors.grey180
                              : WcColors.grey100,
                          width: 18,
                        ),
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
