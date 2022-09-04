import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/community/community_main_controller.dart';
import 'package:withconi/controller/home/home_controller.dart';
import 'package:withconi/controller/hospital/hospital_page_controller.dart';
import 'package:withconi/controller/navigation_controller.dart';
import 'package:withconi/data/model/conimal.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/data/repository/signup_repository.dart';
import 'package:withconi/ui/pages/dictionary/dictionary_main_page.dart';

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
