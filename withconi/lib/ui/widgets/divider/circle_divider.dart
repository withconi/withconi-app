import '../../../import_basic.dart';

class WcCircleDivider extends StatelessWidget {
  WcCircleDivider({
    Key? key,
    this.radius,
    this.color,
    this.margin,
  }) : super(key: key);
  double? radius;
  Color? color;
  EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 4),
      child: CircleAvatar(
        backgroundColor: color ?? WcColors.blue100,
        radius: radius ?? 2.5,
      ),
    );
  }
}
