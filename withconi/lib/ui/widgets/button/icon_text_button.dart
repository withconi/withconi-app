import 'package:flutter_svg/svg.dart';

import '../../../import_basic.dart';

class WcIconTextButton extends StatelessWidget {
  WcIconTextButton({
    Key? key,
    required this.active,
    required this.onTap,
    required this.iconSrc,
    required this.activeIconColor,
    required this.inactiveIconColor,
    required this.text,
  }) : super(key: key);

  final void Function()? onTap;
  String iconSrc;
  Color activeIconColor;
  Color inactiveIconColor;
  String text;
  bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 5, 8, 5),
        color: WcColors.white,
        child: Row(
          children: [
            SvgPicture.asset(
              iconSrc,
              height: 18,
              color: (active) ? activeIconColor : inactiveIconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: WcColors.grey160,
              ),
            ),
          ],
        ),
      ),
    );
  }
}