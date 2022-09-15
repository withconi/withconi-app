import 'package:withconi/core/error_handling/error_message_object.dart';
import 'package:withconi/data/model/abstract_class/place_type.dart';
import 'package:withconi/ui/entities/location.dart';
import '../../configs/helpers/calculator.dart';
import '../../core/error_handling/failures.dart';
import '../../data/repository/map_repository.dart';
import '../../import_basic.dart';
import '../ui_helper/infinite_scroll.dart';

class MapSearchController extends GetxController
    with StateMixin<List<PlacePreview>> {
  final MapRepository _mapRepository = MapRepository();
  TextEditingController placeNameTextController = TextEditingController();
  RxBool listLoaded = false.obs;
  // String get disease => _disease.value;
  Rxn<Failure> failure = Rxn<Failure>();
  RxString _searchPlaceName = ''.obs;
  RxList<PlacePreview> placeListSearched = RxList<PlacePreview>();

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    limit: 5,
  ).obs;

  Rx<ScrollController> scrollController = ScrollController().obs;

  final RxBool _lastPage = false.obs;
  final RxBool _isLoading = false.obs;

  int get limit => _paginationFilter.value.limit!;
  int get _page => _paginationFilter.value.page!;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);
  void loadNewPage() => _changePaginationFilter(1, limit);

  @override
  void onInit() {
    super.onInit();
    // _getPlacePreviewList(_searchPlaceName.value);
    change(null, status: RxStatus.empty());
  }

  @override
  void onReady() {
    super.onReady();
    ever(_paginationFilter,
        (_) => _morePlacePreviewList(_searchPlaceName.value));
    debounce(_searchPlaceName, _getPlacePreviewList,
        time: Duration(milliseconds: 200));
    _addScrollListener(
        isLastPage: _lastPage,
        isLoading: _isLoading,
        onEndOfScroll: loadNextPage,
        scrollController: scrollController.value);
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

  void onSearchNameChanged(String val) {
    _searchPlaceName.value = val;
    if (val.isEmpty) clearResult();
  }

  void clearResult() {
    placeNameTextController.clear();
    placeListSearched.clear();
    change(null, status: RxStatus.empty());
  }

  _getPlacePreviewList(String val) async {
    loadNewPage();
    if (val.isEmpty) {
      clearResult();
      return;
    } else {
      change(null, status: RxStatus.loading());
      _isLoading.value = true;
      var previewListResult = await _mapRepository.getPlacePreviewList(
        paginationFilter: _paginationFilter.value,
        baseLatLng: LatLngClass(latitude: 37.5206602, longitude: 127.0526429),
        keyword: val,
        distance: 1000,
      );

      previewListResult.fold((failure) {
        ErrorMessage errorMessage =
            ErrorMessage.mapFailureToErrorMessage(failure: failure);
        change(null, status: RxStatus.error(errorMessage.message));
      }, (previewList) {
        placeListSearched.assignAll(previewList);
        _isLoading.value = false;
        change(placeListSearched, status: RxStatus.success());
      });
    }
    Get.focusScope!.unfocus();
  }

  _morePlacePreviewList(String val) async {
    // change(null, status: RxStatus.loading());
    var previewListResult = await _mapRepository.getPlacePreviewList(
      paginationFilter: _paginationFilter.value,
      baseLatLng: LatLngClass(latitude: 37.5206602, longitude: 127.0526429),
      keyword: val,
      distance: 1000,
    );

    previewListResult.fold((failure) {
      ErrorMessage errorMessage =
          ErrorMessage.mapFailureToErrorMessage(failure: failure);
      change(null, status: RxStatus.error(errorMessage.message));
    }, (previewList) {
      if (previewList.isEmpty) {
        _lastPage.value = true;
      } else {
        placeListSearched.addAll(previewList);
        change(placeListSearched, status: RxStatus.success());
      }
    });
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  void changeTotalPerPage(int limitValue) {
    placeListSearched.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  String getDistanceToString({required double distanceMeter}) {
    String distanceResult = '';

    distanceResult =
        DistanceCalculator().getDistanceToString(distanceMeter: distanceMeter);
    return distanceResult;
  }

  onPlaceSelected({required PlacePreview selectedPlace}) {
    Get.back(result: selectedPlace);
  }
}
