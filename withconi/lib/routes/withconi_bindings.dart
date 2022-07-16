import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/home/home_controller.dart';
import 'package:withconi/controller/nav_controller.dart';
import 'package:withconi/data/model/conimal.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/data/repository/signup_repository.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyReplace(() => SignupRepository(), fenix: true);
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<NavController>(NavController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: false);
  }
}
