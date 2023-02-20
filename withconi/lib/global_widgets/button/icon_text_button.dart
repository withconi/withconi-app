import 'package:flutter_svg/svg.dart';

import '../../import_basic.dart';

class WcIconTextButton extends StatelessWidget {
  WcIconTextButton(
      {Key? key,
      required this.active,
      required this.onTap,
      required this.iconSrc,
      required this.activeIconColor,
      required this.inactiveIconColor,
      required this.text,
      this.padding = const EdgeInsets.fromLTRB(0, 5, 10, 4),
      this.iconWidth = 19,
      this.iconHeight = 19})
      : super(key: key);

  final void Function()? onTap;
  String iconSrc;
  Color activeIconColor;
  Color inactiveIconColor;
  String text;
  bool active;
  double iconHeight;
  double iconWidth;
  EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        color: Colors.transparent,
        child: Row(
          children: [
            SvgPicture.asset(
              iconSrc,
              height: iconHeight,
              color: (active) ? activeIconColor : inactiveIconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: GoogleFonts.workSans(
                fontSize: 16,
                color: WcColors.grey140,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
