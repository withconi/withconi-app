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
import '../../../global_widgets/dialog/selection_dialog.dart';
import '../../../global_widgets/photo_gallary/image_item.dart';
import '../../../global_widgets/snackbar.dart';
import '../../../import_basic.dart';
import '../../../core/tools/helpers/infinite_scroll.dart';
import '../abstract/post_model_abstract.dart';

class CommunityPostListController extends GetxController
    with WcStateMixin<List<PostUIModel>>
    implements AbstractPostUpdate {
  static CommunityPostListController get to => Get.find();
  CommunityPostListController(
      this._communityRepository, this._boardId, this.boardName);
  final CommunityRepository _communityRepository;

  late Rx<PostListFilterUIModel> postListFilter;
  RxList<PostUIModel> postUIList = <PostUIModel>[].obs;

  String boardName = '';
  ImageItem get userProfileImage => AuthController.to.userInfo.profileImage;
  late final String _boardId;

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    listSize: 5,
  ).obs;

  int get _page => _paginationFilter.value.page;
  int get _listSize => _paginationFilter.value.listSize;

  void loadNextPage() => changePaginationFilter(_page + 1, _listSize);

  void loadNewPage() => changePaginationFilter(1, _listSize);

  @override
  onInit() {
    super.onInit();
    change([], status: PageStatus.init());
    postListFilter = Rx<PostListFilterUIModel>(
        PostListFilterUIModel(postType: PostType.all, keyword: ''));
  }

  @override
  onReady() {
    super.onReady();

    ever(postListFilter, (_) => loadNewPage());
    ever(_paginationFilter, getDataByPaginationFilter);
    loadNewPage();
  }

  Future<void> getDataByPaginationFilter(
      PaginationFilter _paginationFilter) async {
    if (_paginationFilter.page == 1) {
      await _getPostList(_paginationFilter);
    } else {
      await _morePostList(_paginationFilter);
    }
  }

  @override
  onClose() {
    super.onClose();
    _paginationFilter.close();
    postUIList.close();
    postListFilter.close();
  }

  onLikeChanged(int postIndex, bool isLiked) async {
    if (postUIList[postIndex].authorId == AuthController.to.userId) {
      showCustomSnackbar(text: '내 글에는 좋아요를 누를 수 없어요');
      return;
    }
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
    change([], status: PageStatus.loading());
    await showLoading(() async {
      final Either<Failure, List<PostResponseDTO>> postDataEither =
          await _communityRepository.getPostList(
              paginationFilter: paginationFilter,
              postListFilterUiModel: postListFilter.value,
              boardId: _boardId);

      postDataEither.fold(
          (fail) => FailureInterpreter().mapFailureToSnackbar(
              fail, '_getPostListByPage'), (newPostListDto) {
        if (newPostListDto.isEmpty) {
          postUIList.clear();
          change([],
              status: const PageStatus.empty(
                '아직 작성된 글이 없어요.',
                '첫번째 글을 작성해주시겠어요?',
              ));
        } else {
          postUIList.assignAll(_parsePostListDto(newPostListDto));
          change(postUIList, status: const PageStatus.success());
        }
      });
    });
  }

  Future<void> refreshPage() async {
    loadNewPage();
  }

  List<PostUIModel> _parsePostListDto(List<PostResponseDTO> postListDTO) {
    return postListDTO.map((e) => PostUIModel.fromDTO(e)).toList();
  }

  Future<void> _morePostList(PaginationFilter paginationFilter) async {
    change(postUIList, status: PageStatus.loadingMore());

    final Either<Failure, List<PostResponseDTO>> postDataEither =
        await _communityRepository.getPostList(
            postListFilterUiModel: postListFilter.value,
            paginationFilter: paginationFilter,
            boardId: _boardId);

    postDataEither.fold(
        (fail) => FailureInterpreter().mapFailureToSnackbar(
            fail, '_getPostListByPage'), (morePostListDto) {
      if (morePostListDto.isEmpty) {
        change(postUIList, status: PageStatus.emptyLastPage());
      } else {
        postUIList.addAll(_parsePostListDto(morePostListDto));
        change(postUIList, status: PageStatus.success());
      }
    });
  }

  void changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.listSize = limit;
    });
  }

  onPostTap(int postIndex) async {
    Get.toNamed(Routes.COMMUNITY_POST_DETAIL, arguments: {
      'fromRootPage': false,
      'boardId': _boardId,
      'postId': postUIList[postIndex].postId,
      'postAbstractController': CommunityPostListController.to,
    });
  }

  goToEditProfilePage() {
    Get.toNamed(Routes.USER_EDIT);
  }

  onSearchTap() {
    Get.toNamed(Routes.COMMUNITY_POST_SEARCH, arguments: {'boardId': _boardId});
  }

  onPostMoreTap(int postIndex, MoreBottomSheetOption? moreOption) async {
    if (moreOption != null) {
      switch (moreOption) {
        case MoreBottomSheetOption.edit:
          _onPostEditTap(postIndex);
          break;
        case MoreBottomSheetOption.delete:
          _onDeletePostTap(postIndex);
          break;
        case MoreBottomSheetOption.report:
          _onPostReportTap(postIndex);
          break;
        case MoreBottomSheetOption.block:
          _onBlockPostTap(postIndex);
          break;
        default:
          break;
      }
    }
  }

  _onDeletePostTap(int postIndex) async {
    bool isBlockConfirmed = await showSelectionDialog(
        confirmText: '삭제',
        cancleText: '취소',
        title: '글을 삭제할까요?',
        subtitle: '즉시 삭제됩니다');

    if (isBlockConfirmed) {
      _deletePost(postIndex);
    }
  }

  _deletePost(int postIndex) async {
    Either<Failure, bool> deleteEither = await showLoading(() =>
        _communityRepository.deletePost(
            postId: postUIList[postIndex].postId,
            boardId: postUIList[postIndex].boardId));
    deleteEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, 'getPost');
    }, (success) {
      // postUIList.removeAt(postIndex);
      // change(postUIList, status: PageStatus.success());
      updateDeletedPost(postUIList[postIndex].postId);
    });
  }

  _onPostEditTap(int postIndex) async {
    var editedPost = await Get.toNamed(
      Routes.COMMUNITY_POST_EDIT,
      arguments: {'post': postUIList[postIndex]},
    ) as PostUIModel?;

    if (editedPost != null) {
      updateEditedPost(editedPost);
    }
  }

  _onBlockPostTap(int postIndex) async {
    bool isBlockConfirmed = await showSelectionDialog(
        confirmText: '네',
        cancleText: '아니오',
        title: '이 유저의 글을 차단할까요?',
        subtitle: '이 유저의 모든 글을 숨깁니다.');

    if (isBlockConfirmed) {
      _blockThisUserPost(postUIList[postIndex].authorId);
    }
  }

  _onPostReportTap(int postIndex) async {
    var report = await Get.toNamed(Routes.COMMUNITY_REPORT, arguments: {
      'boardId': postUIList[postIndex].boardId,
      'postId': postUIList[postIndex].postId,
      'authorId': postUIList[postIndex].authorId,
    }) as ReportUIModel?;

    if (report != null) {
      updateReportedPost(postUIList[postIndex].postId);
    }
  }

  _blockThisUserPost(String blockAuthorId) async {
    change(postUIList, status: const PageStatus.loading());
    Either<Failure, bool> blockUserPostEither =
        await _communityRepository.blockUserPost(authorId: blockAuthorId);

    blockUserPostEither.fold((l) {
      FailureInterpreter().mapFailureToDialog(l, 'blockUserPostEither');
      change(postUIList, status: const PageStatus.success());
    }, (r) {
      updateBlockedPost(blockAuthorId);
      change(postUIList, status: const PageStatus.success());
    });
  }

  void onPostTypeChanged(PostType postType) {
    postListFilter.value.postType = postType;
    postListFilter.refresh();
  }

  Future<void> addNewPost() async {
    var newPostResult = await Get.toNamed(Routes.COMMUNITY_NEW_POST,
        arguments: {'boardId': _boardId}) as PostUIModel?;

    if (newPostResult != null) {
      postUIList.insert(0, newPostResult.copyWith());
      change(postUIList, status: PageStatus.success());
    }
  }

  @override
  void updateEditedPost(PostUIModel post) {
    int editedIndex =
        postUIList.indexWhere((element) => element.postId == post.postId);
    if (editedIndex >= 0) {
      postUIList[editedIndex] = post.copyWith();
      postUIList.refresh();
    }
  }

  @override
  void updateCommentNum(String postId, int commentNum) {
    int editedIndex =
        postUIList.indexWhere((element) => element.postId == postId);
    if (editedIndex >= 0) {
      postUIList[editedIndex].commentNum = commentNum;
      postUIList.refresh();
    }
  }

  @override
  void updateBlockedPost(String authorId) {
    postUIList.removeWhere((element) => element.authorId == authorId);
  }

  @override
  void updateDeletedPost(String postId) {
    postUIList.removeWhere((element) => element.postId == postId);
    postUIList.refresh();
  }

  @override
  void updatePostLike(String postId, int likeNum, bool isLikeOn) {
    int editedIndex =
        postUIList.indexWhere((element) => element.postId == postId);
    if (editedIndex >= 0) {
      postUIList[editedIndex].likeNum = likeNum;
      postUIList[editedIndex].isLikeOn = isLikeOn;

      postUIList.refresh();
    }
  }

  @override
  void updateReportedPost(String postId) {
    postUIList.removeWhere((element) => element.postId == postId);
    postUIList.refresh();
  }
}
