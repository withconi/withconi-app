import 'package:withconi/module/theme/text_theme.dart';

import '../import_basic.dart';

showCustomSnackbar(
        {required String text,
        Duration? animationDuration,
        Duration? totalDuration,
        SnackPosition? snackPosition}) =>
    Get.showSnackbar(GetSnackBar(
      // snackStyle: SnackStyle.FLOATING,
      backgroundColor: const Color.fromARGB(227, 41, 41, 41),
      barBlur: 10,
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      padding: const EdgeInsets.symmetric(vertical: 15),
      borderRadius: 10,
      titleText: Text(
        text,
        style: TextStyle(
            fontFamily: WcFontFamily.notoSans,
            height: 1.5,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: WcColors.white),
        textAlign: TextAlign.center,
      ),
      messageText: const SizedBox.shrink(),
      animationDuration: animationDuration ?? const Duration(milliseconds: 300),
      duration: totalDuration ?? const Duration(milliseconds: 1500),
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
    ));
