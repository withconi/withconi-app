import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:withconi/core/tools/helpers/calculator.dart';
import 'package:withconi/data/model/dto/response_dto/community_response/post_response_dto.dart';
import 'package:withconi/global_widgets/dialog/selection_dialog.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/app_setting_repository.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/community/abstract/post_model_abstract.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';

import '../../../data/enums/enum.dart';
import '../../../core/error_handling/failures.dart';
import '../../../global_widgets/snackbar.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/photo_gallary/image_item.dart';
import '../../../core/tools/helpers/infinite_scroll.dart';

class MyPostPageController extends GetxController with AbstractPostUpdate {
  static MyPostPageController get to => Get.find();
  MyPostPageController(this._communityRepository, this._abstractPostUpdate);
  final CommunityRepository _communityRepository;

  final AbstractPostUpdate? _abstractPostUpdate;

  List<ImageItem> images = [
    ImageItem(
        id: 'tag1',
        imageUrl: 'assets/images/image1.jpeg',
        imageType: ImageType.asset),
    ImageItem(
        id: 'tag2',
        imageUrl: 'assets/images/image2.jpeg',
        imageType: ImageType.asset),
    ImageItem(
        id: 'tag3',
        imageUrl:
            'https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210917_199%2F1631861436249TX26u_JPEG%2F32997264078967613_1334183573.jpg&type=sc960_832',
        imageType: ImageType.network),
  ];
  RxList<PostUIModel> myPostList = <PostUIModel>[].obs;

