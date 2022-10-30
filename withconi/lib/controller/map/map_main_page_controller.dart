import 'dart:async';
import 'package:app_settings/app_settings.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:withconi/core/tools/helpers/calculator.dart';
import 'package:withconi/core/tools/helpers/quick_sort.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/model/abstract_class/place_preview.dart';
import 'package:withconi/data/model/hospital_preview.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/module/ui_model/location.dart';
import 'package:withconi/module/pages/map/map_location_permission_page.dart';
import '../../data/enums/enum.dart';
import '../../core/error_handling/failures.dart';
import '../../import_basic.dart';
import '../../module/ui_model/custom_marker.dart';
import '../../module/widgets/loading/loading_overlay.dart';
import '../ui_helper/infinite_scroll.dart';

class MapMainPageController extends GetxController {
  static MapMainPageController get to => Get.find(tag: "Initial");
  RxBool hasLocationPermission = false.obs;
  late String _userId;
  Completer<NaverMapController> _controller = Completer();
  late NaverMapController mapController;
  final MapRepository _mapRepository = MapRepository();
  MapType mapType = MapType.Basic;
  Rxn<Position> currentPosition = Rxn<Position>();
  RxList<CustomMarker> placeMarkers = RxList<CustomMarker>();
  Rxn<CustomMarker> selectedMarker = Rxn<CustomMarker>();
  Rxn<Marker> myLocationMarker = Rxn<Marker>();

  RxList<bool> selectedPlaceTypeList = [true, false, false].obs;
  RxBool showSelectedPlaceBottomSheet = false.obs;
  RxBool showPlaceListBottomSheet = true.obs;
  int _searchDistance = 3;
  bool mapInit = true;
  Rx<LocationType> selectedLocationType = LocationType.currentLocation.obs;
  List<LocationType> locationTypeList = [
    LocationType.currentLocation,
    LocationType.mapLocation,
  ];
  List<PlaceType> placeTypeList = [
    PlaceType.all,
    PlaceType.hospital,
    PlaceType.pharmacy
  ];
  List<DiseaseType?> diseaseFilterList = [
    null,
    DiseaseType.cardiovascular,
    DiseaseType.digestive,
    DiseaseType.musculoskeletal,
    DiseaseType.ophthalmology,
    DiseaseType.respiratory,
    DiseaseType.urinary,
  ];
  List<Species?> speciesFilterList = [null, Species.cat, Species.dog];
  List<SortType> sortTypeList = [SortType.visiting, SortType.nearest];
  RxBool onlyOpenPlace = false.obs;
  Rx<SortType> selectedSortType = SortType.nearest.obs;
  RxBool showResearchButton = false.obs;
  late LatLngClass _searchBaseLocation;
  LatLngClass? _currentLocation;
  // late CameraPosition _currentCameraPosition;

  Rx<PlaceType> selectedPlaceType = PlaceType.all.obs;
  Rxn<DiseaseType> selectedDiseaseType = Rxn<DiseaseType>();
  Rxn<Species> selectedSpeciesType = Rxn<Species>();
  Rxn<OpeningStatus> selectedOpeningStatus = Rxn<OpeningStatus>();
  String? _searchKeyword;

  DraggableScrollableController selectedPlaceDragController =
      DraggableScrollableController();

  DraggableScrollableController placePreviewListDragController =
      DraggableScrollableController();

  Rx<ScrollController> placeListScrollController = ScrollController().obs;

  ScrollController selectedPlaceScrollController = ScrollController();

  final Rx<PaginationFilter> _paginationFilter = PaginationFilter(
    page: 1,
    limit: 5,
  ).obs;

  final RxBool _lastPage = false.obs;
  final RxBool _isLoading = false.obs;

  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;

  Future<void> loadNextPage() async {
    _changePaginationFilter(_page + 1, limit);
    await _getPlacePreviewList(_paginationFilter.value);
  }

  Future<void> loadNewPage() async {
    _changePaginationFilter(1, limit);
    await _getPlacePreviewList(_paginationFilter.value);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    _userId = AuthController.to.wcUser.value!.uid;
  }

