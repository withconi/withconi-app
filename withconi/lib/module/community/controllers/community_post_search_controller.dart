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

class CommunityPostSearchController extends GetxController
    implements InfiniteScroll {
  CommunityPostSearchController(this._communityRepository);
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

  @override
  Rx<PageStatus> pageStatus = Rx<PageStatus>(const PageStatus.init());

  int get _page => _paginationFilter.value.page;
  int get _listSize => _paginationFilter.value.listSize;

  @override
  void loadNextPage() => changePaginationFilter(_page + 1, _listSize);

  @override
  void loadNewPage() => changePaginationFilter(1, _listSize);

  @override
  void changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.listSize = limit;
    });
  }

  @override
  ScrollController infiniteScrollController = ScrollController();

  @override
  double get nextPageTrigger =>
      0.8 * infiniteScrollController.position.maxScrollExtent;

  @override
  void addInfiniteScrollListener() {
    infiniteScrollController.addListener(() {
      if ((pageStatus.value == const PageStatus.success()) &&
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
  void onInit() {
    super.onInit();
    _boardId = Get.arguments as String;
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
    addInfiniteScrollListener();
  }

  @override
  void onClose() {
    super.onClose();
    infiniteScrollController.dispose();
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
    pageStatus.value = const PageStatus.loading();
    final Either<Failure, List<PostResponseDTO>> postDataEither =
        await _communityRepository.getPostList(
            paginationFilter: paginationFilter,
            postListFilterUiModel: postSearchFilter.value,
            boardId: _boardId);

    postDataEither.fold((fail) {
      ErrorObject errorObject =
          ErrorObject.mapFailureToErrorMessage(failure: fail);
      pageStatus.value = PageStatus.error(errorObject.message);
    }, (newPostListDto) {
      if (newPostListDto.isEmpty) {
        pageStatus.value = const PageStatus.empty();
        return;
      } else {
        postListSearched.assignAll(_parsePostListDto(newPostListDto));
        pageStatus.value = const PageStatus.success();
      }

      // changeLoadingState(LoadingStatus.dataReady);
      return;
    });
  }

  List<PostUIModel> _parsePostListDto(List<PostResponseDTO> postListDTO) {
    return postListDTO.map((e) => PostUIModel.fromDTO(e)).toList();
  }

  Future<void> _morePostList(PaginationFilter paginationFilter) async {
    pageStatus.value = const PageStatus.loadingMore();

    final Either<Failure, List<PostResponseDTO>> postDataEither =
        await _communityRepository.getPostList(
            postListFilterUiModel: postSearchFilter.value,
            paginationFilter: paginationFilter,
            boardId: _boardId);

    postDataEither.fold((failure) {
      ErrorObject errorMessage =
          ErrorObject.mapFailureToErrorMessage(failure: failure);
      pageStatus.value = PageStatus.error(errorMessage.message);
    }, (morePostListDto) {
      if (morePostListDto.isEmpty) {
        pageStatus.value = const PageStatus.emptyLastPage();
      } else {
        postListSearched.addAll(_parsePostListDto(morePostListDto));
        pageStatus.value = const PageStatus.success();
      }
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
