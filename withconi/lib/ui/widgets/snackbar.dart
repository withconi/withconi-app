import '../../import_basic.dart';

showSnackbar() => Get.showSnackbar(GetSnackBar(
      backgroundColor: Color.fromARGB(227, 41, 41, 41),
      barBlur: 10,
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.fastLinearToSlowEaseIn,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 15),
      borderRadius: 10,
      titleText: Text(
        '3마리의 코니멀까지만 등록 가능합니다',
        style: GoogleFonts.notoSans(
            fontSize: 16, fontWeight: FontWeight.normal, color: WcColors.white),
        textAlign: TextAlign.center,
      ),
      messageText: SizedBox.shrink(),
      animationDuration: Duration(milliseconds: 900),
      duration: Duration(milliseconds: 2000),
      snackPosition: SnackPosition.BOTTOM,
    ));
