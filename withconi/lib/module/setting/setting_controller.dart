import 'package:get/get.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/module/ui_model/user_ui_model.dart';

import '../../routes/routes.dart';
import '../ui_model/conimal_ui_model.dart';

class SettingPageController extends GetxController {
  SettingPageController();
  List<ConimalUIModel> _conimalList =
      AuthController.to.userInfo.conimals.toList();

  goToManageConimalPage() {
    Get.toNamed(Routes.CONIMAL_MANAGE,
        arguments: {'conimals': _conimalList.toList()});
  }

  goToManageUserInfoPage() {
    Get.toNamed(
      Routes.USER_EDIT,
    );
  }

  goToMyLikedPostsPage() {
    Get.toNamed(Routes.COMMUNITY_LIKE_POST,
        arguments: {'postAbstractController': null});
  }

  goToMyPostPage() {
    Get.toNamed(Routes.COMMUNITY_MY_POST,
        arguments: {'postAbstractController': null});
  }

  goToRequestPage() {
    // return;
    Get.toNamed(Routes.REQUEST);
  }

  goToDeveloperInfoPage() {
    // return;
    Get.toNamed(Routes.DEVELOPER_INFO);
  }
}
