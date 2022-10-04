import 'package:flutter_svg/svg.dart';

import '../../../import_basic.dart';
import '../../theme/text_theme.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({
    Key? key,
    required this.value,
    required this.text,
    required this.isSelected,
    required this.onChanged,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.iconHeight = 23,
    this.textSize = 15.5,
  }) : super(key: key);

  dynamic value;
  String text;
  bool isSelected;
  Function(dynamic)? onChanged;
  MainAxisAlignment mainAxisAlignment;
  double iconHeight;
  double textSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged!.call(value);
      },
      child: Container(
        color: WcColors.white,
        height: 45,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: mainAxisAlignment,
          children: [
            (isSelected)
                ? SvgPicture.asset(
                    'assets/icons/checkbox_checked.svg',
                    height: iconHeight,
                  )
                : SvgPicture.asset(
                    'assets/icons/checkbox_unchecked.svg',
                    height: iconHeight,
                  ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  fontFamily: WcFontFamily.notoSans,
                  color: WcColors.black,
                  fontSize: textSize,
                  height: 1.2,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
