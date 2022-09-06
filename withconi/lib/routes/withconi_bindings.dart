import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';

import 'package:withconi/data/repository/signup_repository.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyReplace(() => SignupRepository(), fenix: true);
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}

// class HomeBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.put<NavigationController>(NavigationController(), permanent: true);
//     Get.put<HomeController>(HomeController(), permanent: true);
//     Get.put<CommunityMainController>(CommunityMainController(),
//         permanent: true);
//     Get.put<MapMainPageController>(MapMainPageController(), permanent: true);
//   }
// }
