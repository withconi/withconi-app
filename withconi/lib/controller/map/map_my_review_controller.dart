import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/controller/auth_controller.dart';

import 'package:withconi/data/model/abstract_class/place_preview.dart';
import 'package:withconi/data/model/hospital_preview.dart';
import 'package:withconi/data/model/pharmacy_preview.dart';
import 'package:withconi/data/model/response_model/response_model.dart';
import 'package:withconi/data/model/review.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/module/ui_model/location.dart';
import 'package:withconi/module/ui_model/review_ui_class.dart';
import 'package:withconi/module/widgets/loading/loading_overlay.dart';
import '../../import_basic.dart';
import '../ui_helper/infinite_scroll.dart';
import '../ui_interpreter/failure_ui_interpreter.dart';

class MapMyReviewController extends GetxController {
  MapRepository _mapRepository = MapRepository();
  RxList<Review> myReviewList = <Review>[].obs;
  late String _uid;
  RxInt totalReviewNum = 0.obs;
  Rx<ScrollController> scrollController = ScrollController().obs;

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    limit: 3,
  ).obs;

  final RxBool _lastPage = false.obs;

  final RxBool _isLoading = false.obs;

  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);

  void loadNewPage() {
    myReviewList.clear();
    _lastPage.value = false;
    _changePaginationFilter(_page + 1, limit);
  }

  @override
  onInit() async {
    super.onInit();
    _uid = AuthController.to.wcUser.value!.uid;
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
        (newResponse) {
      if (newResponse.list.isEmpty) {
        _lastPage.value = true;
      } else {
        totalReviewNum.value = newResponse.totalResults;
        myReviewList.addAll(newResponse.list);
      }
    });

    _isLoading.value = false;
  }

  resetPage() {
    loadNewPage();
  }

  // void changeTotalPerPage(int limitValue) {
  //   myReviewList.clear();
  //   _lastPage.value = false;
  //   _changePaginationFilter(1, limitValue);
  // }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
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
