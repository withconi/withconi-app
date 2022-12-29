import 'package:withconi/data/model/dto/response_dto/place_response/place_preview_response_dto.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/module/map/abstract/map_review_update_abstract.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/ui_model/place_ui_model/hospital_preview_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/pharmacy_preview_ui_model.dart';
import 'package:withconi/module/ui_model/review_detail_ui_model.dart';

import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../../../import_basic.dart';
import '../../../core/tools/helpers/infinite_scroll.dart';
import '../../ui_model/place_ui_model/abstract_class/place_preview_ui.dart';

class MapMyBookmarkController extends GetxController
    implements AbstractMapReviewUpdate {
  MapMyBookmarkController(this._mapRepository);
  static MapMyBookmarkController get to => Get.find();
  final MapRepository _mapRepository;
  RxList<PlacePreviewUIModel> bookmarkedPlaceList = <PlacePreviewUIModel>[].obs;
  Rx<ScrollController> scrollController = ScrollController().obs;

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    listSize: 15,
  ).obs;

  final RxBool _lastPage = false.obs;

  final RxBool _isLoading = false.obs;

  int get limit => _paginationFilter.value.listSize;
  int get _page => _paginationFilter.value.page;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);
  void loadNewPage() => _changePaginationFilter(1, limit);

  @override
  Future<void> onReady() async {
    super.onReady();

    await showLoading((() => _getBookmarkedPlaceList()));
    ever(_paginationFilter, (_) => _getBookmarkedPlaceList());

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

  Future<void> _getBookmarkedPlaceList() async {
    final postDataEither = await _mapRepository.getBookmarkedPlaceList();

    postDataEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, '_getPostList'),
        (bookmarkedListDto) {
      if (bookmarkedListDto.isEmpty) {
        return;
      } else {
        bookmarkedPlaceList
            .assignAll(_parseBookmarkedPlaceDto(bookmarkedListDto));
      }
    });
  }

  List<PlacePreviewUIModel> _parseBookmarkedPlaceDto(
      List<PlacePreviewResponseDTO> dto) {
    return dto
        .map((e) => e.map(
            pharmacy: (value) => PharmacyPreviewUIModel.fromDTO(
                value, LatLngUIModel(lat: 0, lng: 0)),
            hospital: (value) => HospitalPreviewUIModel.fromDTO(
                value, LatLngUIModel(lat: 0, lng: 0))))
        .toList();
  }

  Future<void> resetPage() async {
    _getBookmarkedPlaceList();
  }

  void changeTotalPerPage(int limitValue) {
    bookmarkedPlaceList.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.listSize = limit;
    });
  }

  onBookmarkTap(int index, bool isBookmarked) async {
    await showLoading(() async {
      bool succeedUpdate = await updateBookmarkedPlace(
          placeId: bookmarkedPlaceList[index].placeId,
          isBookmarked: isBookmarked);

      if (succeedUpdate) {
        bookmarkedPlaceList[index].isBookmarked = isBookmarked;
        bookmarkedPlaceList.refresh();
      }
    });
  }

  Future<bool> updateBookmarkedPlace(
      {required String placeId, required bool isBookmarked}) async {
    var likePostsEither = await _mapRepository.updateBookmark(
        placeId: placeId, isBookmarked: isBookmarked);

    bool succeed = likePostsEither.fold((l) {
      FailureInterpreter().mapFailureToSnackbar(l, 'updateLikePost');
      return false;
    }, (r) {
      return true;
    });

    return succeed;
  }

  onPlaceTap(int index) {
    Get.toNamed(Routes.MAP_DETAIL, arguments: {
      'placeId': bookmarkedPlaceList[index].placeId,
      'placeType': bookmarkedPlaceList[index].placeType,
      'lat': bookmarkedPlaceList[index].placeLocation.lat,
      'lng': bookmarkedPlaceList[index].placeLocation.lng,
      'mapReviewAbstract': MapMyBookmarkController.to,
    });
  }

  @override
  void addReview(ReviewDetailUIModel newReview) {
    return;
  }

  @override
  void deleteReview(String reviewId, String placeId) {
    return;
  }

  @override
  void updateBookmark(String placeId, bool isBookmarked) {
    int index =
        bookmarkedPlaceList.indexWhere((element) => element.placeId == placeId);

    if (index >= 0) {
      bookmarkedPlaceList[index].isBookmarked = isBookmarked;
      bookmarkedPlaceList.refresh();
    }
  }
}
