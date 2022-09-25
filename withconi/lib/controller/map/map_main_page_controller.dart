import 'dart:async';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:withconi/configs/helpers/calculator.dart';
import 'package:withconi/configs/helpers/quick_sort.dart';
import 'package:withconi/data/model/abstract_class/place_type.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/ui/entities/location.dart';
import '../../configs/constants/enum.dart';
import '../../import_basic.dart';
import '../../ui/entities/custom_marker.dart';
import '../../ui/widgets/loading.dart';
import '../ui_helper/infinite_scroll.dart';

class MapMainPageController extends GetxController {
  Completer<NaverMapController> _controller = Completer();
  late NaverMapController mapController;
  final MapRepository _mapRepository = MapRepository();
  MapType mapType = MapType.Basic;
  Rxn<Position> currentPosition = Rxn<Position>();
  RxList<CustomMarker> placeMarkers = RxList<CustomMarker>();
  Rxn<CustomMarker> selectedMarker = Rxn<CustomMarker>();

  RxList<bool> selectedPlaceTypeList = [true, false, false].obs;
  RxBool showSelectedPlaceBottomSheet = false.obs;
  RxBool showPlaceListBottomSheet = true.obs;
  int _searchDistance = 3;
  bool mapInit = true;
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
  late LatLngClass _searchLatLng;
  late LatLngClass _currentLocation;
  late CameraPosition _currentCameraPosition;

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

  int get limit => _paginationFilter.value.limit!;
  int get _page => _paginationFilter.value.page!;

  Future<void> loadNextPage() async {
    _changePaginationFilter(_page + 1, limit);
    await _getPlacePreviewList(_paginationFilter.value);
  }

  Future<void> loadNewPage() async {
    _changePaginationFilter(1, limit);
    await _getPlacePreviewList(_paginationFilter.value);
  }

  @override
  onReady() async {
    super.onReady();

    selectedPlaceDragController.addListener(() {
      if (selectedPlaceDragController.size >= 0.75) {
        goToSelectedPlaceDetail(selectedPlace: selectedMarker.value!.place);
        Future.delayed(const Duration(milliseconds: 200),
            () => selectedPlaceDragController.jumpTo(240 / WcHeight));
        selectedPlaceScrollController.jumpTo(0.0);
      }
    });

    // ever(_paginationFilter, _getPlacePreviewList());
    ever(selectedMarker, onSelectedMarkerChanged);

    _addScrollListener(
        isLastPage: _lastPage,
        isLoading: _isLoading,
        onEndOfScroll: loadNextPage,
        scrollController: placeListScrollController.value);
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
    await _setSearchLatLng();
    if (mapInit) {
      await showLoading((() => loadNewPage()));

      mapInit = false;
    }
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }

  @override
  void onClose() {
    super.onClose();
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

  _setSearchLatLng() async {
    _searchLatLng = await mapController.getCameraPosition().then((value) =>
        LatLngClass(
            latitude: value.target.latitude,
            longitude: value.target.longitude));
  }

  sortPlaceByType() {
    List<CustomMarker> sortedMarkers = QuickSort().sortPlaceByType(
        placeMarkerList: placeMarkers.toList(),
        sortType: selectedSortType.value);
    placeMarkers.assignAll(sortedMarkers);
    placeMarkers.refresh();
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
    Get.toNamed(Routes.MAP_DETAIL, arguments: selectedPlace);
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
          animationDuration: 2);
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
    await _setSearchLatLng();
    await _calculateSeachArea();
    await loadNewPage();
    showResearchButton.value = false;
    showPlaceListBottomSheet.value = true;
    placePreviewListDragController.animateTo(0.40,
        duration: Duration(milliseconds: 200), curve: Curves.linear);

    if (_searchDistance >= 7) {
      mapController
          .moveCamera(CameraUpdate.scrollWithOptions(_searchLatLng, zoom: 12));
    }
  }

  _calculateSeachArea() async {
    double totalMeterPerPx = WcWidth * await mapController.getMeterPerPx();
    int totalKilometer = (totalMeterPerPx / 1000).round();
    if (totalKilometer >= 7) {
      _searchDistance = 7;
    } else if (totalKilometer <= 3) {
      _searchDistance = 3;
    } else {
      _searchDistance = totalKilometer;
    }
  }

  _getPlacePreviewList(PaginationFilter paginationFilter) async {
    // var zoomlevel =
    //     await mapController.getCameraPosition().then((value) => value.zoom);

    var previewListResult = await _mapRepository.getPlacePreviewList(
      paginationFilter: paginationFilter,
      baseLatLng: _searchLatLng,
      locType: selectedPlaceType.value,
      conimalType: selectedSpeciesType.value,
      diseaseType: selectedDiseaseType.value,
      keyword: _searchKeyword,
      distance: _searchDistance,
    );

    previewListResult.fold((l) => null, (previewList) async {
      if (previewList.isEmpty) {
        _lastPage.value = true;
      } else {
        await _addPlaceMarkers(placePreviewList: previewList);
        sortPlaceByType();
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

  Future<LatLngClass> determineCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition().then((value) =>
        LatLngClass(latitude: value.latitude, longitude: value.longitude));
  }

  searchPlace() {
    Get.toNamed(Routes.MAP_SEARCH);
  }

  goToNewReviewPage() {
    Get.toNamed(Routes.MAP_NEW_REVIEW, arguments: selectedMarker.value!.place);
  }
}
