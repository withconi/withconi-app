import '../../../import_basic.dart';
import '../../theme/text_theme.dart';
import '../../../global_widgets/divider/circle_divider.dart';

class OpeningStatusText extends StatelessWidget {
  OpeningStatusText({
    Key? key,
    required this.isOpen,
    this.fontSize = 14,
    this.hasIndicator = true,
    this.closedFontColor = WcColors.red100,
    this.openFontColor = WcColors.black,
  }) : super(key: key);

  bool isOpen;
  double fontSize;
  bool hasIndicator;
  Color openFontColor;
  Color closedFontColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (hasIndicator) ? WcCircleDivider() : SizedBox.shrink(),
        Text((isOpen) ? '진료 중' : '진료종료',
            style: TextStyle(
                fontFamily: WcFontFamily.notoSans,
                fontSize: fontSize,
                height: 1.2,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
