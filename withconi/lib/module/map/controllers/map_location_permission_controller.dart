import 'package:withconi/module/navigation/navigation_controller.dart';

import '../../../import_basic.dart';
import 'package:app_settings/app_settings.dart';

class MapPermissionController extends GetxController {
  openAppLocationSetting() async {
    await AppSettings.openLocationSettings();
  }
}
