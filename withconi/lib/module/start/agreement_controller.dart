// ignore_for_file: constant_identifier_names
import 'package:withconi/core/tools/helpers/cache_manager.dart';
import 'package:withconi/data/enums/enum.dart';

import '../../import_basic.dart';

class AgreementController extends GetxController {
  onStartWithconiTap() async {
    bool saveSucceed =
        await CacheManager.saveCache(CacheControllerKey.appInited, true);

    if (saveSucceed) {
      Get.offNamed(Routes.START);
    }
  }
}
