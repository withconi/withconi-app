import 'package:get/get.dart';
import '../../../routes/routes.dart';

class CommunitySettingPageController extends GetxController {
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
