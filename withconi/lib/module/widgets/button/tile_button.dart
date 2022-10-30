import 'package:flutter_svg/svg.dart';

import '../../../import_basic.dart';

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
        width: WcWidth,
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: GoogleFonts.notoSans(
                    fontSize: textSize,
                    fontWeight: FontWeight.w500,
                    color: textColor)),
            SvgPicture.asset('assets/icons/arrow_right.svg'),
          ],
        ),
      ),
    );
  }
}
