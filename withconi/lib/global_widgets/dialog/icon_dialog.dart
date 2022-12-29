import 'package:withconi/module/theme/text_theme.dart';

import '../../import_basic.dart';

showIconDialog(
    {required String buttonText,
    required String title,
    Widget? icon,
    bool? dismissible,
    void Function()? onButtonTap,
    required String subtitle}) async {
  return await Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 30),
        backgroundColor: Colors.transparent,
        child: Container(
          height: 275,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: WcColors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon ??
                      Image.asset(
                        'assets/icons/withconi.png',
                        height: 40,
                      ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.workSans(
                        // fontFamily: WcFontFamily.notoSans,
                        color: WcColors.grey140,
                        fontSize: 16,
                        height: 1.3,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              InkWell(
                onTap: onButtonTap ?? () => Get.back(result: true),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: WcColors.blue100,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        color: WcColors.white,
                        fontSize: 16,
                        height: 1,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: dismissible ?? false);
}
