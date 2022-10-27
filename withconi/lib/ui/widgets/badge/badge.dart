import 'dart:ui';

import 'package:withconi/ui/theme/text_theme.dart';

import '../../../import_basic.dart';

class WcBadge extends StatelessWidget {
  WcBadge(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.textColor,
      this.width = 52,
      this.height = 24,
      this.margin = const EdgeInsets.only(left: 8),
      this.textSize = 12})
      : super(key: key);

  final String text;
  Color backgroundColor;
  Color textColor;
  double width;
  double height;
  double textSize;
  EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(15)),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: WcFontFamily.notoSans,
            color: textColor,
            fontSize: textSize,
            fontWeight: FontWeight.w500,
            height: 1.1),
      ),
    );
  }
}
