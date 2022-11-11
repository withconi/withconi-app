import 'dart:async';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:withconi/core/tools/helpers/quick_sort.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';
import 'package:withconi/module/ui_model/map_filter_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';
import 'package:withconi/module/ui_model/place_ui_model/hospital_preview_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/pharmacy_preview_ui_model.dart';
import '../../../data/enums/enum.dart';
import '../../../data/model/dto/response_dto/place_response/place_preview_response_dto.dart';
import '../../../import_basic.dart';
import '../../ui_model/place_marker_ui_model.dart';
import '../../../global_widgets/loading/loading_overlay.dart';
import '../../../core/tools/helpers/infinite_scroll.dart';

class MapMainPageController extends GetxController {
  RxBool hasLocationPermission = false.obs;
  Completer<NaverMapController> _controller = Completer();
  late NaverMapController mapController;
  final MapRepository _mapRepository = MapRepository();
  MapType mapType = MapType.Basic;
  Rxn<CameraPosition> currentPosition = Rxn<CameraPosition>();
  RxList<PlaceMarkerUIModel> placeMarkers = RxList<PlaceMarkerUIModel>();
  static int _searchDistance = 3;
  Rx<MapFilterUIModel> mapFilterUiModel = MapFilterUIModel(
          placeType: PlaceType.all,
          openingStatus: OpeningStatus.all,
          sortType: SortType.nearest,
          locationType: LocationSearchType.currentLocation,
          searchArea: _searchDistance)
      .obs;
  RxList<PlacePreviewUiModel> placePreviewList = RxList<PlacePreviewUiModel>();
  Rxn<PlacePreviewUiModel> selectedPlacePreview = Rxn<PlacePreviewUiModel>();
  RxBool showSelectedPlaceBottomSheet = false.obs;
  RxBool showPlaceListBottomSheet = true.obs;