  Rx<ScrollController> scrollController = ScrollController().obs;

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    listSize: 15,
  ).obs;

  final RxBool _lastPage = false.obs;
  final RxBool isLiked = false.obs;
  final RxBool _isLoading = false.obs;

  int get limit => _paginationFilter.value.listSize;
  int get _page => _paginationFilter.value.page;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);
  void loadNewPage() => _changePaginationFilter(1, limit);

  Color badgeBackgroundColor(int postIndex) {
    switch (myPostList[postIndex].postType) {
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
    switch (myPostList[postIndex].postType) {
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

    await showLoading((() => _getMyPostList()));
    ever(_paginationFilter, (_) => _getMyPostList());

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
  }

  onLikeChanged(int postIndex, bool isLiked) async {
    if (myPostList[postIndex].authorId == AuthController.to.userId) {
      showCustomSnackbar(text: '내 글에는 좋아요를 누를 수 없어요');
      return;
    }
    _updateLikeUiChanges(postIndex, isLiked);

    var likePostsEither = await _communityRepository.updateLikePost(
        postId: myPostList[postIndex].postId, isLiked: isLiked);

    likePostsEither.fold((l) {
      FailureInterpreter().mapFailureToSnackbar(l, 'updateLikePost');
      _updateLikeUiChanges(postIndex, !isLiked);
    }, (success) {});
  }

  void _updateLikeUiChanges(int postIndex, bool isLiked) {
    myPostList[postIndex].isLikeOn = isLiked;
    if (isLiked) {
      myPostList[postIndex].likeNum += 1;
    } else {
      myPostList[postIndex].likeNum -= 1;
    }
    myPostList.refresh();
  }

  onPostTap(int postIndex) {
    Get.toNamed(Routes.COMMUNITY_POST_DETAIL, arguments: {
      'postId': myPostList[postIndex].postId,
      'boardId': myPostList[postIndex].boardId,
      'postAbstractController': MyPostPageController.to,
      'fromRootPage': false,
    });
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

  Future<void> _getMyPostList() async {
    _isLoading.value = true;
    final Either<Failure, List<PostResponseDTO>> postDataEither =
        await _communityRepository.getMyPostList(
      paginationFilter: _paginationFilter.value,
    );

    postDataEither.fold(
        (fail) => FailureInterpreter()
            .mapFailureToSnackbar(fail, '_getPostListByPage'), (postDto) {
      if (_paginationFilter.value.page == 1) {
        myPostList.clear();
      }
      if (postDto.isEmpty) {
        _lastPage.value = true;
      } else {
        myPostList.addAll(parsePostDto(postDto));
      }
      _isLoading.value = false;
    });
  }

  parsePostDto(List<PostResponseDTO> dtoList) {
    return dtoList.map((e) => PostUIModel.fromDTO(e)).toList();
  }

  onPostMoreTap(int postIndex, MoreBottomSheetOption? moreOption) async {
    if (moreOption != null) {
      switch (moreOption) {
        case MoreBottomSheetOption.edit:
          _onEditPostTap(postIndex);
          break;
        case MoreBottomSheetOption.delete:
          _onDeletePostTap(postIndex);
          break;
        default:
          break;
      }
    }
  }

  _onEditPostTap(int postIndex) {
    _goToEditPostPage(postIndex);
  }

  _onDeletePostTap(int postIndex) async {
    bool deletedConfirmed = await showSelectionDialog(
        confirmText: '삭제', cancleText: '취소', title: '글을 삭제할까요?');

    if (deletedConfirmed) {
      await showLoading(() => _deletePost(postIndex));
    }
  }

  _goToEditPostPage(int postIndex) async {
    PostUIModel? editedPost = await Get.toNamed(Routes.COMMUNITY_POST_EDIT,
        arguments: {'post': myPostList[postIndex]}) as PostUIModel?;
    if (editedPost != null) {
      updateEditedPost(editedPost);
    }
  }

  _deletePost(int postIndex) async {
    Either<Failure, bool> deleteEither = await _communityRepository.deletePost(
        postId: myPostList[postIndex].postId,
        boardId: myPostList[postIndex].boardId);
    deleteEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, 'getPost');
    }, (success) {
      updateDeletedPost(myPostList[postIndex].postId);
    });
  }

  Future<void> resetPage({Sorting? sortType, PostType? postType}) async {
    _lastPage.value = false;
    _changePaginationFilter(1, 15);
  }

  void changeTotalPerPage(int limitValue) {
    myPostList.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.listSize = limit;
    });
  }

  @override
  void updateEditedPost(PostUIModel post) {
    int editedIndex =
        myPostList.indexWhere((element) => element.postId == post.postId);
    if (editedIndex >= 0) {
      myPostList[editedIndex] = post.copyWith();
      myPostList.refresh();
    }

    if (_abstractPostUpdate != null) {
      _abstractPostUpdate!.updateEditedPost(post);
    }
  }

  @override
  void updateCommentNum(String postId, int commentNum) {
    int editedIndex =
        myPostList.indexWhere((element) => element.postId == postId);
    if (editedIndex >= 0) {
      myPostList[editedIndex].commentNum = commentNum;
      myPostList.refresh();
    }

    if (_abstractPostUpdate != null) {
      _abstractPostUpdate!.updateCommentNum(postId, commentNum);
    }
  }

  @override
  void updateBlockedPost(String authorId) {
    return;
  }

  @override
  void updateDeletedPost(String postId) {
    myPostList.removeWhere((element) => element.postId == postId);
    myPostList.refresh();
    if (_abstractPostUpdate != null) {
      _abstractPostUpdate!.updateDeletedPost(postId);
    }
  }

  @override
  void updatePostLike(String postId, int likeNum, bool isLikeOn) {
    int editedIndex =
        myPostList.indexWhere((element) => element.postId == postId);
    if (editedIndex >= 0) {
      myPostList[editedIndex].likeNum = likeNum;
      myPostList[editedIndex].isLikeOn = isLikeOn;
      myPostList.refresh();
    }

    if (_abstractPostUpdate != null) {
      _abstractPostUpdate!.updatePostLike(postId, likeNum, isLikeOn);
    }
  }

  @override
  void updateReportedPost(String postId) {
    return;
  }
}
