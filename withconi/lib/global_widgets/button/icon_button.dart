import 'package:flutter_svg/svg.dart';

import '../../import_basic.dart';

class WcIconButton extends StatelessWidget {
  WcIconButton(
      {Key? key,
      this.active = true,
      this.onTap,
      required this.iconSrc,
      required this.activeIconColor,
      required this.inactiveIconColor,
      this.iconWidth = double.infinity,
      this.iconHeight = 19,
      this.touchWidth = 30,
      this.touchHeight = 50,
      this.iconMainAxisAlignment = MainAxisAlignment.end,
      this.iconCrossAxisAlignment = CrossAxisAlignment.center,
      this.backgroundColor = Colors.white})
      : super(key: key);

  final void Function()? onTap;
  String iconSrc;
  Color activeIconColor;
  Color inactiveIconColor;
  bool active;
  double iconHeight;
  double iconWidth;
  double touchWidth;
  double touchHeight;
  MainAxisAlignment iconMainAxisAlignment;
  CrossAxisAlignment iconCrossAxisAlignment;
  Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: touchWidth,
        height: touchHeight,
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: iconMainAxisAlignment,
          crossAxisAlignment: iconCrossAxisAlignment,
          children: [
            SvgPicture.asset(
              iconSrc,
              height: iconHeight,
              color: (active) ? activeIconColor : inactiveIconColor,
            ),
          ],
        ),
      ),
    );
  }
}
