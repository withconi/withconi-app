import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';
import '../../data/model/user.dart';
import '../../routes/withconi_routes.dart';

class CommunitySettingPageController extends GetxController {
  late WcUser _wcUser;

  @override
  onInit() {
    super.onInit();
    _wcUser = AuthController.to.wcUser.value!;
  }

  manageUserInfo() {
    Get.toNamed(
      Routes.USER_EDIT,
    );
  }

  myLikedPosts() {
    Get.toNamed(Routes.USER_LIKED_POST, arguments: _wcUser.uid);
  }

  myPostPage() {
    Get.toNamed(Routes.USER_MY_POST, arguments: _wcUser.uid);
  }
}
