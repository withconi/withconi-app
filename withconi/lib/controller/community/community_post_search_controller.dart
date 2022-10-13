import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/core/error_handling/error_message_object.dart';
import 'package:withconi/data/repository/community_repository.dart';
import '../../configs/constants/enum.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/post.dart';
import '../../import_basic.dart';
import '../ui_helper/infinite_scroll.dart';

class CommunityPostSearchController extends GetxController
    with StateMixin<List<Post>> {
  final CommunityRepository _communityRepository = CommunityRepository();
  TextEditingController searchKeywordTextController = TextEditingController();
  RxBool listLoaded = false.obs;
  late String _boardId;
  late String _userId;
  Rxn<Failure> failure = Rxn<Failure>();
  final RxString _searchKeywords = ''.obs;
  RxList<Post> postListSearched = RxList<Post>();
  List<PostType> postType = [
    PostType.all,
    PostType.cat,
    PostType.dog,
  ];
  Rx<PostType> selectedPostType = PostType.all.obs;

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    limit: 8,
  ).obs;

  Rx<ScrollController> scrollController = ScrollController().obs;

  final RxBool _lastPage = false.obs;
  final RxBool _isLoading = false.obs;

  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);

  late Worker _debounceWorker;

  @override
  void onInit() {
    super.onInit();
    _boardId = Get.arguments;
    _userId = AuthController.to.wcUser.value!.uid;
    _debounceWorker = debounce(_searchKeywords, _changeSearchKeyword,
        time: const Duration(milliseconds: 400));
    ever(_paginationFilter, _getSearchedPostList);

    change(null, status: RxStatus.empty());

    scrollController.value.addListener(() {
      var nextPageTrigger =
          scrollController.value.position.maxScrollExtent * 0.8;
      if (!_isLoading.value &&
          !_lastPage.value &&
          scrollController.value.offset >= nextPageTrigger) {
        loadNextPage();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.value.dispose();
    _debounceWorker.dispose();
  }

  void onKeywordChanged(String val) {
    _searchKeywords.value = val;
    if (val.isEmpty) clearResult();
  }

  void clearResult() {
    searchKeywordTextController.clear();
    postListSearched.clear();
    change(null, status: RxStatus.empty());
  }

  _getSearchedPostList(PaginationFilter paginationFilter) async {
    if (_searchKeywords.value.isEmpty) {
      clearResult();
      return;
    } else {
      if (paginationFilter.page == 1) {
        change(null, status: RxStatus.loading());
      }
      _isLoading.value = true;
      final postDataEither = await _communityRepository.getPostList(
          keyword: _searchKeywords.value,
          paginationFilter: _paginationFilter.value,
          boardId: _boardId,
          postType: selectedPostType.value);

      postDataEither.fold((failure) {
        ErrorMessage errorMessage =
            ErrorMessage.mapFailureToErrorMessage(failure: failure);
        change(null, status: RxStatus.error(errorMessage.message));
      }, (postList) {
        if (postList.isEmpty) {
          _lastPage.value = true;
        } else {
          postListSearched.addAll(postList);
        }
        _isLoading.value = false;
        change(postListSearched, status: RxStatus.success());
      });
    }
    Get.focusScope!.unfocus();
  }

  Future<void> resetPage(PostType postType) async {
    selectedPostType.value = postType;
    _lastPage.value = false;
    postListSearched.clear();
    _changePaginationFilter(1, 15);
  }

  void onPostTypeChanged(PostType postType) {
    selectedPostType.value = postType;
    resetPage(selectedPostType.value);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  // Future<void> _getPostList() async {
  //   _isLoading.value = true;
  //   final postDataEither = await _communityRepository.getPostList(
  //       userId: AuthController.to.wcUser.value!.uid,
  //       paginationFilter: _paginationFilter.value,
  //       boardId: _boardId,
  //       postType: selectedPostType.value);

  //   postDataEither.fold(
  //       (fail) => FailureInterpreter()
  //           .mapFailureToSnackbar(fail, '_getPostListByPage'), (newPostList) {
  //     if (_paginationFilter.value.page == 1) {
  //       postList.clear();
  //     }
  //     if (newPostList.isEmpty) {
  //       _lastPage.value = true;
  //     } else {
  //       likePostIdList.addAll(filterLikedPosts(postList: newPostList));
  //       postList.addAll(newPostList);
  //     }
  //     postList.refresh();
  //     _isLoading.value = false;
  //   });
  // }

  void _changeSearchKeyword(_keyword) {
    postListSearched.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limit);
  }
}
