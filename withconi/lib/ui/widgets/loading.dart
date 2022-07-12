import 'package:lottie/lottie.dart';

import '../../import_basic.dart';

Future<dynamic> showLoading(Future<dynamic> Function() asyncFunction) async {
  Get.showOverlay(
      opacityColor: Colors.white,
      asyncFunction: asyncFunction,
      loadingWidget: SizedBox(
        height: 100,
        child: SizedBox(
          height: WcHeight - 380,
          child: OverflowBox(
            minHeight: 160,
            maxHeight: 160,
            child: Lottie.asset('assets/json/loading.json'),
          ),
        ),
      ));
}
