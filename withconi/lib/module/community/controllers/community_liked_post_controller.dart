import 'package:dartz/dartz.dart';
import 'package:withconi/core/tools/helpers/calculator.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/community/abstract/post_model_abstract.dart';
import 'package:withconi/module/ui_model/comment_ui_model.dart';

import '../../../core/error_handling/failures.dart';
import '../../../data/enums/enum.dart';
import '../../../global_widgets/dialog/selection_dialog.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/photo_gallary/image_item.dart';

import '../../ui_model/post_ui_model.dart';
import '../../ui_model/report_ui_model.dart';

class LikedPostController extends GetxController implements AbstractPostUpdate {
  static LikedPostController get to => Get.find();
  LikedPostController(this._communityRepository, this._abstractPostUpdate);
  final CommunityRepository _communityRepository;
  final AbstractPostUpdate? _abstractPostUpdate;

  RxList<PostUIModel> likedPostList = <PostUIModel>[].obs;
  late String _uid;

  String uploadAtStr(DateTime createdAt) =>
      TimeCalculator().calculateUploadAt(createdAt);

  Color badgeBackgroundColor(int postIndex) {
    switch (likedPostList[postIndex].postType) {
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
    switch (likedPostList[postIndex].postType) {
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
  Future<void> onReady() async {
    super.onReady();

    await showLoading((() => _getLikedPosts()));
  }

  // _addScrollListener(
  //     {required ScrollController scrollController,
  //     required void Function() onEndOfScroll,
  //     required RxBool isLastPage,
  //     required RxBool isLoading}) {
  //   scrollController.addListener(() {
  //     if (!isLoading.value &&
  //         !isLastPage.value &&
  //         scrollController.offset >=
  //             scrollController.position.maxScrollExtent) {
  //       onEndOfScroll();
  //     }
  //   });
  // }

  Future<void> _getLikedPosts() async {
    final postDataEither = await _communityRepository.getLikedPostList();

    postDataEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, '_getPostList'),
        (newPostList) {
      likedPostList.clear();

      if (newPostList.isEmpty) {
      } else {
        likedPostList.addAll(newPostList.map(
          (postDTO) {
            return PostUIModel.fromDTO(postDTO);
          },
        ).toList());
      }
    });
  }

  Future<void> resetPage() async {
    _getLikedPosts();
  }

  // void changeTotalPerPage(int limitValue) {
  //   likedPostList.clear();
  //   _lastPage.value = false;
  //   _changePaginationFilter(1, limitValue);
  // }

  // void _changePaginationFilter(int page, int limit) {
  //   _paginationFilter.update((val) {
  //     val!.page = page;
  //     val.limit = limit;
  //   });
  // }

  onPostTap(int postIndex) {
    Get.toNamed(Routes.COMMUNITY_POST_DETAIL, arguments: {
      'boardId': likedPostList[postIndex].boardId,
      'postId': likedPostList[postIndex].postId,
      'postAbstractController': LikedPostController.to
    });
  }

  onPostMoreTap(int postIndex, MoreBottomSheetOption? moreOption) {
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

  _onBlockPostTap(int postIndex) async {
    bool isBlockConfirmed = await showSelectionDialog(
        confirmText: '네',
        cancleText: '아니오',
        title: '이 유저의 글을 차단할까요?',
        subtitle: '이 유저의 모든 글을 숨깁니다.');

    if (isBlockConfirmed) {
      _blockThisUserPost(likedPostList[postIndex].authorId);
    }
  }

  _blockThisUserPost(String blockAuthorId) async {
    Either<Failure, bool> blockUserPostEither =
        await _communityRepository.blockUserPost(authorId: blockAuthorId);

    blockUserPostEither.fold((l) {
      FailureInterpreter().mapFailureToDialog(l, 'blockUserPostEither');
    }, (r) {
      updateBlockedPost(blockAuthorId);
    });
  }

  _onPostReportTap(int postIndex) async {
    var report = await Get.toNamed(Routes.COMMUNITY_REPORT, arguments: {
      'boardId': likedPostList[postIndex].boardId,
      'postId': likedPostList[postIndex].postId,
      'authorId': likedPostList[postIndex].authorId,
    }) as ReportUIModel?;

    if (report != null) {
      updateReportedPost(likedPostList[postIndex].postId);
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
            postId: likedPostList[postIndex].postId,
            boardId: likedPostList[postIndex].boardId));
    deleteEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, 'getPost');
    }, (success) {
      updateDeletedPost(likedPostList[postIndex].postId);
    });
  }

  _onPostEditTap(int postIndex) async {
    var editedPost = await Get.toNamed(
      Routes.COMMUNITY_POST_EDIT,
      arguments: {'post': likedPostList[postIndex]},
    ) as PostUIModel?;

    if (editedPost != null) {
      updateEditedPost(editedPost);
    }
  }

  onLikeChanged(int postIndex, bool isLiked) async {
    _updateLikeUiChanges(postIndex, isLiked);

    var likePostsEither = await _communityRepository.updateLikePost(
        postId: likedPostList[postIndex].postId, isLiked: isLiked);

    likePostsEither.fold((l) {
      FailureInterpreter().mapFailureToSnackbar(l, 'updateLikePost');
      _updateLikeUiChanges(postIndex, !isLiked);
    }, (success) {});
  }

  void _updateLikeUiChanges(int postIndex, bool isLiked) {
    likedPostList[postIndex].isLikeOn = isLiked;
    if (isLiked) {
      likedPostList[postIndex].likeNum += 1;
    } else {
      likedPostList[postIndex].likeNum -= 1;
    }
    likedPostList.refresh();
    updatePostLike(likedPostList[postIndex].postId,
        likedPostList[postIndex].likeNum, likedPostList[postIndex].isLikeOn);
  }

  @override
  void updateEditedPost(PostUIModel post) {
    int editedIndex =
        likedPostList.indexWhere((element) => element.postId == post.postId);
    if (editedIndex >= 0) {
      likedPostList[editedIndex] = post.copyWith();
      likedPostList.refresh();
    }

    if (_abstractPostUpdate != null) {
      _abstractPostUpdate!.updateEditedPost(post);
    }
  }

  @override
  void updateCommentNum(String postId, int commentNum) {
    int editedIndex =
        likedPostList.indexWhere((element) => element.postId == postId);
    if (editedIndex >= 0) {
      likedPostList[editedIndex].commentNum = commentNum;
      likedPostList.refresh();
    }

    if (_abstractPostUpdate != null) {
      _abstractPostUpdate!.updateCommentNum(postId, commentNum);
    }
  }

  @override
  void updateBlockedPost(String authorId) {
    likedPostList.removeWhere((element) => element.authorId == authorId);
    if (_abstractPostUpdate != null) {
      _abstractPostUpdate!.updateBlockedPost(authorId);
    }
  }

  @override
  void updateDeletedPost(String postId) {
    likedPostList.removeWhere((element) => element.postId == postId);
    likedPostList.refresh();
    if (_abstractPostUpdate != null) {
      _abstractPostUpdate!.updateDeletedPost(postId);
    }
  }

  @override
  void updatePostLike(String postId, int likeNum, bool isLikeOn) {
    int editedIndex =
        likedPostList.indexWhere((element) => element.postId == postId);
    if (editedIndex >= 0) {
      likedPostList[editedIndex].likeNum = likeNum;
      likedPostList[editedIndex].isLikeOn = isLikeOn;
      likedPostList.refresh();
    }
    if (_abstractPostUpdate != null) {
      _abstractPostUpdate!.updatePostLike(postId, likeNum, isLikeOn);
    }
  }

  @override
  void updateReportedPost(String postId) {
    likedPostList.removeWhere((element) => element.postId == postId);
    likedPostList.refresh();
    if (_abstractPostUpdate != null) {
      _abstractPostUpdate!.updateReportedPost(postId);
    }
  }
}
