import 'dart:io';

import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/common_controller/life_cycle_controller.dart';
import 'package:withconi/controller/map/map_main_page_controller.dart';
import 'package:withconi/ui/entities/nav_destination.dart';
import 'package:withconi/ui/pages/community/community_main_page.dart';
import 'package:withconi/ui/pages/diagnosis/diagnosis_main_page.dart';
import 'package:withconi/ui/pages/dictionary/dictionary_main_page.dart';
import 'package:withconi/ui/pages/map/map_main_page.dart';
import '../../data/model/conimal.dart';
import '../../data/model/disease.dart';
import '../../data/model/user.dart';
import '../import_basic.dart';
import '../routes/withconi_routes.dart';
import '../ui/pages/home/home_page.dart';

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
