import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/core/error_handling/error_message_object.dart';
import 'package:withconi/data/model/abstract_class/place_preview.dart';
import 'package:withconi/module/ui_model/location.dart';
import '../../core/tools/helpers/calculator.dart';
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
  late String _userId;
  Rxn<Failure> failure = Rxn<Failure>();
  final RxString searchKeywords = ''.obs;
  RxList<PlacePreview> placeListSearched = RxList<PlacePreview>();

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    limit: 8,
  ).obs;

  Rx<ScrollController> scrollController = ScrollController().obs;

  final RxBool _lastPage = false.obs;
  final RxBool _isLoading = false.obs;

  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);

  late Worker _debounceWorker;

  @override
  void onInit() {
    super.onInit();
    _userId = AuthController.to.wcUser.value!.uid;
    _debounceWorker = debounce(searchKeywords, _changeSearchKeyword,
        time: const Duration(milliseconds: 500));
    ever(_paginationFilter, _getPlacePreviewList);

    change(null, status: RxStatus.empty());

    scrollController.value.addListener(() {
      var nextPageTrigger =
          scrollController.value.position.maxScrollExtent * 0.8;
      if (!_isLoading.value &&
          !_lastPage.value &&
          scrollController.value.offset >= nextPageTrigger) {
        loadNextPage();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.value.dispose();
    _debounceWorker.dispose();
  }

  void onSearchChanged(String val) {
    searchKeywords.value = val;
    if (val.isEmpty) clearResult();
  }

  void clearResult() {
    placeNameTextController.clear();
    placeListSearched.clear();
    change(null, status: RxStatus.empty());
  }

  _getPlacePreviewList(PaginationFilter paginationFilter) async {
    if (searchKeywords.value.isEmpty) {
      clearResult();
      return;
    } else {
      if (paginationFilter.page == 1) {
        change(null, status: RxStatus.loading());
      }
      _isLoading.value = true;
      var previewListResponse = await _mapRepository.getPlacePreviewList(
        paginationFilter: _paginationFilter.value,
        baseLatLng: LatLngClass(latitude: 37.5206602, longitude: 127.0526429),
        keyword: searchKeywords.value,
        distance: 1000,
      );

      previewListResponse.fold((failure) {
        ErrorMessage errorMessage =
            ErrorMessage.mapFailureToErrorMessage(failure: failure);
        change(null, status: RxStatus.error(errorMessage.message));
      }, (response) {
        if (response.placeList.isEmpty) {
          _lastPage.value = true;
        } else {
          placeListSearched.addAll(response.placeList);
        }
        _isLoading.value = false;
        change(placeListSearched, status: RxStatus.success());
      });
    }
    Get.focusScope!.unfocus();
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  void _changeSearchKeyword(_keyword) {
    placeListSearched.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limit);
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
