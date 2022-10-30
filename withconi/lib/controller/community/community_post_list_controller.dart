import 'package:dartz/dartz.dart';
import 'package:withconi/core/tools/helpers/calculator.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/community/community_post_detail_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/module/widgets/loading/loading_overlay.dart';
import '../../data/enums/enum.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/post.dart';
import '../../data/model/report.dart';
import '../../import_basic.dart';
import '../ui_helper/infinite_scroll.dart';

class CommunityPostListController extends GetxController {
  final CommunityRepository _communityRepository = CommunityRepository();
  RxList<Post> postList = <Post>[].obs;
  late String _boardId;
  RxList<String> likePostIdList = <String>[].obs;

  List<PostType> postType = [
    PostType.all,
    PostType.cat,
    PostType.dog,
  ];
  Rx<PostType> selectedPostType = PostType.all.obs;
  Rx<SortType> selectedSortType = SortType.recent.obs;
  List<SortType> postSort = [SortType.recent, SortType.popular];
  Rx<ScrollController> scrollController = ScrollController().obs;

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    limit: 8,
  ).obs;

  final RxBool _lastPage = false.obs;

  final RxBool _isLoading = false.obs;

  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);
  void loadNewPage() => _changePaginationFilter(1, limit);

  String uploadAtStr(DateTime createdAt) =>
      TimeCalculator().calculateUploadAt(createdAt);

  @override
  onInit() {
    super.onInit();
    _boardId = Get.arguments;
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    await showLoading((() => _getPostList(_paginationFilter.value)));
    ever(_paginationFilter, _getPostList);

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
    selectedSortType.value = SortType.recent;
    selectedPostType.value = PostType.all;
  }

  onLikeChanged(String postId, bool isLiked) async {
    if (!isLiked) {
      likePostIdList.remove(postId);
      postList.forEach((element) {
        Post newPost = element.copyWith(likeNum: element.likeNum - 1);
        if (element.postId == postId) {
          postList.replaceRange(postList.indexOf(element),
              postList.indexOf(element) + 1, [newPost]);
        }
      });
    } else {
      likePostIdList.add(postId);
      postList.forEach((element) {
        Post newPost = element.copyWith(likeNum: element.likeNum + 1);
        if (element.postId == postId) {
          postList.replaceRange(postList.indexOf(element),
              postList.indexOf(element) + 1, [newPost]);
        }
      });
    }
    postList.refresh();
    var likePostsEither = await _communityRepository.updateLikePost(
        uid: AuthController.to.wcUser.value!.uid,
        postId: postId,
        isLiked: isLiked);

    likePostsEither.fold(
        (l) => FailureInterpreter().mapFailureToSnackbar(l, 'updateLikePost'),
        (r) {});
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
              scrollController.position.maxScrollExtent * 0.8) {
        onEndOfScroll();
      }
    });
  }

  Future<void> _getPostList(PaginationFilter paginationFilter) async {
    _isLoading.value = true;
    late final postDataEither;

    if (paginationFilter.page == 1) {
      postDataEither = await showLoading(() => _communityRepository.getPostList(
          paginationFilter: paginationFilter,
          boardId: _boardId,
          postType: selectedPostType.value));
    } else {
      postDataEither = await _communityRepository.getPostList(
          paginationFilter: paginationFilter,
          boardId: _boardId,
          postType: selectedPostType.value);
    }

    postDataEither.fold(
        (fail) => FailureInterpreter()
            .mapFailureToSnackbar(fail, '_getPostListByPage'), (newPostList) {
      if (paginationFilter.page == 1) {
        postList.clear();
      }
      if (newPostList.isEmpty) {
        _lastPage.value = true;
      } else {
        likePostIdList.addAll(filterLikedPosts(postList: newPostList));
        postList.addAll(newPostList);
      }
      postList.refresh();
      _isLoading.value = false;
    });
  }

  List<String> filterLikedPosts({required List<Post> postList}) {
    List<String> filteredPostIdList = postList
        .where((post) {
          return post.isLike == true;
        })
        .map((e) => e.postId!)
        .toList();

    return filteredPostIdList;
  }

//TODO : resetPage에 로딩 없애기
  Future<void> resetPage({SortType? sortType, PostType? postType}) async {
    selectedSortType.value = sortType ?? SortType.recent;
    selectedPostType.value = postType ?? PostType.all;
    _lastPage.value = false;
    likePostIdList.clear();
    postList.clear();
    _changePaginationFilter(1, 15);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  onPostTap(Post selectedPost) async {
    Map<CommunityPageResultKey, String>? pageResult =
        await Get.toNamed(Routes.COMMUNITY_POST_DETAIL, arguments: selectedPost)
            as Map<CommunityPageResultKey, String>?;

    if (pageResult != null) {
      if (pageResult.containsKey(CommunityPageResultKey.blockAuthorId)) {
        _blockUserPosts(pageResult[CommunityPageResultKey.blockAuthorId]!);
      }
    }
  }

  onSearchTap() {
    Get.toNamed(Routes.COMMUNITY_POST_SEARCH, arguments: _boardId);
  }

  _deletePost(Post deletePost) async {
    Either<Failure, bool> deleteEither = await showLoading(() =>
        _communityRepository.deletePost(
            postId: deletePost.postId!, boardId: deletePost.boardId));
    deleteEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, 'getPost');
    }, (success) {
      postList.removeWhere((element) => element.postId == deletePost.postId);
      postList.refresh();
    });
  }

  onPostMoreTap(Post post, MoreOption? moreOption) async {
    if (moreOption != null) {
      switch (moreOption) {
        case MoreOption.edit:
          await Get.toNamed(Routes.COMMUNITY_POST_EDIT, arguments: post);
          break;
        case MoreOption.delete:
          await _deletePost(post);
          break;
        case MoreOption.report:
          Get.toNamed(Routes.COMMUNITY_NEW_REPORT,
              arguments: Report(
                  boardId: post.boardId,
                  postId: post.postId!,
                  userId: AuthController.to.wcUser.value!.uid,
                  reviewDesc: []));
          break;
        case MoreOption.block:
          _blockUserPosts(post.authorId);
          break;
        default:
          break;
      }
    }
  }

  _blockUserPosts(String blockUserId) async {
    await showLoading(() => Future.delayed(const Duration(milliseconds: 500)));
    postList.removeWhere((element) => element.authorId == blockUserId);
    postList.refresh();
  }

  void onSortTypeChanged(String? sortingType) {
    if (sortingType != null) {
      selectedSortType.value = SortType.getByCode(sortingType);
    }
    resetPage(
        sortType: selectedSortType.value, postType: selectedPostType.value);
  }

  void onPostTypeChanged(PostType postType) {
    selectedPostType.value = postType;
    resetPage(
        sortType: selectedSortType.value, postType: selectedPostType.value);
  }

  void addNewPost() {
    resetPage();
    Get.toNamed(Routes.COMMUNITY_NEW_POST, arguments: _boardId);
  }
}
