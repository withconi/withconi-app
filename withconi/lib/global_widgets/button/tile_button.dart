import 'package:flutter_svg/svg.dart';

import '../../import_basic.dart';
import '../../module/theme/text_theme.dart';

class WcTileButton extends StatelessWidget {
  WcTileButton({
    Key? key,
    this.height = 50,
    required this.text,
    this.textSize = 16.5,
    this.textColor = WcColors.grey200,
    this.paddingHorizontal = 22,
    this.onTap,
  }) : super(key: key);

  double height;
  String text;
  double textSize;
  Color textColor;
  double paddingHorizontal;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        alignment: Alignment.centerLeft,
        height: height,
        width: WcWidth(context),
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    fontSize: textSize,
                    fontWeight: FontWeight.w400,
                    color: textColor)),
            SvgPicture.asset('assets/icons/arrow_right.svg'),
          ],
        ),
      ),
    );
  }
}