  bool mapInited = false;
  Rx<SortType> selectedSortType = SortType.nearest.obs;
  RxBool showResearchButton = false.obs;
  Rx<LatLngUIModel> baseLocation = LatLngUIModel(lat: 0.0, lng: 0.0).obs;
  LatLngUIModel? _currentLocation;
  Rxn<CameraPosition> currentCameraPosition = Rxn<CameraPosition>();

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    listSize: 3,
  ).obs;

  DraggableScrollableController selectedPlaceDragController =
      DraggableScrollableController();

  DraggableScrollableController placePreviewListDragController =
      DraggableScrollableController();

  Rx<ScrollController> placeListScrollController = ScrollController().obs;

  ScrollController selectedPlaceScrollController = ScrollController();

  bool scrollInit = false;

  int get limit => _paginationFilter.value.listSize;
  int get _page => _paginationFilter.value.page;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);

  void loadNewPage() => _changePaginationFilter(1, limit);

  RxBool pageLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    if (kDebugMode) {
      print('🥳 MapMainPageController Inited');
    }

    if (await setPermissionStatus()) {
      _setSearchBaseLocation(
          locationSearchType: LocationSearchType.currentLocation);

      pageLoading.value = false;
    }
  }

  @override
  onReady() async {
    super.onReady();
    if (kDebugMode) {
      print('🥳 MapMainPageController Ready');
    }

    selectedPlaceDragController.addListener(() {
      if (selectedPlaceDragController.size >= 0.75) {
        goToSelectedPlaceDetail();
        Future.delayed(const Duration(milliseconds: 200),
            () => selectedPlaceDragController.jumpTo(240 / WcHeight));
        selectedPlaceScrollController.jumpTo(0.0);
      }
    });

    ever(selectedPlacePreview, _onSelectedMarkerChanged);
    ever(mapFilterUiModel, (_) => loadNewPage());

    ever(_paginationFilter, (PaginationFilter paginationFilter) async {
      if (paginationFilter.page == 1) {
        await showLoading(() => _getPlacePreviewList(paginationFilter));
      } else {
        await _morePlacePreviewList(paginationFilter);
      }
    });

    if (kDebugMode) {
      print('🥳 MapMainPageController Ready Finished');
    }
  }

  initScrollController(ScrollController scrollController) {
    scrollController.addListener(
      () async {
        // if (!_paginationFilter.value.isLoading &&
        //     !_paginationFilter.value.lastPage &&
        //     scrollController.offset >=
        //         scrollController.position.maxScrollExtent - 90) {
        //   loadNextPage();
        // }
      },
    );
  }

  Future<void> onMapCreated(NaverMapController controller) async {
    mapController = controller;

    if (_currentLocation != null) {
      if (mapInited) {
        loadNewPage();
        mapInited = true;
      }
    }
  }

  void changeTotalPerPage(int limitValue) {
    placeMarkers.clear();
    // _paginationFilter.value.lastPage = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.value.page = page;
    _paginationFilter.value.listSize = limit;
  }

  Future<bool> _setSearchBaseLocation(
      {required LocationSearchType locationSearchType}) async {
    bool success = false;

    await _setCurrentLocation();
    if (_currentLocation != null) {
      switch (locationSearchType) {
        case LocationSearchType.mapLocation:
          baseLocation.value = await mapController.getCameraPosition().then(
              (value) => LatLngUIModel(
                  lat: value.target.latitude, lng: value.target.longitude));
          break;
        case LocationSearchType.currentLocation:
          baseLocation.value = _currentLocation!;
          break;

        default:
      }
      success = true;
    } else {
      success = false;
    }
    return success;
  }

  _setCurrentLocation() async {
    _currentLocation = await _getCurrentLocation();
  }

  onCurrentLocationButtonTap() async {
    _currentLocation = await _getCurrentLocation();

    await mapController.moveCamera(CameraUpdate.scrollTo(_currentLocation!),
        animationDuration: 200);

    currentPosition.value = await mapController.getCameraPosition();
  }

  onSortTypeChanged(SortType sortType) {
    mapFilterUiModel.value.sortType = sortType;
    mapFilterUiModel.refresh();
    // List<PlacePreviewUiModel> sortedPlacePreview = QuickSort().sortPlaceByType(
    //     placeMarkerList: placePreviewList, sortType: selectedSortType.value);
    // placeMarkers.assignAll(sortedMarkers);
    // placePreviewList.refresh();
  }

  onBaseLocationChanged(LocationSearchType locationType) {
    mapFilterUiModel.value.locationType = locationType;
    // showLoading(() => getNewPlaceList());
    mapFilterUiModel.refresh();
    searchRefresh();
  }

  void onMapTap(LatLng latLng) {
    if (selectedPlacePreview.value != null) {
      placeMarkers.forEach((customMarker) async {
        if (customMarker.placeId == selectedPlacePreview.value!.placeId) {
          await customMarker.setImageIcon(iconClicked: false);
          selectedPlacePreview.value = null;
          return;
        }
      });
    }
    showSelectedPlaceBottomSheet.value = false;
    showPlaceListBottomSheet.value = true;
    placeMarkers.refresh();
  }

  void goToSelectedPlaceDetail() {
    Get.toNamed(Routes.MAP_DETAIL, arguments: selectedPlacePreview.value);
  }

  void onCameraChange(
      LatLng? latLng, CameraChangeReason changeReason, bool? isChanged) {
    if (changeReason == CameraChangeReason.gesture &&
        selectedPlacePreview.value == null) {
      showResearchButton.value = true;
      showPlaceListBottomSheet.value = true;
      // placeMarkers.refresh();
    }
  }

  onSelectedDiseaseTypeChanged(Object? item) async {
    mapFilterUiModel.value.diseaseType = item as DiseaseType?;
    // searchRefresh();
    mapFilterUiModel.refresh();
  }

  onSelectedSpeciesTypeChanged(Object? item) async {
    mapFilterUiModel.value.speciesType = item as Species?;
    // searchRefresh();
    mapFilterUiModel.refresh();
  }

  onSelectedPlaceTypeChanged(Object? item) async {
    mapFilterUiModel.value.placeType = item as PlaceType;
    // searchRefresh();
    mapFilterUiModel.refresh();
  }

  onOpeningStatusTypeChanged(OpeningStatus openingStatus) async {
    mapFilterUiModel.value.openingStatus = openingStatus;
    // searchRefresh();
    mapFilterUiModel.refresh();
  }

  Future<void> _onMarkerTap(Marker? marker, Map<String, int?> iconSize) async {
    placePreviewList.forEach((placePreview) {
      if (placePreview.placeId == marker!.markerId) {
        selectedPlacePreview.value = placePreview;
        return;
      }
    });
  }

  _onSelectedMarkerChanged(PlacePreviewUiModel? selectedPlace) async {
    if (selectedPlace != null) {
      await mapController.moveCamera(
          CameraUpdate.scrollTo(selectedPlace.placeLocation),
          animationDuration: 100);

      currentCameraPosition.value = await mapController.getCameraPosition();
      for (PlaceMarkerUIModel customMarker in placeMarkers) {
        if (customMarker.placeId == selectedPlacePreview.value!.placeId) {
          await customMarker.setImageIcon(iconClicked: true);
        } else {
          await customMarker.setImageIcon(iconClicked: false);
        }
      }

      showSelectedPlaceBottomSheet.value = true;
      showPlaceListBottomSheet.value = false;
      showResearchButton.value = false;
      placeMarkers.refresh();
    }
  }

  searchRefresh() async {
    if (await _setSearchBaseLocation(
        locationSearchType: mapFilterUiModel.value.locationType)) {
      await _setSearchArea();
    }
    loadNewPage();
  }

  _setSearchArea() async {
    // double totalMeterPerPx = WcWidth * await mapController.getMeterPerPx();
    // int totalKilometer = (totalMeterPerPx / 1000).round();
    // if (totalKilometer >= 7) {
    //   _searchDistance = 7;
    // } else if (totalKilometer <= 3) {
    //   _searchDistance = 3;
    // } else {
    //   _searchDistance = totalKilometer;
    // }
    _searchDistance = 200;
  }

  Future<void> _getPlacePreviewList(PaginationFilter paginationFilter) async {
    // paginationFilter.isLoading = true;
    // paginationFilter.lastPage = false;

    var previewListResult = await _mapRepository.getPlacePreviewList(
        mapFilterUIModel: mapFilterUiModel.value,
        paginationFilter: _paginationFilter.value,
        baseLatLng: baseLocation.value);

    previewListResult.fold((l) => null, (previewListDto) async {
      if (previewListDto.isEmpty) {
        // paginationFilter.lastPage = true;
      } else {
        placePreviewList.assignAll(_parsePlacePreviewListDTO(previewListDto));
        placeMarkers.assignAll(_makePlaceMarkers(placePreviewList));
        // onSortTypeChanged();
      }
      return;
    });
    // paginationFilter.isLoading = false;
    if (_searchDistance >= 7) {
      mapController.moveCamera(
          CameraUpdate.scrollWithOptions(baseLocation.value, zoom: 11));
      currentCameraPosition.value = await mapController.getCameraPosition();
    }
  }

  _morePlacePreviewList(PaginationFilter paginationFilter) async {
    // paginationFilter.isLoading = true;
    // paginationFilter.lastPage = false;

    var previewListResult = await _mapRepository.getPlacePreviewList(
        mapFilterUIModel: mapFilterUiModel.value,
        paginationFilter: _paginationFilter.value,
        baseLatLng: baseLocation.value);

    previewListResult.fold((l) => null, (previewDtoList) async {
      if (previewDtoList.isEmpty) {
        // paginationFilter.lastPage = true;
      } else {
        placePreviewList.addAll(_parsePlacePreviewListDTO(previewDtoList));
        placeMarkers.addAll(_makePlaceMarkers(placePreviewList));

        onSortTypeChanged(mapFilterUiModel.value.sortType);
      }
      return;
    });
    // paginationFilter.isLoading = false;
  }

  List<PlacePreviewUiModel> _parsePlacePreviewListDTO(
      List<PlacePreviewResponseDTO> placePreviewListDTO) {
    List<PlacePreviewUiModel> newPreviewUiList = placePreviewListDTO
        .map((placePreviewDTO) => placePreviewDTO.map(
            pharmacy: (value) =>
                PharmacyPreviewUIModel.fromDTO(value, baseLocation.value),
            hospital: (value) =>
                HospitalPreviewUIModel.fromDTO(value, baseLocation.value)))
        .toList();
    return newPreviewUiList;
  }

  List<PlaceMarkerUIModel> _makePlaceMarkers(
      List<PlacePreviewUiModel> placePreviewList) {
    return placePreviewList
        .map((placePreview) => PlaceMarkerUIModel.fromMyPlace(
            placePreview: placePreview, onTapMarker: _onMarkerTap))
        .toList();
  }

  Future<LatLngUIModel> _getCurrentLocation() async {
    return await Geolocator.getCurrentPosition().then(
        (value) => LatLngUIModel(lat: value.latitude, lng: value.longitude));
  }

  Future<bool> setPermissionStatus() async {
    late bool serviceEnabled;
    late bool gotPermission;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      gotPermission = false;
    } else {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          gotPermission = false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        gotPermission = false;
      }
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        gotPermission = true;
      }
    }

    hasLocationPermission.value = gotPermission;

    return gotPermission;
  }

  openAppLocationSetting() async {
    await AppSettings.openLocationSettings();
  }

  searchPlace() async {
    PlacePreviewUiModel? searchedPlacePreview =
        await Get.toNamed(Routes.MAP_SEARCH) as PlacePreviewUiModel?;
    if (searchedPlacePreview != null) {
      Get.toNamed(Routes.MAP_DETAIL, arguments: searchedPlacePreview.placeId);
    }
  }

  newPlaceReviewPage(PlacePreviewUiModel placePreview) {
    Get.toNamed(Routes.MAP_NEW_REVIEW, arguments: placePreview);
  }
}
