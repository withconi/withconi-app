import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:withconi/core/values/constants/auth_variables.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/get_post_detail_request_dto.dart';
import 'package:withconi/data/model/dto/response_dto/community_response/comment_response_dto.dart';
import 'package:withconi/global_widgets/snackbar.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/global_widgets/dialog/selection_dialog.dart';
import 'package:withconi/module/community/controllers/community_post_list_controller.dart';
import 'package:withconi/module/ui_model/comment_ui_model.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import 'package:withconi/module/ui_model/report_ui_model.dart';
import '../../../core/error_handling/failures.dart';
import '../../../data/model/dto/response_dto/community_response/post_response_dto.dart';
import '../../../data/repository/community_repository.dart';
import '../../../global_widgets/photo_gallary/image_item.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/loading/loading_overlay.dart';
import '../../../core/tools/helpers/infinite_scroll.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../abstract/post_model_abstract.dart';
import '../widgets/comment_bottom_sheet.dart';

class CommunityPostDetailController extends GetxController
    implements AbstractPostUpdate {
  CommunityPostDetailController(this._communityRepository, this.fromRootPage,
      this._boardId, this._postId, this._postAbstractController);
  final CommunityRepository _communityRepository;

  late Rx<PostUIModel> thisPost;
  RxList<CommentUIModel> commentList = <CommentUIModel>[].obs;
  bool fromRootPage = false;

  final _paginationFilter = PaginationFilter(page: 1, listSize: 10).obs;
  final _lastPage = false.obs;
  RxBool postLoading = true.obs;
  RxInt currentImageIndex = 0.obs;
  int get limit => _paginationFilter.value.listSize;
  int get page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;
  final String _postId;
  final String _boardId;

  final AbstractPostUpdate? _postAbstractController;

  GlobalKey commentWidgetKey = GlobalKey();
  ScrollController scrollController = ScrollController();

  String get _nickname => AuthController.to.userInfo.nickname;
  String get _uid => AuthController.to.userInfo.uid;
  ImageItem get userProfileImage => AuthController.to.userInfo.profileImage;

  @override
  onInit() async {
    super.onInit();
    await _initPost();
    postLoading.value = false;
  }

  Future<void> refreshPage() async {
    await _initPost();
  }

  _initPost() async {
    await _getPost(postId: _postId, boardId: _boardId);

    await _getCommentList(
        postId: thisPost.value.postId, boardId: thisPost.value.boardId);
  }

  _getPost({required String postId, required String boardId}) async {
    Either<Failure, PostResponseDTO> postDetailEither =
        await _communityRepository.getPost(boardId: boardId, postId: postId);

    postDetailEither.fold((failure) {}, (postDto) {
      thisPost = Rx<PostUIModel>(PostUIModel.fromDTO(postDto));
    });
  }

  _getCommentList({required String postId, required String boardId}) async {
    Either<Failure, List<CommentResponseDTO>> commentEither =
        await _communityRepository.getCommentList(
      postId: postId,
      boardId: boardId,
    );
    commentEither.fold((failure) {}, (commentDto) {
      commentList.assignAll(_parseCommentDto(commentDto).reversed);
    });
    commentList.refresh();
  }

  List<CommentUIModel> _parseCommentDto(List<CommentResponseDTO> commentDto) {
    return commentDto.map((e) => CommentUIModel.fromDTO(e)).toList();
  }

  _onDeletePostTap() async {
    Either<Failure, bool> deleteEither = await showLoading(() =>
        _communityRepository.deletePost(
            postId: thisPost.value.postId, boardId: thisPost.value.boardId));
    deleteEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, 'getPost');
    }, (success) {
      updateDeletedPost(thisPost.value.postId);
      showCustomSnackbar(text: '글 삭제 완료!');
      Get.back();
    });
  }

  _onDeleteCommentTap(CommentUIModel comment) async {
    Either<Failure, bool> deleteEither =
        await _communityRepository.deleteComment(
            postId: comment.postId,
            boardId: comment.boardId,
            commentId: comment.commentId);
    deleteEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, '_deleteComment');
    }, (success) {
      log('댓글 삭제 완료');
      commentList.remove(comment);
      commentList.refresh();
      updateCommentNum(comment.postId, commentList.length);
    });
  }

  Future<void> addComment() async {
    String? commentText = await showCommentBottomSheet(_nickname);
    if (commentText != null && commentText.isNotEmpty) {
      await _updateCommentDB(_makeNewCommentModel(commentText));
    }
  }

  goToPostListPage() {
    Get.offNamed(Routes.COMMUNITY_POST_LIST, arguments: {
      'boardId': thisPost.value.boardId,
      'boardName': thisPost.value.diseaseType.displayName
    });
  }

  // Future<void> _editComment(String comment) async {
  //   String? commentText = await showCommentBottomSheet(_nickname, comment);
  //   if (commentText != null && commentText.isNotEmpty) {
  //     await _updateCommentDB(_makeNewCommentModel(commentText));
  //   }
  // }

  CommentUIModel _makeNewCommentModel(String commentText) {
    return CommentUIModel(DateTime.now(),
        profileImage: AuthController.to.userInfo.profileImage,
        nickname: _nickname,
        content: commentText,
        likeNum: 0,
        isLikeOn: false,
        authorId: thisPost.value.authorId,
        boardId: thisPost.value.boardId,
        commentId: DateTime.now().microsecondsSinceEpoch.toString(),
        postId: thisPost.value.postId);
  }

  Future<void> _updateCommentDB(CommentUIModel _newComment) async {
    Either<Failure, CommentResponseDTO> newPostResultEither = await showLoading(
        () => _communityRepository.newComment(newComment: _newComment));
    newPostResultEither.fold((fail) {
      FailureInterpreter().mapFailureToSnackbar(fail, 'createComment');
      return;
    }, (newCommentDto) {
      commentList.add(CommentUIModel.fromDTO(newCommentDto.copyWith(
          profileImageUrl: AuthController.to.userInfo.profileImage.imageUrl)));

      updateCommentNum(_newComment.postId, commentList.length);
    });
    return;
  }

  onPageChanged(int index) {
    currentImageIndex.value = index;
  }

  onLikeChanged(bool isLike) async {
    if (thisPost.value.authorId == AuthController.to.userId) {
      showCustomSnackbar(text: '내 글에는 좋아요를 누를 수 없어요');
      return;
    }
    _updatePostLikeUiChanges(isLike);
    var likePostsEither = await _communityRepository.updateLikePost(
        postId: thisPost.value.postId, isLiked: isLike);

    likePostsEither.fold((l) {
      _updatePostLikeUiChanges(!isLike);
    }, (r) {});
  }

  updateCommentLike({required int commentIndex, required bool isLiked}) async {
    _updateCommentLikeUiChanges(commentIndex, isLiked);
    var likeCommentEither = await _communityRepository.updateLikeComment(
        postId: commentList[commentIndex].postId,
        isLiked: isLiked,
        commentId: commentList[commentIndex].commentId);

    likeCommentEither.fold((l) {
      FailureInterpreter().mapFailureToSnackbar(l, 'updateCommentLike');
      _updateCommentLikeUiChanges(commentIndex, !isLiked);
    }, (r) {});
  }

  void _updatePostLikeUiChanges(bool isLiked) {
    thisPost.value.isLikeOn = isLiked;
    if (isLiked) {
      thisPost.value.likeNum += 1;
    } else {
      thisPost.value.likeNum -= 1;
    }
    thisPost.refresh();
    updatePostLike(
        thisPost.value.postId, thisPost.value.likeNum, thisPost.value.isLikeOn);
  }

  void _updateCommentLikeUiChanges(int commentIndex, bool isLiked) {
    commentList[commentIndex].isLikeOn = isLiked;
    if (isLiked) {
      commentList[commentIndex].likeNum += 1;
    } else {
      commentList[commentIndex].likeNum -= 1;
    }
    commentList.refresh();
  }

  onPostMoreTap(PostUIModel post, MoreBottomSheetOption? moreOption) async {
    if (moreOption != null) {
      switch (moreOption) {
        case MoreBottomSheetOption.edit:
          _onPostEditTap(post);
          break;
        case MoreBottomSheetOption.delete:
          await _onDeletePostTap();
          break;
        case MoreBottomSheetOption.report:
          _onReportPostTap(post);
          break;
        case MoreBottomSheetOption.block:
          _onBlockPostTap(postInfo: post);
          break;
        default:
          break;
      }
    }
  }

  _onReportPostTap(PostUIModel post) async {
    var newReport = await Get.toNamed(Routes.COMMUNITY_REPORT, arguments: {
      'boardId': post.boardId,
      'postId': post.postId,
      'authorId': _uid,
    }) as ReportUIModel?;

    if (newReport != null) {
      updateReportedPost(post.postId);
    }
  }

  _onPostEditTap(PostUIModel post) async {
    var editedPost = await Get.toNamed(Routes.COMMUNITY_POST_EDIT,
        arguments: {'post': post});
    if (editedPost != null) {
      updateEditedPost(editedPost);
    }
  }

  onCommentMoreTap(
      CommentUIModel comment, MoreBottomSheetOption? moreOption) async {
    if (moreOption != null) {
      switch (moreOption) {
        case MoreBottomSheetOption.delete:
          await _onDeleteCommentTap(comment);
          break;
        case MoreBottomSheetOption.report:
          _onCommentReportTap(comment);
          break;
        case MoreBottomSheetOption.block:
          _onBlockCommentTap(comment.authorId);
          break;
        default:
          break;
      }
    }
  }

  _onCommentReportTap(CommentUIModel comment) async {
    var report = await Get.toNamed(Routes.COMMUNITY_REPORT, arguments: {
      'boardId': comment.boardId,
      'postId': comment.commentId,
      'authorId': comment.authorId,
    });

    if (report != null) {
      showCustomSnackbar(text: '댓글 신고 완료!');
    }
  }

  _onBlockCommentTap(String authorId) async {
    bool blockConfirmed = await showSelectionDialog(
        confirmText: '네',
        cancleText: '아니오',
        title: '이 유저의 댓글을 차단할까요?',
        subtitle: '이 유저의 모든 댓글을 숨깁니다.');

    if (blockConfirmed) {
      _blockUserComments(authorId: authorId);
    }
  }

  _blockUserComments({required String authorId}) async {
    await showLoading(() async {
      Either<Failure, bool> blockUserPostEither =
          await _communityRepository.blockUserComment(authorId: authorId);

      blockUserPostEither.fold(
          (failure) => FailureInterpreter()
              .mapFailureToDialog(failure, 'blockUserPostEither'), (r) {
        commentList.removeWhere((element) => element.authorId == authorId);
        commentList.refresh();
        return;
      });
    });
  }

  _onBlockPostTap({required PostUIModel postInfo}) async {
    bool blockConfirmed = await showSelectionDialog(
        confirmText: '네',
        cancleText: '아니오',
        title: '이 유저의 글을 차단할까요?',
        subtitle: '이 유저의 모든 글을 숨깁니다.');

    if (blockConfirmed) {
      await _blockThisUserPost(postInfo.authorId);
    }
  }

  _blockThisUserPost(String blockAuthorId) async {
    Either<Failure, bool> blockUserPostEither =
        await _communityRepository.blockUserPost(authorId: blockAuthorId);

    blockUserPostEither.fold((l) {
      FailureInterpreter().mapFailureToSnackbar(l, '_blockThisUserPost');
    }, (r) {
      updateBlockedPost(blockAuthorId);
      Get.back();
    });
  }

  animateToCommentSection() {
    Scrollable.ensureVisible(
      commentWidgetKey.currentContext!,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  void updateEditedPost(PostUIModel newPost) {
    thisPost.value = newPost.copyWith();
    if (_postAbstractController != null) {
      _postAbstractController!.updateEditedPost(newPost);
    }
  }

  @override
  void updatePostLike(String postId, int likeNum, bool isLikeOn) {
    if (_postAbstractController != null) {
      _postAbstractController!.updatePostLike(postId, likeNum, isLikeOn);
    }
  }

  @override
  void updateCommentNum(String postId, int commentNum) {
    if (_postAbstractController != null) {
      _postAbstractController!.updateCommentNum(postId, commentNum);
    }
  }

  @override
  void updateBlockedPost(String postId) {
    if (_postAbstractController != null) {
      _postAbstractController!.updateBlockedPost(postId);
    }
  }

  @override
  void updateDeletedPost(String postId) {
    if (_postAbstractController != null) {
      _postAbstractController!.updateDeletedPost(postId);
    }
  }

  @override
  void updateReportedPost(String postId) {
    if (_postAbstractController != null) {
      _postAbstractController!.updateReportedPost(postId);
    }
  }
}
