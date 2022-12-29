import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_preview_response_dto.dart';
import 'package:withconi/core/error_handling/error_message_object.dart';
import 'package:withconi/global_widgets/snackbar.dart';
import 'package:withconi/module/community/controllers/custom_state_mixin.dart';
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

enum ButtonStatus { init, success }

class MapSearchController extends GetxController with WcStateMixin {
  MapSearchController(this._mapRepository, this.baseLat, this.baseLng);
  final MapRepository _mapRepository;

  TextEditingController placeNameTextController = TextEditingController();
  RxBool listLoaded = false.obs;
  // String get disease => _disease.value;
  Completer<NaverMapController> mapController = Completer();
  Rxn<Failure> failure = Rxn<Failure>();
  late LatLngUIModel _currentLocation;

  late final double baseLat;
  late final double baseLng;

  RxList<PlacePreviewUIModel> placeListSearched = RxList<PlacePreviewUIModel>();
  // RxBool isLocationChanged = false.obs;
  static const double _maxSearchDistance = 2000;

  final Rx<PaginationFilter> _paginationFilter =
      PaginationFilter(page: 1, listSize: 15).obs;

  Rx<MapFilterUIModel> mapSearchFilter = MapFilterUIModel(
    placeType: PlaceType.all,
    openingStatus: OpeningStatus.all,
    sortType: Sorting.nearest,
    distanceBaseType: DistanceBaseType.currentLocation,
    searchArea: 2000,
    diseaseType: null,
    speciesType: null,
  ).obs;

  final RxString _searchKeyword = ''.obs;
  String get searchKeyword => _searchKeyword.value;

  int get _page => _paginationFilter.value.page;
  int get _listSize => _paginationFilter.value.listSize;

  void loadNextPage() => changePaginationFilter(_page + 1, _listSize);

  void loadNewPage() => changePaginationFilter(1, _listSize);

  Rx<PlaceType> selectedPlaceType = PlaceType.all.obs;
  static const int _maxSearchListSize = 300;
  late Worker _debounceWorker;

  late LatLngUIModel _baseLocation;

  LatLngUIModel get baseLocation => _baseLocation;

