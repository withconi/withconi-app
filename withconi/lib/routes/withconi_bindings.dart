import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';
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
