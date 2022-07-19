import 'package:withconi/configs/helpers/calculator.dart';
import 'package:withconi/controller/infinite_scroll_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';

import '../../configs/constants/enum.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../ui_helper/infinite_scroll.dart';

class CommunityBoardDetailController extends GetxController {
  CommunityRepository _communityRepository = CommunityRepository();
  RxList<Post> postList = <Post>[].obs;
  late String _boardId;

  List<PostType> postType = [
    PostType.all,
    PostType.dog,
    PostType.cat,
  ];
  Rx<PostType> selectedPostType = PostType.all.obs;
  Rx<SortType> selectedPostSort = SortType.recent.obs;
  List<SortType> postSort = [SortType.recent, SortType.popular];
  RxList<String> userLikedPost = <String>[].obs;
  RxString thisBoardId = '0'.obs;
  Rx<ScrollController> scrollController = ScrollController().obs;

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    limit: 15,
  ).obs;

  final RxBool _lastPage = false.obs;

  final RxBool _isLoading = false.obs;

  int get limit => _paginationFilter.value.limit!;
  int get _page => _paginationFilter.value.page!;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);

  String uploadAtStr(int postIndex) =>
      TimeCalculator().calculateUploadAt(postList[postIndex].createdAt);

  Color badgeBackgroundColor(int postIndex) {
    switch (postList[postIndex].speciesType) {
      case PostType.all:
        return WcColors.purple20;
      case PostType.cat:
        return WcColors.blue60;
      case PostType.dog:
        return WcColors.green40;
      default:
        return Colors.transparent;
    }
  }

  Color badgeTextColor(int postIndex) {
    switch (postList[postIndex].speciesType) {
      case PostType.all:
        return WcColors.purple100;
      case PostType.cat:
        return WcColors.blue100;
      case PostType.dog:
        return WcColors.green100;

      default:
        return Colors.transparent;
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    _boardId = Get.arguments;
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    await showLoading((() => _getPostList()));
    ever(_paginationFilter, (_) => _getPostList());

    _addScrollListener(
        isLastPage: _lastPage,
        isLoading: _isLoading,
        onEndOfScroll: loadNextPage,
        scrollController: scrollController.value);
  }

  @override
  onClose() {
    super.onClose();
    scrollController.value.dispose();
    selectedPostSort.value = SortType.recent;
    selectedPostType.value = PostType.all;
  }

  _addScrollListener(
      {required ScrollController scrollController,
      required void Function() onEndOfScroll,
      required RxBool isLastPage,
      required RxBool isLoading}) {
    scrollController.addListener(() {
      if (!isLoading.value &&
          !isLastPage.value &&
          scrollController.offset >=
              scrollController.position.maxScrollExtent) {
        onEndOfScroll();
      }
    });
  }

  Future<void> _getPostList() async {
    _isLoading.value = true;
    final postDataEither = await _communityRepository.getPostList(
        paginationFilter: _paginationFilter.value, boardId: thisBoardId.value);

    postDataEither.fold(
        (fail) => FailureInterpreter()
            .mapFailureToSnackbar(fail, '_getPostListByPage'), (newPostList) {
      if (newPostList.isEmpty) {
        _lastPage.value = true;
      } else {
        if (_paginationFilter.value.page == 1) {
          postList.clear();
        }
        postList.addAll(newPostList);
        _isLoading.value = false;
      }
    });
  }

  Future<void> refreshPage() async {
    selectedPostSort.value = SortType.recent;
    selectedPostType.value = PostType.all;
    _lastPage.value = false;
    _changePaginationFilter(1, 15);
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
    if (sortingType != null) {
      selectedPostSort.value = koreanToSortType(sortingType);
    }
  }

  void onPostTypeChanged(PostType postType) {
    selectedPostType.value = postType;
  }

  void addNewPost() async {
    var newPost =
        await Get.toNamed(Routes.COMMUNITY_NEW_POST, arguments: _boardId);
    if (newPost != null) {
      postList.insert(0, newPost);
      postList.refresh();
    }
  }
}
