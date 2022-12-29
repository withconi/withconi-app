import 'package:flutter_svg/svg.dart';
import 'package:withconi/module/theme/text_theme.dart';

import '../../import_basic.dart';

class PhotoVerificationButton extends StatelessWidget {
  PhotoVerificationButton(
      {Key? key, required this.isPhotoReview, required this.onTap})
      : super(key: key);

  bool isPhotoReview;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        // width: 90,
        padding: EdgeInsets.symmetric(vertical: 8.2, horizontal: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: (isPhotoReview) ? WcColors.blue20 : WcColors.red20,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/photo_verification.svg',
                height: 19,
                color: (isPhotoReview) ? WcColors.blue100 : WcColors.red100),

            // : Padding(
            //     padding: const EdgeInsets.only(left: 2.0),
            //     child: SvgPicture.asset(
            //       'assets/icons/visit_unverified.svg',
            //       height: 20,
            //     ),
            //   ),

            Text(
              (isPhotoReview) ? '사진인증 완료' : '사진인증 안함',
              style: TextStyle(
                  fontFamily: WcFontFamily.notoSans,
                  fontWeight: FontWeight.w600,
                  fontSize: 11.5,
                  height: 1,
                  letterSpacing: 0.1,
                  color: (isPhotoReview) ? WcColors.blue100 : WcColors.red100),
            ),
          ],
        ),
      ),
    );
  }
}