  Rx<PageStatus> buttonStatus = PageStatus.init().obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    change(null, status: const PageStatus.init());
    _onBaseLocationChanged(baseLat, baseLng);
    await _setSearchArea();
    _currentLocation = await _getCurrentLocation();
  }

  _onBaseLocationChanged(double lat, double lng) {
    _baseLocation = LatLngUIModel(lat: lat, lng: lng);
  }

  onCurrentLocationButtonTap() async {
    await _moveCameraToLocation(_currentLocation);
  }

  _moveCameraToLocation(LatLngUIModel? location) async {
    if (location != null) {
      final _mapController = await mapController.future;
      await _mapController.moveCamera(
        CameraUpdate.scrollWithOptions(
          location,
          zoom: 13,
        ),
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
    change([], status: PageStatus.init());
    _debounceWorker = debounce(_searchKeyword, (keyword) => loadNewPage(),
        time: Duration(milliseconds: 500));

    ever(_paginationFilter, getDataByPaginationFilter);
  }

  getDataByPaginationFilter(PaginationFilter _paginationFilter) async {
    if (_paginationFilter.page == 1 && searchKeyword.isNotEmpty) {
      await _getPlacePreviewList(_paginationFilter);
    } else if (_paginationFilter.page > 1 && searchKeyword.isNotEmpty) {
      await _morePlacePreviewList(_paginationFilter);
    }
  }

  @override
  void onClose() {
    super.onClose();
    _debounceWorker.dispose();
  }

  Future<void> _setSearchArea() async {
    final _mapController = await mapController.future;
    double totalMeterPerPx =
        (WcHeight - 200) * await _mapController.getMeterPerPx();

    // int detanceKilometer = (totalMeterPerPx / 1000).round();
    double detanceKilometer = (totalMeterPerPx / 1000);
    if (detanceKilometer >= _maxSearchDistance) {
      mapSearchFilter.value.searchArea = _maxSearchDistance;
    } else {
      mapSearchFilter.value.searchArea = detanceKilometer;
    }
    mapSearchFilter.refresh();
  }

  Future<void> onSearchChanged(String val) async {
    // if (!isLocationChanged.value) {
    //   clearResult();
    //   return;
    // }
    if (val.isEmpty) {
      clearResult();
    }
    _searchKeyword.value = val;
  }

  // bool showSnackbar = true;

  // onSearchBarTap() async {
  //   if (!isLocationChanged.value) {
  //     if (!showSnackbar) {
  //       return;
  //     } else {
  //       await showCustomSnackbar(
  //           text: '검색할 위치를 먼저 설정해주세요', snackPosition: SnackPosition.TOP);
  //     }
  //   } else {
  //     showSnackbar = true;
  //   }
  // }

  goToSetLocationPage() async {
    LatLngUIModel? searchBaseLocation = await Get.toNamed(
        Routes.MAP_SET_SERCH_LOCATION,
        arguments: _baseLocation) as LatLngUIModel?;

    if (searchBaseLocation != null) {
      _onBaseLocationChanged(searchBaseLocation.lat, searchBaseLocation.lng);
    }
  }

  void clearResult() {
    placeNameTextController.clear();
    placeListSearched.clear();
  }

  _getPlacePreviewList(paginationFilter) async {
    change(null, status: const PageStatus.loading());
    Either<Failure, List<PlacePreviewResponseDTO>> previewListResponse =
        await _mapRepository.getPlacePreviewList(
            keyword: searchKeyword,
            mapFilterUIModel: mapSearchFilter.value,
            paginationFilter: _paginationFilter.value,
            baseLatLng: _baseLocation);

    previewListResponse.fold((failure) {
      ErrorObject errorObject =
          ErrorObject.mapFailureToErrorMessage(failure: failure);
      change(null, status: PageStatus.error(errorObject.message));
    }, (dtoList) {
      if (dtoList.isEmpty) {
        change(null, status: const PageStatus.empty());
        buttonStatus.value = PageStatus.success();
      } else {
        placeListSearched.assignAll(parseDtoToUiModel(dtoList));
        change(placeListSearched, status: const PageStatus.success());
        buttonStatus.value = PageStatus.success();
      }
    });
  }

  onCameraChange(
      LatLng? latLng, CameraChangeReason changeReason, bool? isChanged) async {
    if (changeReason == CameraChangeReason.gesture) {
      if (latLng != null) {
        _onBaseLocationChanged(latLng.latitude, latLng.longitude);
        await _setSearchArea();
        update();
      }
    }
  }

  _morePlacePreviewList(paginationFilter) async {
    if (placeListSearched.length >= _maxSearchListSize) {
      change(placeListSearched, status: PageStatus.emptyLastPage());
      return;
    }
    change(placeListSearched, status: PageStatus.loadingMore());
    Either<Failure, List<PlacePreviewResponseDTO>> previewListResponse =
        await _mapRepository.getPlacePreviewList(
            keyword: searchKeyword,
            mapFilterUIModel: mapSearchFilter.value,
            paginationFilter: _paginationFilter.value,
            baseLatLng: _baseLocation);

    previewListResponse.fold((failure) {
      ErrorObject errorObject =
          ErrorObject.mapFailureToErrorMessage(failure: failure);
      change(null, status: PageStatus.error(errorObject.message));
    }, (dtoList) {
      if (dtoList.isEmpty) {
        // mapSearchFilter.value.searchArea += 1;

        change(placeListSearched, status: const PageStatus.emptyLastPage());
      } else {
        placeListSearched.addAll(parseDtoToUiModel(dtoList));
        change(placeListSearched, status: const PageStatus.success());
        buttonStatus.value = PageStatus.success();
      }
    });

    Get.focusScope!.unfocus();
  }

  List<PlacePreviewUIModel> parseDtoToUiModel(
      List<PlacePreviewResponseDTO> dto) {
    return dto
        .map((e) => e.map(
            pharmacy: (value) =>
                PharmacyPreviewUIModel.fromDTO(value, _baseLocation),
            hospital: (value) =>
                HospitalPreviewUIModel.fromDTO(value, _baseLocation)))
        .toList();
  }

  void changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.listSize = limit;
    });
  }

  onPlaceSelected(int placeIndex) {
    Get.back(result: placeListSearched[placeIndex]);
  }

  Future<void> onMapCreated(NaverMapController controller) async {
    // mapController = controller;
    if (mapController.isCompleted) mapController = Completer();
    mapController.complete(controller);
    await _moveCameraToLocation(_baseLocation);
  }

  Future<LatLngUIModel> _getCurrentLocation() async {
    return await Geolocator.getCurrentPosition().then(
        (value) => LatLngUIModel(lat: value.latitude, lng: value.longitude));
  }

  onTapSearchPinButton() {
    if (status == const PageStatus.init()) {
      buttonStatus.value = const PageStatus.success();
    } else {
      change(placeListSearched, status: const PageStatus.init());
      buttonStatus.value = const PageStatus.init();
    }
  }
}