  @override
  onReady() async {
    super.onReady();

    if (await setPermissionStatus()) {
      _setSearchBaseLocation(locationSearchType: selectedLocationType.value);
    }

    selectedPlaceDragController.addListener(() {
      if (selectedPlaceDragController.size >= 0.75) {
        PlacePreview placePreview = selectedMarker.value!.place;
        goToSelectedPlaceDetail(selectedPlace: placePreview);
        Future.delayed(const Duration(milliseconds: 200),
            () => selectedPlaceDragController.jumpTo(240 / WcHeight));
        selectedPlaceScrollController.jumpTo(0.0);
      }
    });

    ever(selectedMarker, onSelectedMarkerChanged);

    _addScrollListener(
        isLastPage: _lastPage,
        isLoading: _isLoading,
        onEndOfScroll: loadNextPage,
        scrollController: placeListScrollController.value);
  }

  @override
  onClose() {
    super.onClose();
    selectedPlaceDragController.dispose();
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

  Future<void> onMapCreated(NaverMapController controller) async {
    mapController = controller;

    if (_currentLocation != null) {
      if (mapInit) {
        await showLoading((() => loadNewPage()));
        mapInit = false;
      }
    }
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }

  void changeTotalPerPage(int limitValue) {
    placeMarkers.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  Future<bool> _setSearchBaseLocation(
      {required LocationType locationSearchType}) async {
    bool success = false;

    await _setCurrentLocation();
    if (_currentLocation != null) {
      switch (locationSearchType) {
        case LocationType.mapLocation:
          _searchBaseLocation = await mapController.getCameraPosition().then(
              (value) => LatLngClass(
                  latitude: value.target.latitude,
                  longitude: value.target.longitude));
          break;
        case LocationType.currentLocation:
          _searchBaseLocation = _currentLocation!;
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
  }

  onSortTypeChanged() {
    List<CustomMarker> sortedMarkers = QuickSort().sortPlaceByType(
        placeMarkerList: placeMarkers.toList(),
        sortType: selectedSortType.value);
    placeMarkers.assignAll(sortedMarkers);
    placeMarkers.refresh();
  }

  onBaseLocationChanged() {
    showLoading(() => getNewPlaceList());
  }

  Future<void> _addPlaceMarkers(
      {required List<PlacePreview> placePreviewList}) async {
    placePreviewList.forEach((placePreview) {
      placeMarkers.add(
        CustomMarker.fromMyPlace(
            place: placePreview, onTapMarker: _onMarkerTap),
      );
    });

    for (CustomMarker customMarker in placeMarkers) {
      print(customMarker.place.unselectedMarkerImage);
      await customMarker.setImageIcon();
    }
    placeMarkers.refresh();
  }

  Future<CustomMarker> _makeSingleMarker(
      {required PlacePreview placePreview}) async {
    CustomMarker newCustomMarker = CustomMarker.fromMyPlace(
        place: placePreview, onTapMarker: _onMarkerTap);

    await newCustomMarker.setImageIcon();

    return newCustomMarker;
  }

  void onMapTap(LatLng latLng) {
    placeMarkers.forEach((customMarker) async {
      if (customMarker == selectedMarker.value) {
        await customMarker.setImageIcon(
            assetName: customMarker.place.unselectedMarkerImage,
            iconHeight: 30,
            iconWidth: 30);
        selectedMarker.value = null;
        return;
      }
    });
    showSelectedPlaceBottomSheet.value = false;
    showPlaceListBottomSheet.value = true;
    placeMarkers.refresh();
  }

  void goToSelectedPlaceDetail({required PlacePreview selectedPlace}) {
    Get.toNamed(Routes.MAP_DETAIL, arguments: selectedPlace.locId);
  }

  void onCameraChange(
      LatLng? latLng, CameraChangeReason changeReason, bool? isChanged) {
    if (changeReason == CameraChangeReason.gesture &&
        selectedMarker.value == null) {
      showResearchButton.value = true;
      showPlaceListBottomSheet.value = true;
      placeMarkers.refresh();
    }
  }

  onSelectedDiseaseTypeChanged(Object? item) async {
    selectedDiseaseType.value = item as DiseaseType?;
    onSearchRefreshTap();
  }

  onSelectedSpeciesTypeChanged(Object? item) async {
    selectedSpeciesType.value = item as Species?;
    onSearchRefreshTap();
  }

  onSelectedPlaceTypeChanged(Object? item) async {
    selectedPlaceType.value = item as PlaceType;
    onSearchRefreshTap();
  }

  onOpeningStatusTypeChanged() async {
    onlyOpenPlace.value = !onlyOpenPlace.value;
    onSearchRefreshTap();
  }

  Future<void> _onMarkerTap(Marker? marker, Map<String, int?> iconSize) async {
    for (CustomMarker customMarker in placeMarkers) {
      if (customMarker.place.locId == marker!.markerId) {
        selectedMarker.value = customMarker;
      }
    }
  }

  onSelectedMarkerChanged(CustomMarker? selectedMarker) async {
    if (selectedMarker != null) {
      await mapController.moveCamera(
          CameraUpdate.scrollTo(selectedMarker.position!),
          animationDuration: 100);
      for (CustomMarker customMarker in placeMarkers) {
        if (customMarker.place.locId == selectedMarker.markerId) {
          await customMarker.setImageIcon(
              assetName: customMarker.place.selectedMarkerImage,
              iconHeight: 49,
              iconWidth: 35);
        } else {
          await customMarker.setImageIcon(
              assetName: customMarker.place.unselectedMarkerImage,
              iconHeight: 30,
              iconWidth: 30);
        }
      }

      showSelectedPlaceBottomSheet.value = true;
      showPlaceListBottomSheet.value = false;
      showResearchButton.value = false;
      placeMarkers.refresh();
    }
  }

  onSearchRefreshTap() async {
    showLoading(() => getNewPlaceList());
  }

  getNewPlaceList() async {
    placeMarkers.clear();
    bool setBaseLocationSucceed = await _setSearchBaseLocation(
        locationSearchType: selectedLocationType.value);
    if (setBaseLocationSucceed) {
      await _setSearchDistance();
      await loadNewPage();
      showResearchButton.value = false;
      showPlaceListBottomSheet.value = true;
      placePreviewListDragController.animateTo(0.40,
          duration: Duration(milliseconds: 200), curve: Curves.linear);

      if (_searchDistance >= 7) {
        mapController.moveCamera(
            CameraUpdate.scrollWithOptions(_searchBaseLocation, zoom: 12));
      }
    } else {
      Get.toNamed(Routes.MAP_LOCATION_PERMISSION);
    }
  }

  _setSearchDistance() async {
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

  _getPlacePreviewList(PaginationFilter paginationFilter) async {
    // var zoomlevel =
    //     await mapController.getCameraPosition().then((value) => value.zoom);

    var previewListResult = await _mapRepository.getPlacePreviewList(
      paginationFilter: paginationFilter,
      baseLatLng: _searchBaseLocation,
      locType: selectedPlaceType.value,
      conimalType: selectedSpeciesType.value,
      diseaseType: selectedDiseaseType.value,
      keyword: _searchKeyword,
      distance: _searchDistance,
    );

    previewListResult.fold((l) => null, (previewResponse) async {
      if (previewResponse.placeList.isEmpty) {
        _lastPage.value = true;
      } else {
        await _addPlaceMarkers(placePreviewList: previewResponse.placeList);
        onSortTypeChanged();
      }
      return;
    });
  }

  String getDistanceToString({required double distanceMeter}) {
    String distanceResult = '';

    distanceResult =
        DistanceCalculator().getDistanceToString(distanceMeter: distanceMeter);
    return distanceResult;
  }

  Future<LatLngClass> _getCurrentLocation() async {
    return await Geolocator.getCurrentPosition().then((value) =>
        LatLngClass(latitude: value.latitude, longitude: value.longitude));
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
    PlacePreview? searchedPlacePreview =
        await Get.toNamed(Routes.MAP_SEARCH) as PlacePreview?;
    if (searchedPlacePreview != null) {
      Get.toNamed(Routes.MAP_DETAIL, arguments: searchedPlacePreview.locId);
    }
  }

  goToNewReviewPage() {
    Get.toNamed(Routes.MAP_NEW_REVIEW,
        arguments: selectedMarker.value!.place.locId);
  }
}
