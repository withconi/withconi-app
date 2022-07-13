import '../../import_basic.dart';

class CommunityDetailController extends GetxController {
  List<String> postList = [
    '먼지',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'H',
    'I',
    'b',
    // 'a',
    // 'b',
    // 'a',
    // 'b'
  ];

  List<String> postType = [
    '모두',
    '강아지',
    '고양이',
  ];
  RxString selectedPostType = '모두'.obs;
  RxString selectedPostSort = '최신순'.obs;
  List<String> postSort = ['최신순', '인기순'];
  RxList<String> userLikedPost = ['먼지', 'c', 'd'].obs;

  void onPostSortingChanged(String? sortingType) {
    selectedPostSort.value = sortingType!;
  }

  void onPostTypeChanged(String postType) {
    selectedPostType.value = postType;
  }
}
