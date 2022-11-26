import 'package:withconi/data/model/dto/response_dto/place_response/place_preview_response_dto.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/ui_model/place_ui_model/hospital_preview_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/pharmacy_preview_ui_model.dart';

import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../../../import_basic.dart';
import '../../../core/tools/helpers/infinite_scroll.dart';
import '../../ui_model/place_ui_model/abstract_class/place_preview_ui.dart';

class MapMyBookmarkController extends GetxController {
  MapMyBookmarkController(this._mapRepository);
  final MapRepository _mapRepository;
  RxList<PlacePreviewUiModel> bookmarkedPlaceList = <PlacePreviewUiModel>[].obs;
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
    final postDataEither = await _mapRepository.getBookmarkedPlaceList(
        paginationFilter: _paginationFilter.value);

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

  List<PlacePreviewUiModel> _parseBookmarkedPlaceDto(
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

  onBookmarkTap(PlacePreviewUiModel place) async {
    bool succeedUpdate =
        await updateBookmarkedPlace(postId: 'asdf', isBookmarked: true);
    if (succeedUpdate) {
      if (bookmarkedPlaceList.contains(place)) {
        bookmarkedPlaceList.remove(place);
      } else {
        bookmarkedPlaceList.add(place);
      }
      bookmarkedPlaceList.refresh();
    }
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
