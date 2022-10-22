import 'dart:async';
import 'dart:developer';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:withconi/configs/helpers/dynamic_link_manager.dart';
import 'package:withconi/controller/community/community_main_controller.dart';
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

    if (Get.currentRoute != Routes.START && Get.currentRoute != Routes.SPLASH) {
      await checkRootPageStatus(
          rootRoute: NavigationController.to.rootPageRoute.value);
    }
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
