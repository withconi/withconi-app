import 'package:withconi/controller/infinite_scroll_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';

import '../../configs/constants/enum.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../ui_helper/infinite_scroll.dart';

class CommunityDetailController extends GetxController {
  CommunityRepository _communityRepository = CommunityRepository();
  RxList<Post> postList = <Post>[
    // Post(
    //     boardId: "boardId",
    //     postId: "postId",
    //     nickname: "nickname",
    //     speciesType: Species.cat,
    //     content:
    //         "고양이가 밥을 안 먹으려고 할 때 단순히 식사 투정이라고 생각하고 그냥 넘어가면 안돼요. 질병이 원인일 수도 있기 때문이죠. 코가 막히거나 감기가 걸려 불편해서 밥을 안 먹을 수도 있고, 위장에 염증이 있거나 기생충에 감염되었을 수도 있어요. 아니면 이물질을 삼켜 식사 중 구토를 하거나 음식을 제대로 먹지 못하고, 치아나 잇몸에 염증이 있어 통증을 느낄 수도 있습니다.",
    //     createdAt: DateTime.now())
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
  RxString thisBoardId = '0'.obs;

  final _paginationFilter = PaginationFilter(limit: 15, page: 1).obs;
  final _lastPage = false.obs;

  Rx<ScrollController> scrollController = ScrollController().obs;

  int get limit => _paginationFilter.value.limit!;
  int get _page => _paginationFilter.value.page!;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);

  @override
  onReady() async {
    super.onReady();

    await showLoading((() => _getPostList()));
    ever(_paginationFilter, (_) => _getPostList());

    _addScrollListener(
        isLastPage: _lastPage,
        onEndOfScroll: loadNextPage,
        scrollController: scrollController.value);
  }

  @override
  onClose() {
    super.onClose();
    scrollController.value.dispose();
  }

  _addScrollListener(
      {required ScrollController scrollController,
      required void Function() onEndOfScroll,
      required RxBool isLastPage}) {
    scrollController.addListener(() {
      if (!isLastPage.value &&
          scrollController.offset >=
              scrollController.position.maxScrollExtent) {
        onEndOfScroll();
      }
    });
  }

  Future<void> _getPostList() async {
    final postDataEither = await _communityRepository.getPostList(
        paginationFilter: _paginationFilter.value, boardId: thisBoardId.value);

    postDataEither.fold(
        (fail) => FailureInterpreter()
            .mapFailureToSnackbar(fail, '_getPostListByPage'), (newPostList) {
      if (newPostList.isEmpty) {
        _lastPage.value = true;
      } else {
        postList.addAll(newPostList);
      }
    });
  }

  void changeTotalPerPage(int limitValue) {
    postList.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  void onPostSortingChanged(String? sortingType) {
    selectedPostSort.value = sortingType!;
  }

  void onPostTypeChanged(String postType) {
    selectedPostType.value = postType;
  }
}
