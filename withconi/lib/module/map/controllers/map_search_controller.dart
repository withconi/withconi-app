import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_preview_response_dto.dart';
import 'package:withconi/core/error_handling/error_message_object.dart';
import 'package:withconi/module/page_status.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';
import 'package:withconi/module/ui_model/map_filter_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/hospital_preview_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/pharmacy_preview_ui_model.dart';
import '../../../core/error_handling/failures.dart';
import '../../../data/repository/map_repository.dart';
import '../../../import_basic.dart';
import '../../../core/tools/helpers/infinite_scroll.dart';
import '../../ui_model/place_ui_model/abstract_class/place_preview_ui.dart';

class MapSearchController extends GetxController implements InfiniteScroll {
  MapSearchController(this._mapRepository);
  final MapRepository _mapRepository;

  TextEditingController placeNameTextController = TextEditingController();
  RxBool listLoaded = false.obs;
  // String get disease => _disease.value;
  Rxn<Failure> failure = Rxn<Failure>();
  // final RxString keywordText = ''.obs;
  RxList<PlacePreviewUiModel> placeListSearched = RxList<PlacePreviewUiModel>();

  @override
  final Rx<PaginationFilter> _paginationFilter =
      PaginationFilter(page: 1, listSize: 20).obs;

  Rx<MapFilterUIModel> mapSearchFilter = MapFilterUIModel(
          placeType: PlaceType.all,
          openingStatus: OpeningStatus.all,
          sortType: SortType.nearest,
          locationType: LocationSearchType.currentLocation,
          searchArea: 2000,
          keyword: '')
      .obs;
  @override
  ScrollController infiniteScrollController = ScrollController();

  @override
  double get nextPageTrigger =>
      0.8 * infiniteScrollController.position.maxScrollExtent;

  int get _page => _paginationFilter.value.page;
  int get _listSize => _paginationFilter.value.listSize;

  @override
  void loadNextPage() => changePaginationFilter(_page + 1, _listSize);
  @override
  void loadNewPage() => changePaginationFilter(1, _listSize);
  @override
  Rx<PageStatus> pageStatus = PageStatus.init().obs;

  Rx<PlaceType> selectedPlaceType = PlaceType.all.obs;

  late Worker _debounceWorker;

  late LatLngUIModel _baseLocation;

  @override
  Future<void> onInit() async {
    super.onInit();
    _baseLocation = await _getCurrentLocation();
    // _debounceWorker = debounce(searchKeywords, _changeSearchKeyword,
    //     time: const Duration(milliseconds: 500));
    // ever(_paginationFilter, _getPlacePreviewList);

    // change(null, status: RxStatus.empty());

    // infiniteScrollController.value.addListener(() {
    //   var nextPageTrigger =
    //       infiniteScrollController.value.position.maxScrollExtent * 0.8;
    //   if (!_isLoading.value &&
    //       !_lastPage.value &&
    //       infiniteScrollController.value.offset >= nextPageTrigger) {
    //     loadNextPage();
    //   }
    // });
  }

  Future<LatLngUIModel> _getCurrentLocation() async {
    return await Geolocator.getCurrentPosition().then(
        (value) => LatLngUIModel(lat: value.latitude, lng: value.longitude));
  }

  @override
  void onReady() {
    super.onReady();

    _debounceWorker = debounce(mapSearchFilter, (_) => loadNewPage());
    ever(_paginationFilter, getDataByPaginationFilter);
    addInfiniteScrollListener();
  }

  @override
  getDataByPaginationFilter(PaginationFilter _paginationFilter) async {
    if (_paginationFilter.page == 1) {
      await _getPlacePreviewList(_paginationFilter);
    } else if (_paginationFilter.page > 1) {
      await _morePlacePreviewList(_paginationFilter);
    }
  }

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
  void onClose() {
    super.onClose();
    infiniteScrollController.dispose();
    _debounceWorker.dispose();
  }

  void onSearchChanged(String val) {
    if (val.isEmpty) {
      clearResult();
    } else {
      mapSearchFilter.value.keyword = val;
      mapSearchFilter.refresh();
    }
  }

  // void _changeSearchKeyword(_keyword) {
  //   mapSearchFilter.value.keyword = _keyword;
  //   mapSearchFilter.refresh();
  // }

  void clearResult() {
    placeNameTextController.clear();
    placeListSearched.clear();
    pageStatus.value = PageStatus.empty();
  }

  _getPlacePreviewList(paginationFilter) async {
    pageStatus.value = PageStatus.loading();
    Either<Failure, List<PlacePreviewResponseDTO>> previewListResponse =
        await _mapRepository.getPlacePreviewList(
            mapFilterUIModel: mapSearchFilter.value,
            paginationFilter: _paginationFilter.value,
            baseLatLng: _baseLocation);

    previewListResponse.fold((failure) {
      ErrorObject errorObject =
          ErrorObject.mapFailureToErrorMessage(failure: failure);
      pageStatus.value = PageStatus.error(errorObject.message);
    }, (dtoList) {
      if (dtoList.isEmpty) {
        pageStatus.value = PageStatus.empty();
      } else {
        placeListSearched.assignAll(parseDtoToUiModel(dtoList));
        pageStatus.value = PageStatus.success();
      }
    });

    Get.focusScope!.unfocus();
  }

  _morePlacePreviewList(paginationFilter) async {
    pageStatus.value = const PageStatus.loadingMore();
    Either<Failure, List<PlacePreviewResponseDTO>> previewListResponse =
        await _mapRepository.getPlacePreviewList(
            mapFilterUIModel: mapSearchFilter.value,
            paginationFilter: _paginationFilter.value,
            baseLatLng: _baseLocation);

    previewListResponse.fold((failure) {
      ErrorObject errorObject =
          ErrorObject.mapFailureToErrorMessage(failure: failure);
      pageStatus.value = PageStatus.error(errorObject.message);
    }, (dtoList) {
      if (dtoList.isEmpty) {
        pageStatus.value = const PageStatus.empty();
      } else {
        placeListSearched.addAll(parseDtoToUiModel(dtoList));
        pageStatus.value = const PageStatus.success();
      }
    });

    Get.focusScope!.unfocus();
  }

  List<PlacePreviewUiModel> parseDtoToUiModel(
      List<PlacePreviewResponseDTO> dto) {
    return dto
        .map((e) => e.map(
            pharmacy: (value) =>
                PharmacyPreviewUIModel.fromDTO(value, _baseLocation),
            hospital: (value) =>
                HospitalPreviewUIModel.fromDTO(value, _baseLocation)))
        .toList();
  }

  @override
  void changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.listSize = limit;
    });
  }

  onPlaceSelected(int placeIndex) {
    Get.back(result: placeListSearched[placeIndex]);
  }
}
