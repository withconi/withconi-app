import 'package:get/get.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/module/common/controllers/life_cycle_controller.dart';
import 'package:withconi/module/navigation/navigation_controller.dart';

import '../module/community/controllers/community_main_controller.dart';
import '../module/home/home_controller.dart';
import '../module/map/controllers/map_main_page_controller.dart';

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
    Get.lazyPut(() => HomeController(), tag: 'Initial', fenix: true);
    Get.lazyPut(() => CommunityMainController(), tag: 'Initial', fenix: true);
    Get.lazyPut(() => MapMainPageController(), tag: 'Initial', fenix: true);
  }
}

// class CommunityBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyReplace(() => CommunityMainController(),
//         tag: 'Initial', fenix: true);
//   }
// }
