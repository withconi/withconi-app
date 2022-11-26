import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/auth/auth_controller.dart';

import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';
import 'package:withconi/module/ui_model/review_detail_ui_model.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/review_ui_class.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import '../../../data/model/dto/response_dto/review_response/review_detail_response_dto.dart';
import '../../../data/model/dto/response_dto/review_response/review_list_response_dto.dart';
import '../../../import_basic.dart';
import '../../../core/tools/helpers/infinite_scroll.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';

class MapMyReviewController extends GetxController {
  MapMyReviewController(this._mapRepository);
  final MapRepository _mapRepository;

  RxList<ReviewDetailUIModel> myReviewList = <ReviewDetailUIModel>[].obs;
  RxInt totalReviewNum = 0.obs;
  Rx<ScrollController> scrollController = ScrollController().obs;

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    listSize: 3,
  ).obs;

  final RxBool _lastPage = false.obs;

  final RxBool _isLoading = false.obs;

  int get limit => _paginationFilter.value.listSize;
  int get _page => _paginationFilter.value.page;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);

  void loadNewPage() {
    myReviewList.clear();
    _lastPage.value = false;
    _changePaginationFilter(_page + 1, limit);
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    await showLoading((() => _getMyReviewList()));
    ever(_paginationFilter, (_) => _getMyReviewList());

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

  Future<void> _getMyReviewList() async {
    _isLoading.value = true;
    final myReviewResponseEither = await _mapRepository.getMyReviewList(
        paginationFilter: _paginationFilter.value);

    myReviewResponseEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, '_getPostList'),
        (reviewResponseDto) {
      if (reviewResponseDto.totalDocuments == 0) {
        _lastPage.value = true;
      } else {
        totalReviewNum.value = reviewResponseDto.totalDocuments;
        myReviewList.assignAll(_parseReviewListDto(reviewResponseDto));
      }
    });

    _isLoading.value = false;
  }

  List<ReviewDetailUIModel> _parseReviewListDto(ReviewListResponseDTO dto) {
    return dto.list.map((e) => ReviewDetailUIModel.fromDTO(e)).toList();
  }

  resetPage() {
    loadNewPage();
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.listSize = limit;
    });
  }

  updateBookmarkedPlace(
      {required String postId, required bool isBookmarked}) async {
    // await _communityRepository.updateLikePost(
    //     uid: AuthController.to.wcUser.value!.uid,
    //     postId: postId,
    //     isLiked: isLiked);

    return true;
  }
}
