import 'package:flutter_svg/svg.dart';

import '../../../../import_basic.dart';
import '../../../ui_model/review_ui_class.dart';
import '../../../theme/text_theme.dart';

class ReviewRateButton extends StatelessWidget {
  ReviewRateButton(
      {Key? key,
      required this.onChanged,
      required this.reviewRate,
      required this.activeBackgroundColor,
      required this.activeIconSrc,
      this.inactiveBackgroundColor = WcColors.grey20,
      required this.inactiveIconSrc,
      required this.text,
      required this.isActive})
      : super(key: key);
  Function(ReviewUIClassImpl)? onChanged;
  ReviewUIClassImpl reviewRate;
  Color activeBackgroundColor;
  Color inactiveBackgroundColor;
  String activeIconSrc;
  String inactiveIconSrc;
  bool isActive;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              onChanged!.call(reviewRate);
            },
            child: CircleAvatar(
              radius: 42,
              backgroundColor:
                  (isActive) ? activeBackgroundColor : inactiveBackgroundColor,
              child: SvgPicture.asset(
                (isActive) ? activeIconSrc : inactiveIconSrc,
                width: 34,
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
                fontFamily: WcFontFamily.notoSans,
                color: WcColors.black,
                fontSize: 15,
                height: 1.1,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
