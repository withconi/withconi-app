import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:withconi/configs/helpers/quick_sort.dart';
import 'package:withconi/data/model/abstract_class/place_type.dart';
import 'package:withconi/data/model/hospital_preview.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/ui/entities/location.dart';
import '../../configs/constants/enum.dart';
import '../../import_basic.dart';
import '../../ui/entities/custom_marker.dart';
import '../../ui/pages/map/map_detail_page.dart';
import '../../ui/widgets/loading.dart';
import '../ui_helper/infinite_scroll.dart';

class MapMainPageController extends GetxController {
  final MapRepository _mapRepository = MapRepository();
  MapType mapType = MapType.Basic;
  Rxn<Position> currentPosition = Rxn<Position>();
  RxList<CustomMarker> placeMarkers = RxList<CustomMarker>();
  Rxn<CustomMarker> selectedMarker = Rxn<CustomMarker>();
  late NaverMapController mapController;
  RxList<bool> selectedPlaceTypeList = [true, false, false].obs;
  RxBool showSelectedPlaceBottomSheet = false.obs;
  RxBool showPlaceListBottomSheet = true.obs;
  int distance = 1;
  List<String?> diseaseFilterList = [
    null,
    '심/혈관계',
    '신장',
  ];
  List<String?> conimalFilterList = [null, '고양이', '강아지'];
  RxBool onlyOpenPlace = false.obs;
  RxnString selectedDiseaseFilter = RxnString();
  RxnString selectedConimalFilter = RxnString();
  RxBool showResearchButton = false.obs;
  late LatLngClass _searchLatLng;
  late LatLngClass _currentLocation;
  late CameraPosition _currentCameraPosition;
  List<PlaceType?> placeTypeList = [
    null,
    PlaceType.hospital,
    PlaceType.pharmacy
  ];
  PlaceType? _selectedPlaceType;
  DiseaseType? _selectedDiseaseType;
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

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);
  void loadNewPage() => _changePaginationFilter(1, limit);
  bool mapInit = true;

  @override
  onReady() async {
    super.onReady();

    selectedPlaceDragController.addListener(() {
      if (selectedPlaceDragController.size >= 0.75) {
        goToPlaceDetail();
        Future.delayed(const Duration(milliseconds: 200),
            () => selectedPlaceDragController.jumpTo(240 / WcHeight));
        selectedPlaceScrollController.jumpTo(0.0);
      }
    });

    ever(_paginationFilter, (_) => _getPlacePreviewList());

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
      await showLoading((() => _getPlacePreviewList()));
      mapInit = false;
    }
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

  Future<void> _makePlaceMarkers(
      {required List<PlacePreviewType> placePreviewList}) async {
    _currentLocation = await determineCurrentLocation();
    placePreviewList.forEach((placePreview) {
      placeMarkers.add(
        CustomMarker.fromMyPlace(
            place: placePreview,
            distance: _getMeterDistanceBetween(
                baseLocation: _currentLocation,
                placeLocation: placePreview.location),
            onTapMarker: _onMarkerTap),
      );
    });

    List<CustomMarker> sortedMarkers = await QuickSort()
        .sortPlaceListByDistance(placeMarkerList: placeMarkers.toList());
    placeMarkers.assignAll(sortedMarkers);

    for (CustomMarker customMarker in placeMarkers) {
      await customMarker.setImageIcon();
    }
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

    placeMarkers.refresh();
  }

  goToPlaceDetail() {
    Get.toNamed(
      Routes.MAP_DETAIL,
    );
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

  Future<void> _onMarkerTap(Marker? marker, Map<String, int?> iconSize) async {
    // onTapMarker(markerId: marker!.markerId);

    await mapController.moveCamera(CameraUpdate.scrollTo(marker!.position!),
        animationDuration: 2);
    placeMarkers.forEach((customMarker) async {
      if (customMarker.place.locId == marker.markerId) {
        selectedMarker.value = customMarker;
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
    });

    showSelectedPlaceBottomSheet.value = true;
    showPlaceListBottomSheet.value = false;
    showResearchButton.value = false;
    placeMarkers.refresh();
  }

  onSearchRefreshTap() async {
    // placeMarkers.clear();
    // await _setSearchLatLng();
    // await _getPlacePreviewList();
    // showResearchButton.value = false;
    // showPlaceListBottomSheet.value = true;
    // placePreviewListDragController.animateTo(0.40,
    //     duration: Duration(milliseconds: 200), curve: Curves.linear);
    // mapController
    //     .moveCamera(CameraUpdate.scrollWithOptions(_searchLatLng, zoom: 13));

    Get.toNamed(Routes.MAP_DETAIL);
  }

  _getPlacePreviewList() async {
    var zoomlevel =
        await mapController.getCameraPosition().then((value) => value.zoom);
    print(zoomlevel);
    print(await mapController.getSize());

    var previewListResult = await _mapRepository.getPlacePreviewList(
      paginationFilter: _paginationFilter.value,
      latLng: _searchLatLng,
      locType: _selectedPlaceType,
      diseaseType: _selectedDiseaseType,
      keyword: _searchKeyword,
    );

    previewListResult.fold((l) => null, (previewList) async {
      if (previewList.isEmpty) {
        _lastPage.value = true;
      } else {
        await _makePlaceMarkers(placePreviewList: previewList);
      }
      return;
    });
  }

  String getDistanceString({required LatLngClass placeLocation}) {
    String distanceResult = '';

    double distanceMeters = _getMeterDistanceBetween(
        baseLocation: _currentLocation, placeLocation: placeLocation);
    List<String> suffixes = ['m', 'km'];
    if (distanceMeters < 1000) {
      String metersString = distanceMeters.floor().toString() + suffixes[0];
      distanceResult = metersString;
    } else {
      String kilometersString =
          (distanceMeters / 1000).toStringAsFixed(1) + suffixes[1];
      distanceResult = kilometersString;
    }

    return distanceResult;
  }

  double _getMeterDistanceBetween(
      {required LatLngClass baseLocation, required LatLngClass placeLocation}) {
    double distanceMeters = GeolocatorPlatform.instance.distanceBetween(
      baseLocation.latitude,
      baseLocation.longitude,
      placeLocation.latitude,
      placeLocation.longitude,
    );

    return distanceMeters;
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
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition().then((value) =>
        LatLngClass(latitude: value.latitude, longitude: value.longitude));
  }
}
