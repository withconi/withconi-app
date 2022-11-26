import 'package:flutter_svg/svg.dart';

import '../../import_basic.dart';

class PlaceVerificationButton extends StatelessWidget {
  PlaceVerificationButton({Key? key, required this.visitVerified, this.onTap})
      : super(key: key);

  bool visitVerified;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: (visitVerified) ? WcColors.blue20 : WcColors.red20,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8,
            ),
            (visitVerified)
                ? Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: SvgPicture.asset(
                      'assets/icons/visit_verified.svg',
                      height: 19,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: SvgPicture.asset(
                      'assets/icons/visit_unverified.svg',
                      height: 20,
                    ),
                  ),
            const SizedBox(
              height: 5,
            ),
            Text(
              (visitVerified) ? '방문인증 완료' : '방문인증 하기',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.5,
                  color: (visitVerified) ? WcColors.blue100 : WcColors.red100),
            ),
          ],
        ),
      ),
    );
  }
}
