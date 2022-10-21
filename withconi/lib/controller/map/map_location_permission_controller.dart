import 'package:withconi/controller/navigation_controller.dart';

import '../../import_basic.dart';
import 'package:app_settings/app_settings.dart';

class MapPermissionController extends GetxController {
  openAppLocationSetting() async {
    await AppSettings.openLocationSettings();
  }
}
