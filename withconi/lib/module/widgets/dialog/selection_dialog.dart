import 'package:withconi/module/theme/text_theme.dart';

import '../../../import_basic.dart';

Future<bool> showSelectionDialog(
    {required String confirmText,
    required String cancleText,
    required String title,
    void Function()? onConfirmTap,
    void Function()? onCancleTap,
    String? subtitle}) async {
  var result = await Get.dialog(Dialog(
    insetPadding: EdgeInsets.symmetric(horizontal: 30),
    backgroundColor: Colors.transparent,
    child: Container(
      height: (subtitle != null) ? 180 : 160,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: WcColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 35,
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              (subtitle == null)
                  ? SizedBox.shrink()
                  : SizedBox(
                      height: 35,
                      child: Text(
                        subtitle,
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            color: WcColors.grey140,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: onCancleTap ??
                      () {
                        Get.back(result: false);
                      },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: WcColors.grey110,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      cancleText,
                      style: GoogleFonts.notoSans(
                          color: WcColors.grey180,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: InkWell(
                  onTap: onConfirmTap ??
                      () {
                        Get.back(result: true);
                      },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: WcColors.blue100,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      confirmText,
                      style: GoogleFonts.notoSans(
                          color: WcColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ));

  result ??= false;
  return result;
}
