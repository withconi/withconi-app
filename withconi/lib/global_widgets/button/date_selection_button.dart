// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:withconi/module/theme/colors.dart';
import 'package:withconi/module/theme/sizes.dart';

import '../../module/theme/text_theme.dart';

class DateValueButton extends StatelessWidget {
  DateValueButton({
    Key? key,
    this.dateTime,
    required this.suffixText,
    required this.hintText,
    this.onTap,
  }) : super(key: key);

  DateTime? dateTime;
  String suffixText;
  String hintText;

  // bool active;
  void Function()? onTap;

  String get dateTimeString =>
      (dateTime == null) ? '' : DateFormat('yyyy-MM-dd').format(dateTime!);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        width: WcWidth(context) - 40,
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
                  Expanded(
                      child: (dateTime == null)
                          ? Text(hintText,
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  color: WcColors.grey100,
                                  fontSize: 17,
                                  height: 1,
                                  fontWeight: FontWeight.w400))
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  dateTimeString,
                                  style: GoogleFonts.workSans(
                                      color: WcColors.black,
                                      fontSize: 19,
                                      height: 1,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  suffixText,
                                  style: TextStyle(
                                      fontFamily: WcFontFamily.notoSans,
                                      color: WcColors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.calendar_month,
                      color: (dateTime != null)
                          ? WcColors.grey180
                          : WcColors.grey100,
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
