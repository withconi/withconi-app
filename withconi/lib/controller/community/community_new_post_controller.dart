import '../../import_basic.dart';

class CommunityNewPostController extends GetxController {
  List<String> postType = [
    '모두',
    '강아지',
    '고양이',
  ];
  RxString selectedPostType = '모두'.obs;

  RxList<String> pictureFileList = ['', '', '', "", ''].obs;

  void onPostTypeChanged(String postType) {
    selectedPostType.value = postType;
  }
}
