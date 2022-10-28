import 'package:withconi/controller/common_controller/life_cycle_controller.dart';
import '../import_basic.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();
  RxInt navBarIndex = 0.obs;
  RxString rootPageRoute = Routes.HOME.obs;

  @override
  onReady() {
    super.onReady();
    ever(rootPageRoute, _checkPermissionStatus);
  }

  _checkPermissionStatus(String changedRootRoute) async {
    await LifeCycleController.to
        .checkRootPageStatus(rootRoute: changedRootRoute);
  }

  getPageByIndex(int index) {
    navBarIndex(index);

    switch (index) {
      case 0:
        rootPageRoute(Routes.HOME);
        break;
      case 1:
        rootPageRoute(Routes.MAP_MAIN);
        break;
      case 2:
        rootPageRoute(Routes.COMMUNITY_MAIN);
        break;
      case 3:
        rootPageRoute(Routes.DICTIONARY_MAIN);
        break;
      default:
    }
  }
}
