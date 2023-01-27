import 'dart:async';
import 'package:app_settings/app_settings.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/core/tools/helpers/quick_sort.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/global_widgets/snackbar.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';
import 'package:withconi/module/ui_model/map_filter_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';
import 'package:withconi/module/ui_model/place_ui_model/hospital_preview_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/pharmacy_preview_ui_model.dart';
import 'package:withconi/module/ui_model/review_detail_ui_model.dart';
import '../../../core/error_handling/error_message_object.dart';
import '../../../data/enums/enum.dart';
import '../../../data/model/dto/response_dto/place_response/place_preview_response_dto.dart';
import '../../../import_basic.dart';
import '../../community/controllers/custom_state_mixin.dart';
import '../../page_status.dart';
import '../../ui_model/place_marker_ui_model.dart';
import '../../../core/tools/helpers/infinite_scroll.dart';
import '../../ui_model/review_preview_ui_model.dart';
import '../abstract/map_review_update_abstract.dart';
import '../widgets/map_overlapped_botton_sheet.dart';

class MapMainPageController extends GetxController
    with WcStateMixin
    implements AbstractMapReviewUpdate {
  MapMainPageController(this._mapRepository);

  static MapMainPageController get to => Get.find();
  final MapRepository _mapRepository;

  RxBool hasLocationPermission = false.obs;
  Completer<NaverMapController> mapController = Completer();
  RxBool isMoreLoading = false.obs;
  RxBool isCurrentLocationValid = true.obs;
  MapType mapType = MapType.Basic;
  Rxn<CameraPosition> currentPosition = Rxn<CameraPosition>();
  RxList<PlaceMarkerUIModel> placeMarkers = RxList<PlaceMarkerUIModel>();
  double _searchDistanceKilometer = 0.5;
  static const double _maxSearchDistanceKilometer = 100;
  static const double _minSearchDistanceKilometer = 0.3;
  Rx<PlaceType> selectedPlaceType = PlaceType.all.obs;
  Rxn<DiseaseType> selectedDiseaseType = Rxn<DiseaseType>();
  Rxn<Species> selectedSpeciesType = Rxn<Species>();
  Rx<OpeningStatus> selectedOpeningStatus = OpeningStatus.all.obs;
  Rx<Sorting> selectedSorting = Sorting.nearest.obs;
  Rx<DistanceBaseType> selectedDistanceBaseType =
      DistanceBaseType.currentLocation.obs;
  RxList<PlacePreviewUIModel> placePreviewList = RxList<PlacePreviewUIModel>();
  Rxn<PlacePreviewUIModel> selectedPlacePreview = Rxn<PlacePreviewUIModel>();
  RxBool showSelectedPlaceBottomSheet = false.obs;
  RxBool showPlaceListBottomSheet = true.obs;
  RxBool showMapButton = false.obs;
  RxBool showRefreshButton = false.obs;
  Rx<LatLngUIModel> baseLocation =
      LatLngUIModel(lat: 37.3584879, lng: 127.105037).obs;
  LatLngUIModel? _currentLocation;
  RxDouble searchAreaCircleRadius = 0.0.obs;
  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    listSize: 20,
  ).obs;

  DraggableScrollableController selectedPlaceDragController =
      DraggableScrollableController();

  DraggableScrollableController placeListDragController =
      DraggableScrollableController();

  ScrollController placeListScrollController = ScrollController();

  ScrollController selectedPlaceScrollController = ScrollController();
  LatLngBounds? latLngBounds;

  static const _maxPlacePreviewLength = 80;

  int get limit => _paginationFilter.value.listSize;
  int get _page => _paginationFilter.value.page;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);

  void loadNewPage() => _changePaginationFilter(1, limit);

  MapFilterUIModel get _mapFilter => MapFilterUIModel(
        placeType: selectedPlaceType.value,
        openingStatus: selectedOpeningStatus.value,
        sortType: selectedSorting.value,
        diseaseType: selectedDiseaseType.value,
        speciesType: selectedSpeciesType.value,
        distanceBaseType: selectedDistanceBaseType.value,
        searchArea: _searchDistanceKilometer,
      );

  @override
  onInit() async {
    super.onInit();
    change(placePreviewList, status: const PageStatus.init());

    if (await setPermissionStatus()) {
      _setSearchBaseLocation(
          locationSearchType: DistanceBaseType.currentLocation);
    } else {
      _setSearchBaseLocation(locationSearchType: DistanceBaseType.mapLocation);
    }
    _attchDragController();
  }

  _attchDragController() {
    selectedPlaceDragController.addListener(() {
      if (selectedPlaceDragController.size >= 0.8) {
        goToSelectedPlaceDetail();
        Future.delayed(const Duration(milliseconds: 200),
            () => selectedPlaceDragController.jumpTo(240 / WcHeight));
        selectedPlaceScrollController.jumpTo(0.0);
      }
    });

    placeListDragController.addListener(() {
      if (placeListDragController.size >= 1 &&
          placePreviewList.isNotEmpty &&
          showPlaceListBottomSheet.value) {
        showMapButton.value = true;
      } else {
        showMapButton.value = false;
      }
    });
  }

  @override
  onReady() {
    super.onReady();
    ever(_paginationFilter, getDataByPaginationFilter);
  }

  @override
  onClose() {
    placePreviewList.clear();
    placeMarkers.clear();
    placePreviewList.close();
    placeMarkers.close();
    super.onClose();
  }

  getDataByPaginationFilter(PaginationFilter _paginationFilter) async {
    if (_paginationFilter.page == 1) {
      await showLoading(() => _getPlacePreviewList(_paginationFilter));
    } else if (_paginationFilter.page > 1) {
      await _morePlacePreviewList(_paginationFilter);
    }
  }

  double get nextPageTrigger =>
      0.8 * placeListScrollController.position.maxScrollExtent;

  Future<void> onMapCreated(NaverMapController controller) async {
    // mapController = controller;
    if (mapController.isCompleted) mapController = Completer();
    mapController.complete(controller);

    if (_currentLocation != null) {}
  }

  onShowMapButtonTap() async {
    await placeListScrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 80), curve: Curves.linear);
    // placeListDragController.animateTo(0.39,
    //     duration: const Duration(milliseconds: 200), curve: Curves.linear);
    placeListDragController.animateTo(0.40,
        duration: const Duration(milliseconds: 90), curve: Curves.linear);
  }

  void changeTotalPerPage(int limitValue) {
    placeMarkers.clear();
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.value.page = page;
    _paginationFilter.value.listSize = limit;
    _paginationFilter.refresh();
  }

  Future<bool> _setSearchBaseLocation(
      {required DistanceBaseType locationSearchType}) async {
    bool success = false;

    final _mapController = await mapController.future;
    // await _setCurrentLocation();
    if (_currentLocation != null) {
      switch (locationSearchType) {
        case DistanceBaseType.mapLocation:
          baseLocation.value = await _mapController.getCameraPosition().then(
              (value) => LatLngUIModel(
                  lat: value.target.latitude, lng: value.target.longitude));
          print('Lat - 현재 위도 : ${baseLocation.value.lat}');
          print('Lng - 현재 경도 : ${baseLocation.value.lng}');
          break;
        case DistanceBaseType.currentLocation:
          baseLocation.value = _currentLocation!;
          break;

        default:
      }
      success = true;
    } else {
      baseLocation.value = await _mapController.getCameraPosition().then(
          (value) => LatLngUIModel(
              lat: value.target.latitude, lng: value.target.longitude));
      _currentLocation = LatLngUIModel(
          lat: baseLocation.value.latitude, lng: baseLocation.value.longitude);
      print('Lat - 현재 위도 : ${baseLocation.value.lat}');
      print('Lng - 현재 경도 : ${baseLocation.value.lng}');
      success = true;
    }
    // baseLocation.refresh();
    placePreviewList.refresh();

    return success;
  }

  // _setCurrentLocation() async {
  //   _currentLocation = await _getCurrentLocation();
  // }

  onCurrentLocationButtonTap() async {
    final _mapController = await mapController.future;
    _currentLocation = await _getCurrentLocation();

    if (_currentLocation != null) {
      await _mapController.moveCamera(CameraUpdate.scrollTo(_currentLocation!),
          animationDuration: 200);
    }

    currentPosition.value = await _mapController.getCameraPosition();
  }

  onSortTypeChanged(Sorting sortType) {
    selectedSorting.value = sortType;
    _sortPlaceList(sortType);
  }

  onDistanceBaseTypeChanged(DistanceBaseType distanceBaseType) {
    selectedDistanceBaseType.value = distanceBaseType;
    _setSearchBaseLocation(locationSearchType: distanceBaseType);
  }

  _sortPlaceList(Sorting newSortType) {
    switch (newSortType) {
      case Sorting.nearest:
        QuickSort().sortByNearestWithBaseLocation(
            placeList: placePreviewList, baseLocation: baseLocation.value);

        break;
      case Sorting.visiting:
        QuickSort().sortByVisiting(placeList: placePreviewList);

        break;
      default:
    }

    placePreviewList.refresh();
  }

  Future<void> onMapTap(LatLng? latLng) async {
    setSelectedPlacePreview(null);
  }

  void goToSelectedPlaceDetail([PlacePreviewUIModel? placePreviewUiModel]) {
    Get.toNamed(Routes.MAP_DETAIL, arguments: {
      'placeId':
          placePreviewUiModel?.placeId ?? selectedPlacePreview.value!.placeId,
      'placeType': placePreviewUiModel?.placeType ??
          selectedPlacePreview.value!.placeType,
      // 'lat': baseLocation.value.lat,
      // 'lng': baseLocation.value.lng,
      'lat': 37.39606930508214,
      'lng': 127.111603930644,
      'mapReviewAbstract': MapMainPageController.to,
    });
  }

  void onCameraChange(
      LatLng? latLng, CameraChangeReason changeReason, bool? isChanged) {
    if (changeReason == CameraChangeReason.gesture) {
      showRefreshButton.value = true;
      showPlaceListBottomSheet.value = true;
      // setSelectedPlacePreview(null);
    }
  }

  onDiseaseTypeChanged(Object? item) {
    selectedDiseaseType.value = item as DiseaseType?;
    loadNewPage();
  }

  onSpeciesTypeChanged(Object? item) {
    selectedSpeciesType.value = item as Species?;
    loadNewPage();
  }

  onPlaceTypeChanged(Object? item) {
    selectedPlaceType.value = item as PlaceType;
    setSelectedPlacePreview(null);
    loadNewPage();
  }

  onOpeningStatusTypeChanged(OpeningStatus openingStatus) {
    selectedOpeningStatus.value = openingStatus;
    loadNewPage();
  }

  Future<void> _onMarkerTap(Marker? marker, Map<String, int?> iconSize) async {
    setSelectedPlacePreview(marker!.markerId);
  }

  Future<void> _onOverlappedMarkerTap(
      Marker? marker, Map<String, int?> iconSize) async {
    var overlappedPreviewList = placePreviewList
        .where((preview) =>
            preview.placeLocation.latitude == marker!.position!.latitude &&
            preview.placeLocation.longitude == marker.position!.longitude)
        .toList();

    int selectedIndex = await showOverlappedPlaceBottomSheet(
        placePreview: overlappedPreviewList);

    setSelectedPlacePreview(overlappedPreviewList[selectedIndex].placeId);

    // List<String> overlappedPreviewList = placeMarkers
    //     .where((marker) => marker.overlappedMarkerList.contains(marker.placeId))
    //     .map((marker) => )
    //     .toList();

    // int selectedIndex = await showOverlappedPlaceBottomSheet(
    //     placePreview: );

    // setSelectedPlacePreview(overlappedPreviewList[selectedIndex].placeId);
  }

  setSelectedPlacePreview(String? selectedPlaceId) {
    String? previousSelectedPlaceId = selectedPlacePreview.value?.placeId;
    if (selectedPlaceId != null) {
      selectedPlacePreview.value = placePreviewList
          .firstWhere((element) => element.placeId == selectedPlaceId);
    } else {
      selectedPlacePreview.value = null;
    }

    _onSelectedPlaceChanged(
        previousSelectedPlaceId, selectedPlacePreview.value);
  }

  Future<void> _onSelectedPlaceChanged(
      String? previousSelectedPlaceId, PlacePreviewUIModel? newSelectedPlace,
      [bool moveCamera = true]) async {
    if (previousSelectedPlaceId != null) {
      for (PlaceMarkerUIModel marker in placeMarkers) {
        if (marker.placeId == previousSelectedPlaceId) {
          await marker.setMarkerImageIcon(iconClicked: false);
          break;
        }
      }
    }

    if (newSelectedPlace == null) {
      showSelectedPlaceBottomSheet.value = false;
      showPlaceListBottomSheet.value = true;
      showRefreshButton.value = true;
      showMapButton.value = false;
    } else {
      if (!placeMarkers
          .any((element) => element.placeId == newSelectedPlace.placeId)) {
        await _makeNewSinglePlaceMarker(newSelectedPlace);
      }

      showSelectedPlaceBottomSheet.value = true;
      showPlaceListBottomSheet.value = false;
      showRefreshButton.value = false;
      showMapButton.value = false;

      if (moveCamera) {
        final _mapController = await mapController.future;
        await _mapController.moveCamera(
            CameraUpdate.scrollWithOptions(newSelectedPlace.placeLocation,
                zoom: 15),
            animationDuration: 100);

        // _currentCameraPosition = await _mapController.getCameraPosition();
      }

      for (PlaceMarkerUIModel customMarker in placeMarkers) {
        if (customMarker.placeId == newSelectedPlace.placeId) {
          await customMarker.setMarkerImageIcon(iconClicked: true);
          break;
        }
      }
    }

    change(placePreviewList, status: PageStatus.success());
  }

  onSearchRefreshTap() async {
    if (await _setSearchBaseLocation(
        locationSearchType: DistanceBaseType.mapLocation)) {
      await _setSearchDistance();
    }
    loadNewPage();
    // mapFilterUiModel.value.locationType = LocationSearchType.mapLocation;
  }

  _setSearchDistance() async {
    final _mapController = await mapController.future;
    // LatLngBounds latLngBounds = await _mapController.getVisibleRegion();
    // Map<String, int?> mapSize = await _mapController.getSize();

    double searchDistanceMeter =
        (WcWidth) * await _mapController.getMeterPerPx();
    print(searchDistanceMeter);
    double searchDistanceKilometer = (searchDistanceMeter / 1000);
    if (searchDistanceKilometer >= _maxSearchDistanceKilometer) {
      _searchDistanceKilometer = _maxSearchDistanceKilometer;
    } else if (searchDistanceKilometer <= _minSearchDistanceKilometer) {
      _searchDistanceKilometer = _minSearchDistanceKilometer;
    } else {
      _searchDistanceKilometer = searchDistanceKilometer;
    }
  }

  Future<void> _getPlacePreviewList(PaginationFilter paginationFilter) async {
    change(placePreviewList, status: const PageStatus.loading());

    setSelectedPlacePreview(null);
    var previewListResult = await _mapRepository.getPlacePreviewList(
        mapFilterUIModel: _mapFilter,
        paginationFilter: _paginationFilter.value,
        baseLatLng: baseLocation.value);

    var previewListDto = previewListResult.fold((l) {
      ErrorObject errorObject =
          ErrorObject.mapFailureToErrorMessage(failure: l);
      change(null, status: PageStatus.error(errorObject.message));
    }, (listDTO) {
      return listDTO;
    });

    if (previewListDto != null) {
      await _onPlaceListAssigned(_parsePlacePreviewListDTO(previewListDto));

      if (previewListDto.isEmpty) {
        change(placePreviewList, status: const PageStatus.empty());
      } else {
        change(placePreviewList, status: const PageStatus.success());
        final _mapController = await mapController.future;
        _mapController
            .moveCamera(CameraUpdate.fitBounds(latLngBounds!, padding: 95));
      }

      if (placeListDragController.size < 0.35) {
        placeListDragController.animateTo(0.4,
            duration: Duration(milliseconds: 200), curve: Curves.linear);
      }
    }
  }

  _morePlacePreviewList(PaginationFilter paginationFilter) async {
    isMoreLoading.value = true;

    if (placePreviewList.length > _maxPlacePreviewLength) {
      change(placePreviewList, status: const PageStatus.emptyLastPage());
      return;
    }

    change(placePreviewList, status: const PageStatus.loadingMore());

    var previewListResult = await _mapRepository.getPlacePreviewList(
        mapFilterUIModel: _mapFilter,
        paginationFilter: _paginationFilter.value,
        baseLatLng: baseLocation.value);

    var morePreviewListDTO = previewListResult.fold((failure) {
      ErrorObject errorMessage =
          ErrorObject.mapFailureToErrorMessage(failure: failure);
      change(null, status: PageStatus.error(errorMessage.message));
      isMoreLoading.value = false;
      return null;
    }, (previewDtoList) {
      return previewDtoList;
    });

    if (morePreviewListDTO != null) {
      if (morePreviewListDTO.isEmpty) {
        change(placePreviewList, status: const PageStatus.emptyLastPage());
      } else {
        await _onPlaceListAdded(_parsePlacePreviewListDTO(morePreviewListDTO));
        // placePreviewList.refresh();
        change(placePreviewList, status: const PageStatus.success());
        isMoreLoading.value = false;
      }
    }
  }

  LatLngBounds _boundsFromLatLngList(List<LatLngUIModel> latlngList) {
    assert(latlngList.isNotEmpty);
    double? x0;
    double? x1;
    double? y0;
    double? y1;
    for (LatLng latLng in latlngList) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      }
      if (latLng.latitude > x1!) x1 = latLng.latitude;
      if (latLng.latitude < x0) x0 = latLng.latitude;
      if (latLng.longitude > y1!) y1 = latLng.longitude;
      if (latLng.longitude < y0!) y0 = latLng.longitude;
    }
    return LatLngBounds(
        northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }

  _onPlaceListAdded(List<PlacePreviewUIModel> newPlaceList) async {
    placePreviewList.addAll(newPlaceList);

    // if (placeMarkers.length < 30) {
    //   await _addPlaceMarkers(newPlaceList);
    // }

    _addPlaceMarkers(newPlaceList);
  }

  _onPlaceListAssigned(List<PlacePreviewUIModel> newPlaceList) async {
    if (newPlaceList.isEmpty) {
      placePreviewList.clear();
      placeMarkers.clear();
      return;
    }
    placePreviewList.assignAll(newPlaceList);

    _sortPlaceList(selectedSorting.value);

    latLngBounds = _boundsFromLatLngList(
        placePreviewList.map((element) => element.placeLocation).toList());

    await _assignPlaceMarkers(placePreviewList);
  }

  List<PlacePreviewUIModel> _parsePlacePreviewListDTO(
      List<PlacePreviewResponseDTO> placePreviewListDTO) {
    if (placePreviewListDTO.isEmpty) {
      return [];
    }
    List<PlacePreviewUIModel> newPreviewUiList = placePreviewListDTO
        .map((placePreviewDTO) => placePreviewDTO.map(
            pharmacy: (value) =>
                PharmacyPreviewUIModel.fromDTO(value, baseLocation.value),
            hospital: (value) =>
                HospitalPreviewUIModel.fromDTO(value, baseLocation.value)))
        .toList();
    return newPreviewUiList.toList();
  }

  Future<void> _assignPlaceMarkers(
    List<PlacePreviewUIModel> placePreviewList,
  ) async {
    // Map<int, int> map = {};

    // for (int i = 0; i < placePreviewList.length; i++) {
    //   for (int j = i + 1; j < placePreviewList.length; j++) {
    //     if (map[i] != null && map[i]! > 0) break;
    //     if (map[j] != null && map[j]! > 0) continue;
    //     if (placePreviewList[i].placeLocation.lat ==
    //             placePreviewList[j].placeLocation.lat &&
    //         placePreviewList[i].placeLocation.lng ==
    //             placePreviewList[j].placeLocation.lng) {
    //       map[i] = 1;
    //       map[j] = 1;
    //     } else {
    //       if (map[i] == null) map[i] = 0;
    //       if (map[j] == null) map[j] = 0;
    //     }
    //   }
    // }

    //  var overlappedMarkers = map.entries
    //       .where((entry) => entry.value > 0)
    //       .map((e) => PlaceMarkerUIModel.fromMyOverlappedPlace(
    //             placePreview: placePreviewList[e.key],
    //             onTapMarker: _onMarkerTap,
    //           ))
    //       .toList();

    //   var markers = map.entries
    //       .where((entry) => entry.value <= 0)
    //       .map((e) => PlaceMarkerUIModel.fromMyPlace(
    //             placePreview: placePreviewList[e.key],
    //             onTapMarker: _onMarkerTap,
    //           ))
    //       .toList();

    Map<int, List<String>> map = {};

    for (int i = 0; i < placePreviewList.length; i++) {
      for (int j = i + 1; j < placePreviewList.length; j++) {
        if (map[i] == null) map[i] = [];
        if (map[j] == null) map[j] = [];
        if (placePreviewList[i].placeLocation.lat ==
                placePreviewList[j].placeLocation.lat &&
            placePreviewList[i].placeLocation.lng ==
                placePreviewList[j].placeLocation.lng) {
          map[i]!.add(placePreviewList[j].placeId);
          map[j]!.add(placePreviewList[i].placeId);
        }
      }
    }

    var overlappedMarkers = map.entries
        .where((entry) => entry.value.isNotEmpty)
        .map((e) => PlaceMarkerUIModel.fromMyOverlappedPlace(
              overlappedMarkerList: map[e] ?? [],
              placePreview: placePreviewList[e.key],
              onTapMarker: _onMarkerTap,
            ))
        .toList();

    var markers = map.entries
        .where((entry) => entry.value.isEmpty)
        .map((e) => PlaceMarkerUIModel.fromMyPlace(
              placePreview: placePreviewList[e.key],
              onTapMarker: _onMarkerTap,
            ))
        .toList();

    placeMarkers.assignAll([...overlappedMarkers, ...markers]);
    for (var element in placeMarkers) {
      await element.setMarkerImageIcon(iconClicked: false);
    }
    placeMarkers.refresh();
  }

  Future<void> _addPlaceMarkers(
    List<PlacePreviewUIModel> placePreviewList,
  ) async {
    var newPlaceMarkers = placePreviewList
        .map((placePreview) => PlaceMarkerUIModel.fromMyPlace(
              placePreview: placePreview,
              onTapMarker: _onMarkerTap,
            ))
        .toList();

    placeMarkers.addAll(newPlaceMarkers);
    for (var element in placeMarkers) {
      await element.setMarkerImageIcon(iconClicked: false);
    }
    placeMarkers.refresh();
  }

  Future<void> _makeNewSinglePlaceMarker(
    PlacePreviewUIModel newPlacePreview,
  ) async {
    var newPlaceMarker = PlaceMarkerUIModel.fromMyPlace(
      placePreview: newPlacePreview,
      onTapMarker: _onMarkerTap,
    );

    placeMarkers.add(newPlaceMarker);

    placeMarkers.forEach((element) async {
      if (element.placeId == newPlaceMarker.placeId) {
        await element.setMarkerImageIcon(iconClicked: false);
        return;
      }
    });
    placeMarkers.refresh();
    return;
  }

  Future<LatLngUIModel?> _getCurrentLocation() async {
    try {
      LatLngUIModel currentLocation = await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true,
      )
          .then((value) =>
              LatLngUIModel(lat: value.latitude, lng: value.longitude))
          .onError((error, stackTrace) {
        throw const LocationServiceDisabledException();
      });

      if (currentLocation.lat < 0.0 || currentLocation.lng < 0.0) {
        isCurrentLocationValid.value = false;
        return LatLngUIModel(lat: 37.3584879, lng: 127.105037);
      }

      isCurrentLocationValid.value = true;

      return currentLocation;
    } on LocationServiceDisabledException {
      FailureInterpreter().mapFailureToDialog(
          const Failure.locationDisabledFailure(), '_getCurrentLocation');
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> setPermissionStatus() async {
    late bool serviceEnabled;
    late bool gotPermission;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      gotPermission = false;
      permission = await Geolocator.requestPermission();
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

  goToSearchPlacePage() async {
    PlacePreviewUIModel? searchedPlacePreview =
        await Get.toNamed(Routes.MAP_SEARCH, arguments: {
      'lat': baseLocation.value.lat,
      'lng': baseLocation.value.lng
    }) as PlacePreviewUIModel?;
    if (searchedPlacePreview != null) {
      // Get.toNamed(Routes.MAP_DETAIL, arguments: searchedPlacePreview);

      if (searchedPlacePreview.placeType != selectedDiseaseType.value) {
        selectedPlaceType.value = PlaceType.all;
      }

      await _addSearchedPlacePreview(searchedPlacePreview);
    }
  }

  goToMyReviewPage() {
    Get.toNamed(Routes.MAP_MY_REVIEW, arguments: {
      'lat': baseLocation.value.lat,
      'lng': baseLocation.value.lng,
      'mapReviewAbstract': MapMainPageController.to,
    });
  }

  goToBookmarkPage() {
    Get.toNamed(
      Routes.MAP_BOOKMARK,
    );
  }

  _addSearchedPlacePreview(PlacePreviewUIModel searchedPlace) async {
    if (placePreviewList
        .any((element) => element.placeId == searchedPlace.placeId)) {
    } else {
      placePreviewList.add(searchedPlace);
      await _makeNewSinglePlaceMarker(searchedPlace);
    }
    setSelectedPlacePreview(searchedPlace.placeId);
  }

  newPlaceReviewPage(PlacePreviewUIModel placePreview) async {
    var newReview = await Get.toNamed(Routes.MAP_NEW_REVIEW, arguments: {
      'placeSelected': true,
      'lat': baseLocation.value.lat,
      'lng': baseLocation.value.lng,
      'placeId': placePreview.placeId,
      'placeName': placePreview.name,
      'placeAddress': placePreview.address,
      'placeThumbnail': placePreview.thumbnailImage,
      'mapReviewAbstract': MapMainPageController.to,
    }) as ReviewDetailUIModel?;

    if (newReview != null) {
      addReview(newReview);
    }
  }

  @override
  void addReview(ReviewDetailUIModel newReview) {
    int index = placePreviewList
        .indexWhere((element) => element.placeId == newReview.placeId);

    if (index >= 0) {
      if (placePreviewList[index].totalReviews == 0 ||
          placePreviewList[index].mostVisitedDiseaseType ==
              DiseaseType.undefined) {
        placePreviewList[index].mostVisitedDiseaseType =
            newReview.diseaseTypes[0];
      }
      placePreviewList[index].totalReviews += 1;
      placePreviewList.refresh();
      change(placePreviewList, status: PageStatus.success());
    }
  }

  @override
  void deleteReview(String reviewId, String placeId) {
    int index =
        placePreviewList.indexWhere((element) => element.placeId == placeId);

    if (index >= 0) {
      if (placePreviewList[index].totalReviews == 1) {
        placePreviewList[index].mostVisitedDiseaseType = DiseaseType.undefined;
      }
      placePreviewList[index].totalReviews -= 0;
      placePreviewList.refresh();
      change(placePreviewList, status: PageStatus.success());
    }
  }

  @override
  void updateBookmark(String placeId, bool isBookmarked) {
    int index =
        placePreviewList.indexWhere((element) => element.placeId == placeId);

    if (index >= 0) {
      placePreviewList[index].isBookmarked = isBookmarked;
      change(placePreviewList, status: PageStatus.success());
    }
  }
}
