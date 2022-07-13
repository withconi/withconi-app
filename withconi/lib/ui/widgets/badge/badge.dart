import '../../../import_basic.dart';

class WcBadge extends StatelessWidget {
  WcBadge({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  final String text;
  Color backgroundColor;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 8),
      height: 22,
      width: 50,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(5)),
      child: Text(
        text,
        style: GoogleFonts.notoSans(
            color: textColor, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
