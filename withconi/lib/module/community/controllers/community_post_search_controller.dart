import 'package:dartz/dartz.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/core/error_handling/error_message_object.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/module/ui_model/post_list_filter_ui_model.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../../../data/enums/enum.dart';
import '../../../core/error_handling/failures.dart';
import '../../../data/model/dto/response_dto/community_response/post_response_dto.dart';
import '../../../global_widgets/loading/loading_overlay.dart';
import '../../../import_basic.dart';
import '../../../core/tools/helpers/infinite_scroll.dart';
import '../../page_status.dart';
import '../../ui_model/post_ui_model.dart';
import 'custom_state_mixin.dart';

class CommunityPostSearchController extends GetxController with WcStateMixin {
  CommunityPostSearchController(this._communityRepository, this._boardId);
  final CommunityRepository _communityRepository;

  TextEditingController searchKeywordTextController = TextEditingController();
  RxBool listLoaded = false.obs;
  Rxn<Failure> failure = Rxn<Failure>();
  final RxString _keywordText = ''.obs;
  Rx<PostListFilterUIModel> postSearchFilter = Rx<PostListFilterUIModel>(
      PostListFilterUIModel(postType: PostType.all, keyword: ''));
  RxList<PostUIModel> postListSearched = RxList<PostUIModel>();
  // Rx<PostType> selectedPostType = PostType.all.obs;
  late String _boardId;
  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    listSize: 8,
  ).obs;

  late Worker _debounceWorker;

  int get _page => _paginationFilter.value.page;
  int get _listSize => _paginationFilter.value.listSize;

  void loadNextPage() => changePaginationFilter(_page + 1, _listSize);

  void loadNewPage() => changePaginationFilter(1, _listSize);

  void changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.listSize = limit;
    });
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
  void onInit() {
    super.onInit();
    change(null, status: const PageStatus.init());
  }

  @override
  void onReady() {
    super.onReady();

    _debounceWorker = debounce(_keywordText, _setSearchFilterKeyword,
        time: const Duration(milliseconds: 200));
    ever(_paginationFilter, getDataByPaginationFilter);
    ever(postSearchFilter, (searchFilter) {
      if ((searchFilter as PostListFilterUIModel).keyword.isNotEmpty) {
        loadNewPage();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();

    _debounceWorker.dispose();
    postListSearched.close();
    postSearchFilter.close();
  }

  void onKeywordChanged(String val) {
    _keywordText.value = val;
    if (val.isEmpty) clearResult();
  }

  void clearResult() {
    searchKeywordTextController.clear();
    postListSearched.clear();
  }

  Future<void> _getPostList(PaginationFilter paginationFilter) async {
    change(null, status: const PageStatus.loading());
    final Either<Failure, List<PostResponseDTO>> postDataEither =
        await _communityRepository.getPostList(
            paginationFilter: paginationFilter,
            postListFilterUiModel: postSearchFilter.value,
            boardId: _boardId);

    postDataEither.fold((fail) {
      ErrorObject errorObject =
          ErrorObject.mapFailureToErrorMessage(failure: fail);
      change(null, status: PageStatus.error(errorObject.message));
    }, (newPostListDto) {
      if (newPostListDto.isEmpty) {
        change([], status: const PageStatus.empty());
        return;
      } else {
        postListSearched.assignAll(_parsePostListDto(newPostListDto));
        change(postListSearched, status: const PageStatus.success());
      }

      // changeLoadingState(LoadingStatus.dataReady);
      return;
    });
  }

  List<PostUIModel> _parsePostListDto(List<PostResponseDTO> postListDTO) {
    return postListDTO.map((e) => PostUIModel.fromDTO(e)).toList();
  }

  Future<void> _morePostList(PaginationFilter paginationFilter) async {
    change(postListSearched, status: const PageStatus.loadingMore());

    final Either<Failure, List<PostResponseDTO>> postDataEither =
        await _communityRepository.getPostList(
            postListFilterUiModel: postSearchFilter.value,
            paginationFilter: paginationFilter,
            boardId: _boardId);

    postDataEither.fold((failure) {
      ErrorObject errorMessage =
          ErrorObject.mapFailureToErrorMessage(failure: failure);
      change(null, status: PageStatus.error(errorMessage.message));
    }, (morePostListDto) {
      if (morePostListDto.isEmpty) {
        change(postListSearched, status: const PageStatus.emptyLastPage());
      } else {
        postListSearched.addAll(_parsePostListDto(morePostListDto));
        change(postListSearched, status: const PageStatus.success());
      }
    });
  }

  onPostTap(int index) {
    Get.toNamed(Routes.COMMUNITY_POST_DETAIL, arguments: {
      'postId': postListSearched[index].postId,
      'boardId': postListSearched[index].boardId
    });
  }

  // Future<void> resetPage(PostType postType) async {
  //   selectedPostType.value = postType;
  //   _lastPage.value = false;
  //   postListSearched.clear();
  //   changePaginationFilter(1, 15);
  // }

  void onPostTypeChanged(PostType postType) {
    postSearchFilter.value.postType = postType;
    postSearchFilter.refresh();
  }

  void _setSearchFilterKeyword(_keyword) {
    postSearchFilter.value.keyword = _keyword;
    postSearchFilter.refresh();
  }

  // @override
  // void changeLoadingState(LoadingStatus loadingStatus) {
  //   super.changeLoadingState(loadingStatus);
  // }
}
