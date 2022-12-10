import 'package:lottie/lottie.dart';

import '../../import_basic.dart';

Future<dynamic> showLoading(Future<dynamic> Function() asyncFunction,
    {Widget? loadingWidget, bool activeLoding = true}) async {
  return Get.showOverlay(
      opacityColor: (activeLoding) ? Colors.white : Colors.transparent,
      asyncFunction: asyncFunction,
      loadingWidget: (activeLoding)
          ? loadingWidget ??
              SizedBox(
                height: WcHeight - 380,
                child: SizedBox(
                  child: OverflowBox(
                    minHeight: 125,
                    maxHeight: 125,
                    child: Lottie.asset('assets/json/loading.json'),
                  ),
                ),
              )
          : const SizedBox.shrink());
}
