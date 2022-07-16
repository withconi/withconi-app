import '../../../import_basic.dart';

class WcBadge extends StatelessWidget {
  WcBadge(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.textColor,
      this.width = 50,
      this.height = 21,
      this.textSize = 12})
      : super(key: key);

  final String text;
  Color backgroundColor;
  Color textColor;
  double width;
  double height;
  double textSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 8),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(5)),
      child: Text(
        text,
        style: GoogleFonts.notoSans(
            color: textColor,
            fontSize: textSize,
            fontWeight: FontWeight.w600,
            height: 1.2),
      ),
    );
  }
}
