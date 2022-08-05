import '../../../import_basic.dart';

Future<bool> showSelectionDialog(
    {required String confirmText,
    required String cancleText,
    required String title,
    void Function()? onConfirmTap,
    void Function()? onCancleTap,
    String? subtitle}) async {
  var result = await Get.dialog(Dialog(
    backgroundColor: Colors.transparent,
    child: Container(
      height: (subtitle != null) ? 180 : 160,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
                  style: GoogleFonts.notoSans(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
              (subtitle == null)
                  ? SizedBox.shrink()
                  : SizedBox(
                      height: 35,
                      child: Text(
                        subtitle,
                        style: GoogleFonts.notoSans(
                            color: WcColors.grey140,
                            fontSize: 16.5,
                            fontWeight: FontWeight.w500),
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
   
    // Get.defaultDialog(
    //     title: title,
    //     titlePadding: EdgeInsets.all(20),
    //     contentPadding: EdgeInsets.all(20),
    //     actions: [
    //       Row(
    //         children: [
    //           InkWell(
    //             onTap: onCancleTap ?? () => false,
    //             child: Container(
    //               alignment: Alignment.center,
    //               decoration: BoxDecoration(color: WcColors.blue100),
    //               child: Text(cancleText),
    //             ),
    //           ),
    //           InkWell(
    //             onTap: onCancleTap ?? () => false,
    //             child: Container(
    //               alignment: Alignment.center,
    //               decoration: BoxDecoration(color: WcColors.blue100),
    //               child: Text(cancleText),
    //             ),
    //           ),
    //         ],
    //       )
    //     ]);
// Container(
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: WcColors.white,
//       ),
//       child: Column(
//         children: [
//           Text(title),
//           (subtitle == null) ? SizedBox.shrink() : Text(subtitle),
//           Row(
//             children: [
//               InkWell(
//                 onTap: onFalseTap ?? () => false,
//                 child: Container(
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(color: WcColors.grey120),
//                   child: Text(falseText),
//                 ),
//               ),
//               InkWell(
//                 onTap: onTrueTap ?? () => true,
//                 child: Container(
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(color: WcColors.blue100),
//                   child: Text(trueText),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     )