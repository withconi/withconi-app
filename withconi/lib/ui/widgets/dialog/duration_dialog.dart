import 'package:lottie/lottie.dart';

import '../../../import_basic.dart';

Future<dynamic> showDurationDialog(
    Future<dynamic> Function() asyncFunction) async {
  return Get.showOverlay(
      opacity: 0.7,
      opacityColor: Colors.white,
      asyncFunction: asyncFunction,
      loadingWidget: SizedBox(
          height: 800,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Lottie.asset('assets/json/success2.json',
                    repeat: false, width: 350),
              ),
            ],
          )));
}
