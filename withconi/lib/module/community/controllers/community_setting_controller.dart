import 'package:get/get.dart';
import '../../../routes/routes.dart';

class CommunitySettingPageController extends GetxController {
  goToEditUserInfoPage() {
    Get.toNamed(Routes.USER_EDIT);
  }

  goToLikedPostPage() {
    Get.toNamed(Routes.COMMUNITY_LIKE_POST,
        arguments: {'postAbstractController': null});
  }

  goToMyPostPage() {
    Get.toNamed(Routes.COMMUNITY_MY_POST,
        arguments: {'postAbstractController': null});
  }
}
