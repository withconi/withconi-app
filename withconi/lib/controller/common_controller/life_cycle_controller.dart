import 'dart:developer';
import 'package:get/get.dart';
import 'package:withconi/controller/map/map_main_page_controller.dart';
import '../../routes/withconi_routes.dart';
import '../navigation_controller.dart';

class LifeCycleController extends SuperController {
  static LifeCycleController get to => Get.find();

  @override
  void onDetached() {
    log('app detached');
  }

  @override
  Future<void> onInactive() async {
    log('app inactive');
  }

  @override
  void onPaused() {
    log('app paused');
  }

  @override
  Future<void> onResumed() async {
    log('app resumed');
    await checkRootPageStatus(
        rootRoute: NavigationController.to.rootPageRoute.value);
  }

  checkRootPageStatus({required String rootRoute}) async {
    switch (rootRoute) {
      case Routes.HOME:
        break;
      case Routes.DIAGNOSIS_MAIN:
        break;
      case Routes.MAP_MAIN:
        await _checkMapPageStatus();
        break;
      case Routes.COMMUNITY_MAIN:
        break;
      case Routes.DICTIONARY_MAIN:
        break;
      default:
    }
  }

  _checkMapPageStatus() async {
    await MapMainPageController.to.setPermissionStatus();
  }
}
