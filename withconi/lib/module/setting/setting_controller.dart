import 'package:get/get.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/module/ui_model/user_ui_model.dart';

import '../../routes/routes.dart';

class SettingPageController extends GetxController {
  SettingPageController(this._wcUser);
  UserUIModel _wcUser;

  @override
  onInit() {
    super.onInit();
    _wcUser = AuthController.to.userInfo!;
  }

  manageConimals() {
    Get.toNamed(Routes.CONIMAL_MANAGE, arguments: _wcUser.conimals);
  }

  manageUserInfo() {
    Get.toNamed(
      Routes.USER_EDIT,
    );
  }

  myLikedPosts() {
    Get.toNamed(Routes.COMMUNITY_LIKE_POST);
  }

  myPostPage() {
    Get.toNamed(Routes.COMMUNITY_MY_POST);
  }
}
