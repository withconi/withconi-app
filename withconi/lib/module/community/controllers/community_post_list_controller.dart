import 'package:dartz/dartz.dart';
import 'package:withconi/core/tools/helpers/calculator.dart';
import 'package:withconi/data/model/dto/response_dto/community_response/post_response_dto.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/module/community/controllers/community_post_detail_controller.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/community/controllers/custom_state_mixin.dart';
import 'package:withconi/module/page_status.dart';
import 'package:withconi/module/ui_model/board_ui_model.dart';
import 'package:withconi/module/ui_model/post_list_filter_ui_model.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import 'package:withconi/module/ui_model/report_ui_model.dart';
import '../../../data/enums/enum.dart';
import '../../../core/error_handling/failures.dart';
import '../../../import_basic.dart';
import '../../../core/tools/helpers/infinite_scroll.dart';

class CommunityPostListController extends GetxController
    with WcStateMixin
    implements InfiniteScroll {
  CommunityPostListController(this._communityRepository);
  final CommunityRepository _communityRepository;

  late Rx<PostListFilterUIModel> postListFilter;
  RxList<PostUIModel> postUIList = <PostUIModel>[].obs;

  RxString boardName = ''.obs;
  late final String _boardId;

  @override
  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    listSize: 5,
  ).obs;

  int get _page => _paginationFilter.value.page;
  int get _listSize => _paginationFilter.value.listSize;

  @override
  void loadNextPage() => changePaginationFilter(_page + 1, _listSize);

  @override
  void loadNewPage() => changePaginationFilter(1, _listSize);

  @override
  ScrollController infiniteScrollController = ScrollController();

  @override
  double get nextPageTrigger =>
      0.8 * infiniteScrollController.position.maxScrollExtent;

  @override
  void addInfiniteScrollListener() {
    infiniteScrollController.addListener(() {
      if ((status == PageStatus.success()) &&
          infiniteScrollController.offset >= nextPageTrigger) {
        loadNextPage();
      }
    });
  }

  @override
  Future<void> getDataByPaginationFilter(
      PaginationFilter _paginationFilter) async {
    if (_paginationFilter.page == 1) {
      await _getPostList(_paginationFilter);
    } else {
      await _morePostList(_paginationFilter);
    }
  }

  @override
  onInit() {
    super.onInit();
    change(null, status: PageStatus.init());
    var boardUIModel = (Get.arguments as BoardUIModel);
    _boardId = boardUIModel.boardId;
    boardName.value = boardUIModel.title;
    postListFilter = Rx<PostListFilterUIModel>(
        PostListFilterUIModel(postType: PostType.all, keyword: ''));
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    ever(_paginationFilter, getDataByPaginationFilter);
    ever(postListFilter, (_) => loadNewPage());
    loadNewPage();
    addInfiniteScrollListener();
  }

  @override
  onClose() {
    super.onClose();
    infiniteScrollController.dispose();
    _paginationFilter.close();
    postUIList.close();
    postListFilter.close();
  }

  onLikeChanged(int postIndex, bool isLiked) async {
    _updateLikeUiChanges(postIndex, isLiked);

    var likePostsEither = await _communityRepository.updateLikePost(
        postId: postUIList[postIndex].postId, isLiked: isLiked);

    likePostsEither.fold((l) {
      FailureInterpreter().mapFailureToSnackbar(l, 'updateLikePost');
      _updateLikeUiChanges(postIndex, !isLiked);
    }, (success) {});
  }

  void _updateLikeUiChanges(int postIndex, bool isLiked) {
    postUIList[postIndex].isLikeOn = isLiked;
    if (isLiked) {
      postUIList[postIndex].likeNum += 1;
    } else {
      postUIList[postIndex].likeNum -= 1;
    }
    postUIList.refresh();
  }

  Future<void> _getPostList(PaginationFilter paginationFilter) async {
    change(null, status: PageStatus.loading());
    final Either<Failure, List<PostResponseDTO>> postDataEither =
        await _communityRepository.getPostList(
            paginationFilter: paginationFilter,
            postListFilterUiModel: postListFilter.value,
            boardId: _boardId);

    postDataEither.fold(
        (fail) => FailureInterpreter().mapFailureToSnackbar(
            fail, '_getPostListByPage'), (newPostListDto) {
      if (newPostListDto.isEmpty) {
        change(null, status: PageStatus.empty());
      } else {
        postUIList.assignAll(_parsePostListDto(newPostListDto));
        change(null, status: PageStatus.success());
        postUIList.refresh();
      }

      return;
    });
  }

  Future<void> refreshPage() async {
    loadNewPage();
  }

  List<PostUIModel> _parsePostListDto(List<PostResponseDTO> postListDTO) {
    return postListDTO.map((e) => PostUIModel.fromDTO(e)).toList();
  }

  Future<void> _morePostList(PaginationFilter paginationFilter) async {
    change(null, status: PageStatus.loadingMore());

    final Either<Failure, List<PostResponseDTO>> postDataEither =
        await _communityRepository.getPostList(
            postListFilterUiModel: postListFilter.value,
            paginationFilter: paginationFilter,
            boardId: _boardId);

    postDataEither.fold(
        (fail) => FailureInterpreter().mapFailureToSnackbar(
            fail, '_getPostListByPage'), (morePostListDto) {
      if (morePostListDto.isEmpty) {
        change(null, status: PageStatus.emptyLastPage());
      } else {
        postUIList.addAll(_parsePostListDto(morePostListDto));
        change(null, status: PageStatus.success());
        postUIList.refresh();
      }
    });
  }

  @override
  void changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.listSize = limit;
    });
  }

  onPostTap(int postIndex) async {
    Map<CommunityPageResultKey, String>? pageResult = await Get.toNamed(
            Routes.COMMUNITY_POST_DETAIL,
            arguments: postUIList[postIndex])
        as Map<CommunityPageResultKey, String>?;

    if (pageResult != null) {
      if (pageResult.containsKey(CommunityPageResultKey.blockAuthorId)) {
        _blockThisUserPosts(pageResult[CommunityPageResultKey.blockAuthorId]!);
      }
    }
  }

  onSearchTap() {
    Get.toNamed(Routes.COMMUNITY_POST_SEARCH, arguments: _boardId);
  }

  _deletePost(int postIndex) async {
    Either<Failure, bool> deleteEither = await showLoading(() =>
        _communityRepository.deletePost(
            postId: postUIList[postIndex].postId,
            boardId: postUIList[postIndex].postId));
    deleteEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, 'getPost');
    }, (success) {
      postUIList.removeAt(postIndex);
      postUIList.refresh();
    });
  }

  onPostMoreTap(int postIndex, MoreOption? moreOption) async {
    if (moreOption != null) {
      switch (moreOption) {
        case MoreOption.edit:
          await Get.toNamed(Routes.COMMUNITY_POST_EDIT,
              arguments: postUIList[postIndex]);
          break;
        case MoreOption.delete:
          await _deletePost(postIndex);
          break;
        case MoreOption.report:
          Get.toNamed(Routes.COMMUNITY_REPORT,
              arguments: ReportUIModel(
                boardId: postUIList[postIndex].boardId,
                postId: postUIList[postIndex].postId,
                authorId: postUIList[postIndex].authorId,
              ));
          break;
        case MoreOption.block:
          _blockThisUserPosts(postUIList[postIndex].authorId);
          break;
        default:
          break;
      }
    }
  }

  _blockThisUserPosts(String blockUserId) async {
    await showLoading(() => Future.delayed(const Duration(milliseconds: 500)));
    postUIList.removeWhere((element) => element.authorId == blockUserId);
    postUIList.refresh();
  }

  void onPostTypeChanged(PostType postType) {
    postListFilter.value.postType = postType;
    postListFilter.refresh();
  }

  Future<void> addNewPost() async {
    var newPostResult =
        await Get.toNamed(Routes.COMMUNITY_NEW_POST, arguments: _boardId)
            as PostUIModel?;

    if (newPostResult != null) {
      postUIList.insert(0, newPostResult.copyWith());
    }
  }
}
