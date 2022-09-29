import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:withconi/controller/map/map_location_permission_controller.dart';
import 'package:withconi/ui/pages/map/map_location_permission_page.dart';

import '../../routes/withconi_routes.dart';
import '../navigation_controller.dart';

class LifeCycleController extends SuperController {
  @override
  void onDetached() {
    print('app detached');
  }

  @override
  void onInactive() {
    print('app inactive');
  }

  @override
  void onPaused() {
    print('app paused');
  }

  @override
  Future<void> onResumed() async {
    switch (Get.currentRoute) {
      case Routes.MAP_LOCATION_PERMISSION:
        break;
      case Routes.MAP_LOCATION_PERMISSION:
        break;
      default:
    }
    print('app resumed');
    LocationPermission permission = await Geolocator.checkPermission();
    if ((permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse) &&
        Get.currentRoute == Routes.MAP_LOCATION_PERMISSION) {
      await grantedPermission();
    } else if ((permission != LocationPermission.always ||
            permission != LocationPermission.whileInUse) &&
        NavigationController.to.navBarIndex.value == 2) {
      await Get.toNamed(Routes.MAP_LOCATION_PERMISSION);
    }
  }

  grantedPermission() {
    Get.back();
    NavigationController.to.getPageByIndex(2);
  }
}
