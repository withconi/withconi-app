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

class MapSearchController extends GetxController with WcStateMixin {
  MapSearchController(this._mapRepository);
  final MapRepository _mapRepository;

  TextEditingController placeNameTextController = TextEditingController();
  RxBool listLoaded = false.obs;
  // String get disease => _disease.value;
  Completer<NaverMapController> mapController = Completer();
  Rxn<Failure> failure = Rxn<Failure>();
  late LatLngUIModel _currentLocation;
  // final RxString keywordText = ''.obs;
  RxList<PlacePreviewUiModel> placeListSearched = RxList<PlacePreviewUiModel>();
  RxBool isLocationChanged = false.obs;

  late CameraPosition _cameraPosition;
  @override
  final Rx<PaginationFilter> _paginationFilter =
      PaginationFilter(page: 1, listSize: 15).obs;

  Rx<MapFilterUIModel> mapSearchFilter = MapFilterUIModel(
    placeType: PlaceType.all,
    openingStatus: OpeningStatus.all,
    sortType: Sorting.nearest,
    distanceBaseType: DistanceBaseType.currentLocation,
    searchArea: 30,
  ).obs;

  RxString _searchKeyword = ''.obs;
  String get searchKeyword => _searchKeyword.value;

  int get _page => _paginationFilter.value.page;
  int get _listSize => _paginationFilter.value.listSize;

  void loadNextPage() => changePaginationFilter(_page + 1, _listSize);

  void loadNewPage() => changePaginationFilter(1, _listSize);

  Rx<PlaceType> selectedPlaceType = PlaceType.all.obs;

  late Worker _debounceWorker;

  late Rx<LatLngUIModel> baseLocation;

  // LatLngUIModel get baseLocation => _baseLocation;

  @override
  Future<void> onInit() async {
    super.onInit();
    change([], status: const PageStatus.success());
    var previousBaseLocation = Get.arguments as LatLngUIModel?;
    _currentLocation = await _getCurrentLocation();

    if (previousBaseLocation != null) {
      baseLocation = LatLngUIModel(
              lat: (Get.arguments as LatLngUIModel).lat,
              lng: (Get.arguments as LatLngUIModel).lng)
          .obs;
    } else {
      baseLocation =
          LatLngUIModel(lat: _currentLocation.lat, lng: _currentLocation.lng)
              .obs;
    }

    // _setCameraPosition(CameraPosition(target: baseLocation.value, zoom: 0));

    change([], status: PageStatus.init());
  }

  // _setCameraPosition(CameraPosition cameraPosition) {
  //   _cameraPosition = CameraPosition(
  //       target: cameraPosition.target, zoom: cameraPosition.zoom);
  // }

  onCurrentLocationButtonTap() async {
    // _currentLocation = await _getCurrentLocation();
    await _moveCameraToLocation(_currentLocation);
  }

  _moveCameraToLocation(LatLngUIModel? location) async {
    if (location != null) {
      final _mapController = await mapController.future;
      await _mapController.moveCamera(
        CameraUpdate.scrollWithOptions(location, zoom: 15),
      );
    }
  }

  @override
  void onReady() {
    super.onReady();

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

  void onSearchChanged(String val) {
    if (!isLocationChanged.value) {
      // showCustomSnackbar(text: '검색할 위치를 먼저 설정해주세요');
      clearResult();
      return;
    }
    if (val.isEmpty) {
      clearResult();
    }
    _searchKeyword.value = val;
  }

  goToSetLocationPage() async {
    LatLngUIModel? searchBaseLocation = await Get.toNamed(
        Routes.MAP_SET_SERCH_LOCATION,
        arguments: baseLocation) as LatLngUIModel?;

    if (searchBaseLocation != null) {
      baseLocation = LatLngUIModel(
              lat: searchBaseLocation.lat, lng: searchBaseLocation.lng)
          .obs;
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
            baseLatLng: baseLocation.value);

    previewListResponse.fold((failure) {
      ErrorObject errorObject =
          ErrorObject.mapFailureToErrorMessage(failure: failure);
      change(null, status: PageStatus.error(errorObject.message));
    }, (dtoList) {
      if (dtoList.isEmpty) {
        change(null, status: const PageStatus.empty());
      } else {
        placeListSearched.assignAll(parseDtoToUiModel(dtoList));
        change(placeListSearched, status: const PageStatus.success());
      }
    });
  }

  onCameraChange(
      LatLng? latLng, CameraChangeReason changeReason, bool? isChanged) {
    if (changeReason == CameraChangeReason.gesture) {
      if (latLng != null) {
        baseLocation.value =
            LatLngUIModel(lat: latLng.latitude, lng: latLng.longitude);
        isLocationChanged.value = true;
      }
    }
  }

  _morePlacePreviewList(paginationFilter) async {
    change(placeListSearched, status: PageStatus.loadingMore());
    Either<Failure, List<PlacePreviewResponseDTO>> previewListResponse =
        await _mapRepository.getPlacePreviewList(
            keyword: searchKeyword,
            mapFilterUIModel: mapSearchFilter.value,
            paginationFilter: _paginationFilter.value,
            baseLatLng: baseLocation.value);

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
      }
    });

    Get.focusScope!.unfocus();
  }

  List<PlacePreviewUiModel> parseDtoToUiModel(
      List<PlacePreviewResponseDTO> dto) {
    return dto
        .map((e) => e.map(
            pharmacy: (value) =>
                PharmacyPreviewUIModel.fromDTO(value, baseLocation.value),
            hospital: (value) =>
                HospitalPreviewUIModel.fromDTO(value, baseLocation.value)))
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

  // _moveCameraToBaseLocation(LatLngUIModel baseLocation) async {
  //   final _mapController = await mapController.future;

  //   await _mapController.moveCamera(CameraUpdate.scrollTo(baseLocation),
  //       animationDuration: 200);
  // }

  Future<void> onMapCreated(NaverMapController controller) async {
    // mapController = controller;
    if (mapController.isCompleted) mapController = Completer();
    mapController.complete(controller);
    await _moveCameraToLocation(baseLocation.value);
  }

  Future<LatLngUIModel> _getCurrentLocation() async {
    return await Geolocator.getCurrentPosition().then(
        (value) => LatLngUIModel(lat: value.latitude, lng: value.longitude));
  }

  _setSearchBaseLocation(LatLng? newBaseLocation) async {
    if (newBaseLocation != null) {
      baseLocation.value = LatLngUIModel(
          lat: newBaseLocation.latitude, lng: newBaseLocation.longitude);
    } else {
      final _mapController = await mapController.future;
      baseLocation.value = await _mapController.getCameraPosition().then(
          (value) => LatLngUIModel(
              lat: value.target.latitude, lng: value.target.longitude));
      print('Lat - 현재 위도 : ${baseLocation.value.lat}');
      print('Lng - 현재 경도 : ${baseLocation.value.lng}');
    }
  }

  changePageStatus(PageStatus pageStatus) async {
    if (status == PageStatus.init()) {
      change([], status: PageStatus.success());
    } else {
      change([], status: PageStatus.init());
    }
  }
}
