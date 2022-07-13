import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';
import '../../data/model/conimal.dart';
import '../../data/model/disease.dart';
import '../../data/model/user.dart';
import '../routes/withconi_routes.dart';

class NavController extends GetxController {
  static NavController get to => Get.find();
  RxInt navBarIndex = 0.obs;

  @override
  onInit() {}

  onNavChanged({required int navIndex}) {
    navBarIndex.value = navIndex;
    if (navIndex == 0) {
      Get.offAllNamed(Routes.HOME, arguments: AuthController.to.wcUser.value);
    } else if (navIndex == 3) {
      Get.offAllNamed(Routes.COMMUNITY_MAIN);
    }
  }
}
