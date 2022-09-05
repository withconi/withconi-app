import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';
import '../../data/model/conimal.dart';
import '../../data/model/disease.dart';
import '../../data/model/user.dart';
import '../routes/withconi_routes.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();
  RxInt navBarIndex = 0.obs;

  // onNavChanged({required int navIndex}) {
  //   switch (navIndex) {
  //     case 0:
  //       Get.offAllNamed(Routes.HOME, arguments: AuthController.to.wcUser.value);
  //       break;
  //     case 1:
  //       Get.offAllNamed(Routes.DIAGNOSIS_MAIN);
  //       break;
  //     case 2:
  //       Get.offAllNamed(Routes.MAP_MAIN);
  //       break;
  //     case 3:
  //       Get.offAllNamed(Routes.COMMUNITY_MAIN);
  //       break;
  //     case 4:
  //       Get.offAllNamed(Routes.DICTIONARY_MAIN);
  //       break;
  //     default:
  //   }
  //   navBarIndex.value = navIndex;
  // }

  void changeNavIndex(int index) {
    navBarIndex(index);
  }
}
