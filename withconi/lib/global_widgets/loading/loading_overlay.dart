import 'package:lottie/lottie.dart';

import '../../import_basic.dart';

Future<dynamic> showLoading(Future<dynamic> Function() asyncFunction) async {
  return Get.showOverlay(
      opacityColor: Colors.white,
      asyncFunction: asyncFunction,
      loadingWidget: SizedBox(
        height: 100,
        child: SizedBox(
          height: WcHeight - 380,
          child: OverflowBox(
            minHeight: 140,
            maxHeight: 140,
            child: Lottie.asset('assets/json/loading.json'),
          ),
        ),
      ));
}
