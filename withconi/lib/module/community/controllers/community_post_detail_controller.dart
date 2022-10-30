import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/community/communty_widgets/more_tap_bottom_sheet.dart';
import 'package:withconi/data/model/report.dart';
import 'package:withconi/data/model/response_model/response_model.dart';
import 'package:withconi/module/widgets/dialog/selection_dialog.dart';
import 'package:withconi/module/widgets/error_widget/error_widget.dart';
import 'package:withconi/module/widgets/loading/loading_page.dart';
import '../../../core/tools/helpers/calculator.dart';
import '../../../core/error_handling/failures.dart';
import '../../../data/model/comment.dart';
import '../../../data/model/post.dart';
import '../../../data/repository/community_repository.dart';
import '../../../import_basic.dart';
import '../../widgets/error_page/error_page.dart';
import '../../widgets/loading/loading_overlay.dart';
import '../../../controller/ui_helper/infinite_scroll.dart';
import '../../../controller/ui_interpreter/failure_ui_interpreter.dart';
import '../../../controller/community/communty_widgets/comment_bottom_sheet.dart';

enum CommunityPageResultKey { blockAuthorId }

class CommunityPostDetailController extends GetxController {
  final CommunityRepository _communityRepository = CommunityRepository();

  late Rx<Post> thisPost;
  RxList<Comment> commentList = <Comment>[
    Comment(
        authorId: '',
        nickname: "nickname",
        content: "고양이가 밥을 안 먹으려고 할 때 밥을 그냥 안줘버리면 어떻게 되나요?",
        createdAt: DateTime.now(),
        commentId: '123',
        postId: '',
        boardId: '',
        isLike: false)
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
  List<String> likeCommentIdList = <String>[];

  final _paginationFilter = PaginationFilter(page: 1, limit: 10).obs;
  final _lastPage = false.obs;
  RxBool dataLoaded = false.obs;
  RxInt currentImageIndex = 0.obs;
  int get limit => _paginationFilter.value.limit;
  int get page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;
  String uploadAtStr(DateTime createdAt) =>
      TimeCalculator().calculateUploadAt(createdAt);

  GlobalKey commentWidgetKey = GlobalKey();
  ScrollController scrollController = ScrollController();

  @override
  onInit() async {
    super.onInit();
    Post post = Get.arguments as Post;
    await _setPost(postId: post.postId!, boardId: post.boardId);
    await _getCommentList(postId: post.postId!, boardId: post.boardId);
  }

  void onPostSortingChanged(String? sortingType) {
    selectedPostSort.value = sortingType!;
  }

  void onPostTypeChanged(String postType) {
    selectedPostType.value = postType;
  }

  _setPost({required String postId, required String boardId}) async {
    dataLoaded.value = false;
    Either<Failure, Post> postEither = await _communityRepository.getPost(
      postId: postId,
      boardId: boardId,
    );
    postEither.fold((failure) {
      Get.off(ErrorPage(
        failure: failure,
      ));
      dataLoaded.value = false;
    }, (post) {
      thisPost = post.obs;
      dataLoaded.value = true;
    });
  }

  _getCommentList({required String postId, required String boardId}) async {
    Either<Failure, CommentResponse> commentEither =
        await _communityRepository.getCommentList(
      postId: postId,
      boardId: boardId,
    );
    commentEither.fold((failure) {}, (commentResponse) {
      commentList.addAll(commentResponse.list);
    });
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

  Future<void> addComment() async {
    Comment? newComment = await showCommentBottomSheet(Comment(
        isLike: false,
        authorId: AuthController.to.wcUser.value!.uid,
        postId: thisPost.value.postId!,
        boardId: thisPost.value.boardId,
        commentId: DateTime.now().microsecondsSinceEpoch.toString(),
        nickname: AuthController.to.wcUser.value!.nickname,
        content: '',
        createdAt: DateTime.now()));
    if (newComment != null && newComment.content.isNotEmpty) {
      commentList.add(newComment);
      updateCommentDB(newComment);
    }
  }

  updateCommentDB(Comment _newComment) async {
    var newPostResultEither = await showLoading(
        () => _communityRepository.newComment(newComment: _newComment));
    newPostResultEither.fold((fail) {
      FailureInterpreter().mapFailureToSnackbar(fail, 'createComment');
      return;
    }, (addedPost) {
      return;
    });
    return;
  }

  onPageChanged(int index) {
    currentImageIndex.value = index;
  }

  onLikeChanged(String postId, bool isLike) async {
    print('asdfadf');
    if (isLike) {
      thisPost.value =
          thisPost.value.copyWith(likeNum: thisPost.value.likeNum + 1);
    } else {
      thisPost.value =
          thisPost.value.copyWith(likeNum: thisPost.value.likeNum - 1);
    }

    var likePostsEither = await _communityRepository.updateLikePost(
        uid: AuthController.to.wcUser.value!.uid,
        postId: postId,
        isLiked: isLike);

    likePostsEither.fold(
        (l) => FailureInterpreter().mapFailureToSnackbar(l, 'updateLikePost'),
        (r) {});
  }

  updateCommentLike({required String commentId, required bool isLiked}) async {
    if (isLiked) {
      likeCommentIdList.add(commentId);
      commentList.forEach((element) {
        Comment changedComment = element.copyWith(likeNum: element.likeNum + 1);
        if (element.commentId == commentId) {
          commentList.replaceRange(commentList.indexOf(element),
              commentList.indexOf(element) + 1, [changedComment]);
        }
      });
    } else {
      likeCommentIdList.remove(commentId);
      commentList.forEach((element) {
        Comment changedComment = element.copyWith(likeNum: element.likeNum - 1);
        if (element.commentId == commentId) {
          commentList.replaceRange(commentList.indexOf(element),
              commentList.indexOf(element) + 1, [changedComment]);
        }
      });
    }
    commentList.refresh();

    var likeCommentEither = await _communityRepository.updateLikeComment(
        uid: AuthController.to.wcUser.value!.uid,
        postId: thisPost.value.postId!,
        isLiked: isLiked,
        commentId: commentId);

    likeCommentEither.fold(
        (l) =>
            FailureInterpreter().mapFailureToSnackbar(l, 'updateCommentLike'),
        (r) => likeCommentIdList.assignAll(r));
  }

  onPostMoreTap(Post post, MoreOption? moreOption) async {
    if (moreOption != null) {
      switch (moreOption) {
        case MoreOption.edit:
          await Get.toNamed(Routes.COMMUNITY_POST_EDIT, arguments: post);
          break;
        case MoreOption.delete:
          await _deletePost();
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
          blockUserPosts(postInfo: post);
          break;
        default:
          break;
      }
    }
  }

  onCommentMoreTap(Comment comment, MoreOption? moreOption) async {
    if (moreOption != null) {
      switch (moreOption) {
        case MoreOption.edit:
          await Get.toNamed(Routes.COMMUNITY_POST_EDIT, arguments: comment);
          break;
        case MoreOption.delete:
          await _deletePost();
          break;
        case MoreOption.report:
          Get.toNamed(Routes.COMMUNITY_NEW_REPORT,
              arguments: Report(
                  boardId: comment.boardId,
                  postId: comment.postId,
                  userId: AuthController.to.wcUser.value!.uid,
                  reviewDesc: []));
          break;
        case MoreOption.block:
          blockUserComments(commentInfo: comment);
          break;
        default:
          break;
      }
    }
  }

  blockUserComments({required Comment commentInfo}) async {
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

  blockUserPosts({required Post postInfo}) async {
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
