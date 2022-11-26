import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:withconi/core/values/constants/auth_variables.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/community_response/comment_response_dto.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/global_widgets/dialog/selection_dialog.dart';
import 'package:withconi/module/ui_model/comment_ui_model.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import 'package:withconi/module/ui_model/report_ui_model.dart';
import '../../../core/error_handling/failures.dart';
import '../../../data/repository/community_repository.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/loading/loading_overlay.dart';
import '../../../core/tools/helpers/infinite_scroll.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../widgets/comment_bottom_sheet.dart';

enum CommunityPageResultKey { blockAuthorId }

class CommunityPostDetailController extends GetxController {
  CommunityPostDetailController(this._communityRepository);
  final CommunityRepository _communityRepository;

  late Rx<PostUIModel> thisPost;
  RxList<CommentUIModel> commentList = <CommentUIModel>[].obs;

  final _paginationFilter = PaginationFilter(page: 1, listSize: 10).obs;
  final _lastPage = false.obs;
  RxBool postLoading = true.obs;
  RxInt currentImageIndex = 0.obs;
  int get limit => _paginationFilter.value.listSize;
  int get page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;

  GlobalKey commentWidgetKey = GlobalKey();
  ScrollController scrollController = ScrollController();

  String get _nickname => AuthController.to.userInfo!.nickname;
  String get _uid => firebaseAuth.currentUser!.uid;

  @override
  onInit() async {
    super.onInit();
    thisPost = Rx<PostUIModel>((Get.arguments as PostUIModel).copyWith());

    await _getCommentList(
        postId: thisPost.value.postId, boardId: thisPost.value.boardId);
    postLoading.value = false;
  }

  _getCommentList({required String postId, required String boardId}) async {
    Either<Failure, List<CommentResponseDTO>> commentEither =
        await _communityRepository.getCommentList(
      postId: postId,
      boardId: boardId,
    );
    commentEither.fold((failure) {}, (commentDto) {
      commentList.addAll(_parseCommentDto(commentDto).reversed);
    });
    commentList.refresh();
  }

  List<CommentUIModel> _parseCommentDto(List<CommentResponseDTO> commentDto) {
    return commentDto.map((e) => CommentUIModel.fromDTO(e)).toList();
  }

  _deletePost() async {
    Either<Failure, bool> deleteEither = await _communityRepository.deletePost(
        postId: thisPost.value.postId!, boardId: thisPost.value.boardId);
    deleteEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, 'getPost');
    }, (success) {
      log('게시물 삭제 완료');
      Get.back();
    });
  }

  _deleteComment(CommentUIModel comment) async {
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
    });
  }

  Future<void> addComment() async {
    String? commentText = await showCommentBottomSheet(_nickname);
    if (commentText != null && commentText.isNotEmpty) {
      await _updateCommentDB(_makeNewCommentModel(commentText));
    }
  }

  CommentUIModel _makeNewCommentModel(String commentText) {
    return CommentUIModel(DateTime.now(),
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
      commentList.add(CommentUIModel.fromDTO(newCommentDto));
    });
    return;
  }

  onPageChanged(int index) {
    currentImageIndex.value = index;
  }

  onLikeChanged(bool isLike) async {
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

  onPostMoreTap(PostUIModel post, MoreOption? moreOption) async {
    if (moreOption != null) {
      switch (moreOption) {
        case MoreOption.edit:
          await Get.toNamed(Routes.COMMUNITY_POST_EDIT, arguments: post);
          break;
        case MoreOption.delete:
          await _deletePost();
          break;
        case MoreOption.report:
          Get.toNamed(Routes.COMMUNITY_REPORT,
              //TODO: report생성할때 authorid는 누구를 의미?
              arguments: ReportUIModel(
                  boardId: post.boardId, postId: post.postId, authorId: _uid));
          break;
        case MoreOption.block:
          _blockUserPosts(postInfo: post);
          break;
        default:
          break;
      }
    }
  }

  onCommentMoreTap(CommentUIModel comment, MoreOption? moreOption) async {
    if (moreOption != null) {
      switch (moreOption) {
        case MoreOption.edit:
          // await Get.toNamed(Routes.COMMUNITY_POST_EDIT, arguments: comment);
          break;
        case MoreOption.delete:
          await _deleteComment(comment);
          break;
        case MoreOption.report:
          Get.toNamed(Routes.COMMUNITY_REPORT,
              arguments: ReportUIModel(
                boardId: comment.boardId,
                postId: comment.postId,
                authorId: _uid,
              ));
          break;
        case MoreOption.block:
          _blockUserComments(commentInfo: comment);
          break;
        default:
          break;
      }
    }
  }

  _blockUserComments({required CommentUIModel commentInfo}) async {
    bool blockConfirmed = await showSelectionDialog(
        confirmText: '네',
        cancleText: '아니오',
        title: '이 유저의 댓글을 차단할까요?',
        subtitle: '이 유저의 모든 댓글을 숨깁니다.');

    if (blockConfirmed) {
      commentList
          .removeWhere((element) => element.authorId == commentInfo.authorId);
      commentList.refresh();
    }
  }

  _blockUserPosts({required PostUIModel postInfo}) async {
    bool blockConfirmed = await showSelectionDialog(
        confirmText: '네',
        cancleText: '아니오',
        title: '이 유저의 글을 차단할까요?',
        subtitle: '이 유저의 모든 글을 숨깁니다.');

    if (blockConfirmed) {
      Get.back(
          result: {CommunityPageResultKey.blockAuthorId: postInfo.authorId});
    }
  }

  animateToCommentSection() {
    Scrollable.ensureVisible(
      commentWidgetKey.currentContext!,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
