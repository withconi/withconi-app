import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/common_controller/life_cycle_controller.dart';
import 'package:withconi/controller/navigation_controller.dart';

import '../controller/community/community_main_controller.dart';
import '../controller/home/home_controller.dart';
import '../controller/map/map_main_page_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<LifeCycleController>(LifeCycleController(), permanent: true);
  }
}

class NavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
    Get.lazyReplace(() => HomeController(), tag: 'Initial', fenix: true);
    Get.lazyReplace(() => CommunityMainController(),
        tag: 'Initial', fenix: true);
    Get.lazyReplace(() => MapMainPageController(), tag: 'Initial', fenix: true);
  }
}
