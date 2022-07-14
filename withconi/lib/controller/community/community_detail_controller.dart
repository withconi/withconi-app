import '../../import_basic.dart';
import '../ui_helper/infinite_scroll.dart';

class CommunityDetailController extends GetxController {
  RxList<String> postList = [
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
  ].obs;

  List<String> postType = [
    '모두',
    '강아지',
    '고양이',
  ];
  RxString selectedPostType = '모두'.obs;
  RxString selectedPostSort = '최신순'.obs;
  List<String> postSort = ['최신순', '인기순'];
  RxList<String> userLikedPost = ['먼지', 'c', 'd'].obs;
  Rx<ScrollController> scrollController = ScrollController().obs;

  @override
  onInit() {
    super.onInit();

    // scrollController.value.addListener(() {

    //   scrollController.value.
    // });
  }

  @override
  onReady() {
    super.onReady();

    // ever(scrollController, getPostList);
  }

  Future<List<String>> getPost() async {
    List<String> postList = ['a', 'b'];
    return await postList;
  }

  // getPostList(_scrollController) async {
  //   postList.add(await infiniteScroller.getDataByScrollEvent(
  //       asyncFunction: getPost, scrollController: _scrollController));
  // }

  void onPostSortingChanged(String? sortingType) {
    selectedPostSort.value = sortingType!;
  }

  void onPostTypeChanged(String postType) {
    selectedPostType.value = postType;
  }
}
