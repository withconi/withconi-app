import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:withconi/data/model/abstract_class/store_type.dart';
import 'package:withconi/data/model/hospital_preview.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/ui/entities/location.dart';
import 'package:withconi/ui/pages/hospital/hospital_detail_page.dart';
import '../../configs/constants/enum.dart';
import '../../import_basic.dart';
import '../../ui/entities/custom_marker.dart';
import '../../ui/widgets/loading.dart';
import '../ui_helper/infinite_scroll.dart';

class HospitalMainPageController extends GetxController {
  final MapRepository _mapRepository = MapRepository();
  Rxn<Position> currentPosition = Rxn<Position>();
  RxList<CustomMarker> placeMarkers = RxList<CustomMarker>();
  Rxn<CustomMarker> selectedMarker = Rxn<CustomMarker>();
  late NaverMapController mapController;
  RxList<bool> selectedPlaceTypeList = [true, false, false].obs;
  RxBool showSelectedPlaceBottomSheet = false.obs;
  RxBool showPlaceListBottomSheet = true.obs;
  List<String> diseaseFilterList = ['심/혈관계', '신장', '선택안함'];
  List<String> conimalFilterList = ['심/혈관계', '신장'];
  RxBool onlyOpenPlace = false.obs;
  RxnString selectedDiseaseFilter = RxnString();
  RxnString selectedConimalFilter = RxnString();
  RxBool showResearchButton = false.obs;
  late LatLngClass _searchLatLng;
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
    limit: 15,
  ).obs;

  final RxBool _lastPage = false.obs;

  final RxBool _isLoading = false.obs;

  int get limit => _paginationFilter.value.limit!;
  int get _page => _paginationFilter.value.page!;

  void loadNextPage() => _changePaginationFilter(_page + 1, limit);
  void loadNewPage() => _changePaginationFilter(1, limit);
  bool mapInit = true;

  @override
  onInit() async {
    super.onInit();
    // currentPosition.value = await determinePosition();

    // myMarkers.add(
    //   CustomMarker.fromMyStores(
    //       HospitalPreview(
    //           locId: '2',
    //           name: '위드펫 동물병원',
    //           location: LatLngClass(
    //               latitude: 37.586949901681946, longitude: 127.10944751279918),
    //           address: '서울시 어저구',
    //           totalVisitingConimal: 12,
    //           phoneNumber: '123-12-1234',
    //           openingStatus: 'open',
    //           totalRecommend: 8),
    //       _onMarkerTap),
    // );

    // myMarkers.add(
    //   CustomMarker.fromMyStores(
    //       HospitalPreview(
    //           locId: '2',
    //           name: '위드펫 동물병원',
    //           location: LatLngClass(
    //               latitude: 37.586949901681946, longitude: 127.10944751279918),
    //           address: '서울시 어저구',
    //           totalVisitingConimal: 12,
    //           phoneNumber: '123-12-1234',
    //           openingStatus: 'open',
    //           totalRecommend: 8),
    //       _onMarkerTap),
    // );
    // myMarkers.add(
    //   CustomMarker.fromMyStores(
    //       HospitalPreview(
    //           locId: '2',
    //           name: '위드펫 동물병원',
    //           location: LatLngClass(
    //               latitude: 37.586949901681946, longitude: 127.10944751279918),
    //           address: '서울시 어저구',
    //           totalVisitingConimal: 12,
    //           phoneNumber: '123-12-1234',
    //           openingStatus: 'open',
    //           totalRecommend: 8),
    //       _onMarkerTap),
    // );
  }

  @override
  onReady() async {
    super.onReady();

    selectedPlaceDragController.addListener(() {
      print(selectedPlaceDragController.size);
      if (selectedPlaceDragController.size >= 0.75) {
        Get.to(HospitalDetailPage(),
            transition: Transition.fade, duration: Duration(milliseconds: 100));
        Future.delayed(const Duration(milliseconds: 100),
            () => selectedPlaceDragController.jumpTo(240 / WcHeight));
        selectedPlaceScrollController.jumpTo(0.0);
      }
    });

    ever(_paginationFilter, (_) => getPlacePreviewList());
    // debounce(likePostList (_)=> update)

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

  setSearchLatLng() async {
    _searchLatLng = await mapController.getCameraPosition().then((value) =>
        LatLngClass(
            latitude: value.target.latitude,
            longitude: value.target.longitude));
  }

  Future<void> _makePlaceMarkers(
      {required List<PlacePreviewType> placePreviewList}) async {
    placePreviewList.forEach((placePreview) {
      placeMarkers.add(
        CustomMarker.fromMyPlace(placePreview, _onMarkerTap),
      );
    });
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

  void onCameraChange(
      LatLng? latLng, CameraChangeReason changeReason, bool? isChanged) {
    if (changeReason == CameraChangeReason.gesture) {
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
      showResearchButton.value = true;
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

  onReSearchTap() async {
    placeMarkers.clear();
    _currentCameraPosition = await mapController.getCameraPosition();
    _searchLatLng = LatLngClass(
      latitude: _currentCameraPosition.target.latitude,
      longitude: _currentCameraPosition.target.longitude,
    );
    await getPlacePreviewList();
    showResearchButton.value = false;
    showPlaceListBottomSheet.value = true;
    placePreviewListDragController.animateTo(0.40,
        duration: Duration(milliseconds: 200), curve: Curves.linear);
  }

  getPlacePreviewList() async {
    var placePreviewListResult = await _mapRepository.getPlacePreviewList(
      paginationFilter: _paginationFilter.value,
      latLng: _searchLatLng,
      locType: _selectedPlaceType,
      diseaseType: _selectedDiseaseType,
      keyword: _searchKeyword,
    );

    placePreviewListResult.fold((l) => null, (r) async {
      await _makePlaceMarkers(placePreviewList: r.placeList);
      return;
    });
  }

  // getDistanceBetweenLocations(
  //     {required LocationClass currentLocation,
  //     required LocationClass storeLocation}) {
  //   double distanceInMeters = GeolocatorPlatform.instance.distanceBetween(
  //     currentLocation.latitude,
  //     currentLocation.longitude,
  //     storeLocation.latitude,
  //     storeLocation.longitude,
  //   );
  // }

  // /// Determine the current position of the device.
  // ///
  // /// When the location services are not enabled or permissions
  // /// are denied the `Future` will return an error.
  // Future<Position> determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition();
  // }
}
