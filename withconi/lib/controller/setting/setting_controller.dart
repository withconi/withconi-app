import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';
import '../../data/model/conimal.dart';
import '../../data/model/disease.dart';
import '../../data/model/user.dart';
import '../../routes/withconi_routes.dart';

class SettingPageController extends GetxController {
  late WcUser _wcUser;

  @override
  onInit() {
    super.onInit();
    _wcUser = AuthController.to.wcUser.value!;
  }

  manageConimals() {
    Get.toNamed(Routes.CONIMAL_MANAGE, arguments: _wcUser.conimals);
  }

  manageUserInfo() {
    Get.toNamed(
      Routes.USER_EDIT,
    );
  }
}
