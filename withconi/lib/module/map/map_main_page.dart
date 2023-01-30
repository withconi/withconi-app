import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/repository/map_repository.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/common/my_lazy_load_scroll_view.dart';
import 'package:withconi/module/community/controllers/custom_state_mixin.dart';
import 'package:withconi/module/map/widgets/place_list_show_button.dart';
import 'package:withconi/module/ui_model/dropdown_data_ui_model.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';
import '../page_status.dart';
import 'controllers/map_main_page_controller.dart';
import '../theme/text_theme.dart';
import '../../global_widgets/searchbar/search_bar.dart';
import 'widgets/opening_status_text.dart';
import 'widgets/phone_button.dart';
import 'widgets/place_toggle_button.dart';
import 'widgets/search_refresh_button.dart';

class MapMainPage extends StatelessWidget {
  const MapMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapMainPageController _controller = Get.find();

    final double safeAreaPaddingTop =
        MediaQuery.of(context).viewPadding.top + 8;

    return Scaffold(
        backgroundColor: Colors.white,
        body: _controller.obx(
          onSuccess: (state) => Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                MyNaverMapView(
                  searchAreaCircleRadius:
                      _controller.searchAreaCircleRadius.value,
                  baseSearchLocation: _controller.baseLocation.value,
                  onCameraChange: _controller.onCameraChange,
                  onMapCreated: _controller.onMapCreated,
                  onMapTap: _controller.onMapTap,
                  placeMarkers: _controller.placeMarkers,
                  isCurrentLocationValid:
                      _controller.isCurrentLocationValid.value,
                ),
                Positioned(
                  top: safeAreaPaddingTop,
                  left: 11,
                  child: Center(
                    child: SearchBarWidget(
                      width: WcWidth(context) - 40 - 40,
                      onTextChanged: (_) {},
                      onTapClear: () {},
                      textController: null,
                      hintText: '동물병원/약국 검색',
                      isEditable: false,
                      onTextFieldTapped: _controller.goToSearchPlacePage,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(50, 0, 0, 0),
                          spreadRadius: -1,
                          blurRadius: 5,
                          offset: Offset(0, 1),
                        ),
                      ],
                      activeAction: false,
                    ),
                  ),
                ),
                Positioned(
                  top: safeAreaPaddingTop + 50,
                  left: 11,
                  child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: WcColors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(50, 0, 0, 0),
                            spreadRadius: -1,
                            blurRadius: 5,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Obx(
                        () => PlaceTypeToggleButton(
                          onPressed: _controller.onPlaceTypeChanged,
                          placeTypeList: PlaceType.values,
                          selectedPlaceType:
                              _controller.selectedPlaceType.value,
                        ),
                      )),
                ),
                Positioned(
                  right: 10,
                  top: safeAreaPaddingTop,
                  child: GestureDetector(
                    onTap: _controller.goToMyReviewPage,
                    child: Container(
                        width: 47,
                        height: 47,
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: WcColors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: WcColors.grey120,
                                  blurRadius: 5,
                                  offset: Offset(0, 1),
                                  spreadRadius: -1)
                            ]),
                        child: const Icon(
                          Icons.rate_review_rounded,
                          color: WcColors.blue100,
                        )),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: safeAreaPaddingTop + 50,
                  child: GestureDetector(
                    onTap: _controller.goToBookmarkPage,
                    child: Container(
                      width: 47,
                      height: 47,
                      padding: const EdgeInsets.all(12.3),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: WcColors.white,
                          boxShadow: [
                            BoxShadow(
                                color: WcColors.grey120,
                                blurRadius: 5,
                                offset: Offset(0, 1),
                                spreadRadius: -1)
                          ]),
                      child: SvgPicture.asset(
                        'assets/icons/bookmark.svg',
                        height: 20,
                        color: WcColors.blue100,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                      visible: (_controller.showRefreshButton.value ||
                          _controller.status == const PageStatus.init()),
                      child: Positioned(
                        top: safeAreaPaddingTop + 108,
                        child: SearchRefreshButton(
                          onTap: () async {
                            await _controller.onSearchRefreshTap();
                          },
                        ),
                      )),
                ),
                Obx(
                  () => Visibility(
                    visible: (_controller.showPlaceListBottomSheet.value),
                    child: DraggableScrollableSheet(
                        initialChildSize: 225 / WcHeight(context),
                        minChildSize: 88 / WcHeight(context),
                        maxChildSize: 1,
                        controller: _controller.placeListDragController,
                        builder: (BuildContext context, scrollController) {
                          _controller.placeListScrollController =
                              scrollController;

                          return MyLazyLoadScrollView(
                            isLoading: (_controller.status !=
                                const PageStatus.success()),
                            onEndOfPage: _controller.loadNextPage,
                            child: SingleChildScrollView(
                              controller: _controller.placeListScrollController,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  MyLocationButton(
                                    onTap:
                                        _controller.onCurrentLocationButtonTap,
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      minHeight: WcHeight(context),
                                    ),
                                    decoration: const BoxDecoration(
                                        color: WcColors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: WcColors.grey120,
                                              blurRadius: 10,
                                              offset: Offset(0, 2),
                                              spreadRadius: -5)
                                        ]),
                                    child: Column(
                                      children: [
                                        const DraggableIndicator(),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 13),
                                                child: Row(
                                                  children: [
                                                    Obx(
                                                      () =>
                                                          CustomDropdownButton(
                                                              minButtonWidth:
                                                                  120,
                                                              maxButtonWidth:
                                                                  140,
                                                              dropdownList: DiseaseType
                                                                  .values
                                                                  .where((e) =>
                                                                      e !=
                                                                      DiseaseType
                                                                          .undefined)
                                                                  .map(
                                                                      (diseaseType) {
                                                                return DropdownDataUIModel(
                                                                    value: (diseaseType ==
                                                                            DiseaseType
                                                                                .all)
                                                                        ? null
                                                                        : diseaseType,
                                                                    text: diseaseType
                                                                        .displayName);
                                                              }).toList(),
                                                              hintText:
                                                                  '질환별 방문 많은',
                                                              selectedValue: DropdownDataUIModel(
                                                                  text:
                                                                      '질환별 방문 많은',
                                                                  value: _controller
                                                                      .selectedDiseaseType
                                                                      .value),
                                                              onValueChanged:
                                                                  _controller
                                                                      .onDiseaseTypeChanged),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Obx(
                                                      () =>
                                                          CustomDropdownButton(
                                                        minButtonWidth: 115,
                                                        maxButtonWidth: 140,
                                                        dropdownList: Species
                                                            .values
                                                            .map((species) => DropdownDataUIModel(
                                                                value: (species ==
                                                                        Species
                                                                            .all)
                                                                    ? null
                                                                    : species,
                                                                text: species
                                                                    .displayName))
                                                            .toList(),
                                                        hintText: '품종별 많이 찾는',
                                                        selectedValue:
                                                            DropdownDataUIModel(
                                                                text:
                                                                    '품종별 많이 찾는',
                                                                value: _controller
                                                                    .selectedSpeciesType
                                                                    .value),
                                                        onValueChanged: _controller
                                                            .onSpeciesTypeChanged,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Obx(
                                                      () => OpeningStatusButton(
                                                        openingStatus: _controller
                                                            .selectedOpeningStatus
                                                            .value,
                                                        onTap: _controller
                                                            .onOpeningStatusTypeChanged,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 13,
                                        ),
                                        const Divider(
                                            height: 1,
                                            thickness: 1,
                                            color: WcColors.grey60),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Obx(
                                              () => Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: CustomDropdownButton(
                                                  minButtonWidth: 130,
                                                  maxButtonWidth: 160,
                                                  selectedButtonColor:
                                                      WcColors.white,
                                                  selectedTextColor:
                                                      WcColors.black,
                                                  dropdownList: DistanceBaseType
                                                      .values
                                                      .map((distanceBaseType) =>
                                                          DropdownDataUIModel(
                                                              value:
                                                                  distanceBaseType,
                                                              text: distanceBaseType
                                                                  .displayName))
                                                      .toList(),
                                                  hintText: '',
                                                  selectedValue: DropdownDataUIModel(
                                                      text: _controller
                                                          .selectedDistanceBaseType
                                                          .value
                                                          .displayName,
                                                      value: _controller
                                                          .selectedDistanceBaseType
                                                          .value),
                                                  onValueChanged: (item) {
                                                    _controller
                                                        .onDistanceBaseTypeChanged(item
                                                            as DistanceBaseType);
                                                  },
                                                ),
                                              ),
                                            ),
                                            Obx(
                                              () => Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: CustomDropdownButton(
                                                  minButtonWidth: 80,
                                                  maxButtonWidth: 140,
                                                  buttonPadding:
                                                      const EdgeInsets.only(
                                                          left: 3, right: 0),
                                                  selectedButtonColor:
                                                      WcColors.white,
                                                  selectedTextColor:
                                                      WcColors.black,
                                                  dropdownList: Sorting.values
                                                      .map((sortType) =>
                                                          DropdownDataUIModel(
                                                              value: sortType,
                                                              text: sortType
                                                                  .displayName))
                                                      .toList(),
                                                  hintText: '',
                                                  selectedValue:
                                                      DropdownDataUIModel(
                                                          text: _controller
                                                              .selectedSorting
                                                              .value
                                                              .displayName,
                                                          value: _controller
                                                              .selectedSorting
                                                              .value),
                                                  onValueChanged: (item) {
                                                    _controller
                                                        .onSortTypeChanged(
                                                            item as Sorting);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Obx(() => (state == null ||
                                                state.isEmpty)
                                            ? EmptyPlaceListWidget()
                                            : Column(
                                                children: [
                                                  ListView.builder(
                                                      cacheExtent: 900,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      itemCount: _controller
                                                          .placePreviewList
                                                          .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return PlacePreviewListTile(
                                                          distanceString: _controller
                                                              .placePreviewList[
                                                                  index]
                                                              .distanceString(
                                                                  _controller
                                                                      .baseLocation
                                                                      .value),
                                                          isFirstList:
                                                              (index == 0),
                                                          place: _controller
                                                                  .placePreviewList[
                                                              index],
                                                          onTap:
                                                              (PlacePreviewUIModel
                                                                  placePreview) {
                                                            _controller
                                                                .setSelectedPlacePreview(
                                                                    placePreview
                                                                        .placeId);
                                                          },
                                                        );
                                                      }),
                                                  (_controller.status ==
                                                          const PageStatus
                                                              .loadingMore())
                                                      ? Container(
                                                          color: WcColors.white,
                                                          width:
                                                              WcWidth(context),
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 50),
                                                          child: const Center(
                                                            child: SizedBox(
                                                              width: 20,
                                                              height: 20,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                strokeWidth: 3,
                                                                color: WcColors
                                                                    .grey100,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : const SizedBox.shrink()
                                                ],
                                              )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: (_controller.selectedPlacePreview.value != null),
                    child: DraggableScrollableSheet(
                        controller: _controller.selectedPlaceDragController,
                        minChildSize: 250 / WcHeight(context),
                        initialChildSize: 250 / WcHeight(context),
                        maxChildSize: 0.8,
                        // snap: true,
                        // snapSizes: [250 / WcHeight(context), 0.8],
                        builder: (BuildContext context, scrollController) {
                          _controller.selectedPlaceScrollController =
                              scrollController;

                          return SingleChildScrollView(
                            controller:
                                _controller.selectedPlaceScrollController,
                            child: SelectedPlacePreview(
                              distanceString: _controller
                                  .selectedPlacePreview.value!
                                  .distanceString(
                                      _controller.baseLocation.value),
                              onReviewTap: _controller.newPlaceReviewPage,
                              onTap: _controller.goToSelectedPlaceDetail,
                              place: _controller.selectedPlacePreview.value!,
                            ),
                          );
                        }),
                  ),
                ),
                Obx(
                  () => Visibility(
                      visible: _controller.showMapButton.value,
                      child: Positioned(
                        bottom: 25,
                        child: MapShowButton(
                          onTap: _controller.onShowMapButtonTap,
                          // onTap: _controller.searchRefresh,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}

class MyNaverMapView extends StatelessWidget {
  MyNaverMapView({
    Key? key,
    this.onCameraChange,
    this.onMapTap,
    this.placeMarkers,
    required this.onMapCreated,
    this.initialCameraPosition,
    required this.baseSearchLocation,
    required this.isCurrentLocationValid,
    this.searchAreaCircleRadius = 0,
  }) : super(key: key);

  final Function(LatLng?, CameraChangeReason, bool?)? onCameraChange;
  final Function(LatLng?)? onMapTap;
  final List<Marker>? placeMarkers;
  final Function(NaverMapController) onMapCreated;
  final CameraPosition? initialCameraPosition;
  final LatLngUIModel baseSearchLocation;
  final double searchAreaCircleRadius;
  final bool isCurrentLocationValid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WcWidth(context),
      height: WcHeight(context),
      child: NaverMap(
        // useSurface: kReleaseMode,
        initialCameraPosition: initialCameraPosition,
        onMapCreated: onMapCreated,
        mapType: MapType.Basic,
        locationButtonEnable: false,
        initLocationTrackingMode: (isCurrentLocationValid)
            ? LocationTrackingMode.Follow
            : LocationTrackingMode.None,
        markers: placeMarkers ?? [],
        onMapTap: onMapTap,
        logoClickEnabled: false,
        onCameraChange: onCameraChange,
      ),
    );
  }
}

class EmptyPlaceListWidget extends StatelessWidget {
  EmptyPlaceListWidget({
    Key? key,
    this.message,
    this.title,
  }) : super(key: key);

  String? title;
  String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WcWidth(context),
      height: 210,
      decoration: BoxDecoration(color: WcColors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/location_grey.svg',
            color: WcColors.grey100,
            height: 33,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title ?? '해당하는 장소가 없어요',
            style: const TextStyle(
                fontFamily: WcFontFamily.notoSans,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.5,
                color: WcColors.grey120),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            message ?? '다른 필터로 검색해주세요 :)',
            style: const TextStyle(
                fontFamily: WcFontFamily.notoSans,
                fontSize: 15,
                height: 1.4,
                color: WcColors.grey120),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class LocationPermissionWidget extends StatelessWidget {
  const LocationPermissionWidget({
    Key? key,
    required MapMainPageController controller,
  })  : _controller = controller,
        super(key: key);

  final MapMainPageController _controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: WcHeight(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 75,
              ),
              SizedBox(
                width: 60,
                child: Image.asset(
                  'assets/icons/hospital_clicked.png',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text('위치정보 권한이\n필요해요',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 25,
                      fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 45,
              ),
              const Text('정확한 정보를 위해\n위치정보가 반드시 필요해요.\n설정에서 위치정보 권한을 허용해주세요 :)',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 15,
                      color: WcColors.grey140,
                      fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 10,
              ),
              const Text('설정 > 위치 > 앱을 사용하는 동안',
                  style: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      fontSize: 15,
                      color: WcColors.grey200,
                      fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 50,
              ),
              WcWideButtonWidget(
                active: true,
                activeButtonColor: WcColors.blue100,
                activeTextColor: WcColors.white,
                buttonText: '위치정보 권한 설정하기',
                buttonWidth: WcWidth(context) - 40,
                onTap: _controller.openAppLocationSetting,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLocationButton extends StatelessWidget {
  MyLocationButton({
    Key? key,
    this.onTap,
  }) : super(key: key);
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 15, 10),
          padding: const EdgeInsets.all(9),

          // padding: EdgeInsets.all(9),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: WcColors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(81, 22, 22, 22),
                    blurRadius: 15,
                    offset: Offset(0, 2),
                    spreadRadius: -3)
              ]),
          child: const Icon(
            Icons.my_location_rounded,
            size: 24,
            color: WcColors.grey180,
          )),
    );
  }
}

class OpeningStatusButton extends StatelessWidget {
  OpeningStatusButton({
    Key? key,
    required this.openingStatus,
    required this.onTap,
  }) : super(key: key);
  OpeningStatus openingStatus;
  void Function(OpeningStatus) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (openingStatus == OpeningStatus.open) {
          onTap.call(OpeningStatus.all);
        } else {
          onTap.call(OpeningStatus.open);
        }
      },
      child: Container(
        height: 35,
        width: 78,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: (openingStatus == OpeningStatus.open)
                ? WcColors.blue100
                : WcColors.grey60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/clock.svg',
                height: 15,
                color: (openingStatus == OpeningStatus.open)
                    ? WcColors.white
                    : WcColors.grey100),
            SizedBox(
              width: 4,
            ),
            Text('진료 중',
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    color: (openingStatus == OpeningStatus.open)
                        ? WcColors.white
                        : WcColors.grey200,
                    height: 1,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.5)),
            SizedBox(
              width: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdownButton<T> extends StatelessWidget {
  CustomDropdownButton(
      {Key? key,
      // required MapMainPageController controller,
      required this.hintText,
      required this.dropdownList,
      required this.selectedValue,
      required this.onValueChanged,
      required this.minButtonWidth,
      required this.maxButtonWidth,
      this.buttonWidth = 139,
      this.buttonHeight = 35,
      this.selectedButtonColor,
      this.buttonPadding,
      this.selectedTextColor})
      : super(key: key);

  String hintText;
  List<DropdownDataUIModel<T>> dropdownList = [];
  DropdownDataUIModel<T> selectedValue;

  void Function(Object?)? onValueChanged;
  double buttonWidth;
  Color? selectedButtonColor;
  Color? selectedTextColor;
  double buttonHeight;
  EdgeInsetsGeometry? buttonPadding;
  double minButtonWidth;
  double maxButtonWidth;

  @override
  Widget build(BuildContext context) {
    if (selectedValue.value == null) {
      buttonWidth = hintText.length * 16;
    } else {
      buttonWidth = selectedValue.text.length * 16.5;
    }
    if (buttonWidth < minButtonWidth) {
      buttonWidth = minButtonWidth;
    } else if (buttonWidth > maxButtonWidth && buttonWidth > minButtonWidth) {
      buttonWidth = maxButtonWidth;
    }

    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        // dropdownElevation: 2,
        // scrollbarThickness: 2,

        scrollbarAlwaysShow: true,
        selectedItemBuilder: (context) => dropdownList
            .map(
              (dropdownItem) => Container(
                padding: EdgeInsets.only(right: 5),
                alignment: Alignment.centerLeft,
                height: 35,
                child: Text(
                    (selectedValue.value == null)
                        ? hintText
                        : dropdownItem.text,
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        color: (selectedValue.value == null)
                            ? WcColors.grey200
                            : selectedTextColor ?? WcColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.5)),
              ),
            )
            .toList(),
        selectedItemHighlightColor: WcColors.grey40,
        buttonDecoration: BoxDecoration(
            color: (selectedValue.value != null)
                ? selectedButtonColor ?? WcColors.blue100
                : WcColors.grey60,
            borderRadius: BorderRadius.circular(5)),
        dropdownPadding: EdgeInsets.symmetric(vertical: 0),
        buttonPadding:
            buttonPadding ?? const EdgeInsets.only(left: 10, right: 8),
        dropdownDecoration:
            const BoxDecoration(color: WcColors.white, boxShadow: [
          BoxShadow(
              color: Color.fromARGB(69, 124, 124, 124),
              blurRadius: 8,
              offset: Offset(
                0.0, // Move to right 10  horizontally
                8.0,
              )),
        ]),
        icon: SvgPicture.asset(
          'assets/icons/arrow_down.svg',
          color: (selectedValue.value != null)
              ? selectedTextColor ?? WcColors.white
              : WcColors.grey160,
        ),
        isExpanded: true,
        alignment: Alignment.centerLeft,
        items: dropdownList
            .map((dropdownItem) => DropdownMenuItem<T>(
                  value: dropdownItem.value,
                  child: SizedBox(
                      child: Row(
                    children: [
                      Text(
                        (dropdownItem.value == null) ? '전체' : dropdownItem.text,
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            color: WcColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.3),
                      ),
                    ],
                  )),
                ))
            .toList(),
        value: selectedValue.value,
        onChanged: onValueChanged,
        buttonHeight: buttonHeight,
        buttonWidth: buttonWidth,

        dropdownMaxHeight: 250,
        dropdownWidth: buttonWidth + 28,
        itemHeight: 45,
      ),
    );
  }
}

class DraggableIndicator extends StatelessWidget {
  const DraggableIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: WcColors.grey80,
      ),
      margin: EdgeInsets.only(top: 12, bottom: 13),
    );
  }
}

class PlacePreviewListTile extends StatelessWidget {
  PlacePreviewListTile({
    Key? key,
    required PlacePreviewUIModel place,
    bool? hasDivider,
    // required String distance,
    required void Function(PlacePreviewUIModel) onTap,
    required String distanceString,
    EdgeInsets? padding,
    required bool isFirstList,
  })  : _place = place,
        _hasDivider = hasDivider ?? true,
        _onTap = onTap,
        _isFirstList = isFirstList,
        _distanceString = distanceString,
        super(key: key);

  final PlacePreviewUIModel _place;
  bool _hasDivider;
  void Function(PlacePreviewUIModel) _onTap;
  bool _isFirstList;
  String _distanceString;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTap.call(_place);
      },
      child: Container(
        padding: (_isFirstList)
            ? EdgeInsets.fromLTRB(15, 20, 15, 18)
            : EdgeInsets.fromLTRB(15, 20, 15, 18),
        decoration: BoxDecoration(
            color: WcColors.white,
            border: Border(
                bottom: BorderSide(
              color: (_hasDivider) ? WcColors.grey60 : Colors.transparent,
            ))),
        height: 122,
        width: WcWidth(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          _place.placeType.unselectedImagePng,
                          height: 19,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth: WcWidth(context) - 215),
                                child: Text(
                                  _place.name,
                                  style: TextStyle(
                                      fontFamily: WcFontFamily.notoSans,
                                      fontSize: 17.8,
                                      height: 1.2,
                                      fontWeight: FontWeight.w600),
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              OpeningStatusText(
                                isOpen: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          height: 9,
                          width: 9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: _place.mostVisitedDiseaseType.color),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(_place.mostVisitedDiseaseType.displayName,
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                fontSize: 14.3,
                                height: 1.2,
                                color: WcColors.grey200,
                                fontWeight: FontWeight.w600)),
                        Text(
                            (_place.mostVisitedDiseaseType ==
                                    DiseaseType.undefined)
                                ? ' 방문질환 없음'
                                : ' 질환 방문많음',
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                fontSize: 14.3,
                                height: 1.2,
                                color: WcColors.grey160,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3, right: 5),
                          child: CircleAvatar(
                            backgroundColor: WcColors.grey100,
                            radius: 2,
                          ),
                        ),
                        Text('리뷰',
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                fontSize: 14.3,
                                height: 1.2,
                                color: WcColors.grey160,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: 3,
                        ),
                        Text(_place.totalReviews.toString(),
                            style: GoogleFonts.openSans(
                                fontSize: 14.3,
                                height: 1.2,
                                color: WcColors.grey180,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(_distanceString,
                            style: GoogleFonts.workSans(
                                fontSize: 15,
                                color: WcColors.grey200,
                                height: 1.2,
                                fontWeight: FontWeight.w600)),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 15,
                          width: 1.2,
                          color: WcColors.grey80,
                        ),
                        Expanded(
                          child: Text(_place.address,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontSize: 14,
                                  height: 1.2,
                                  color: WcColors.grey120,
                                  fontWeight: FontWeight.w400)),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 88,
              width: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: WcColors.grey60,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: _place.thumbnailImage.getImageByType),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectedPlacePreview extends StatelessWidget {
  SelectedPlacePreview({
    Key? key,
    required PlacePreviewUIModel place,
    // required String distance,
    required void Function() onTap,
    required void Function(PlacePreviewUIModel) onReviewTap,
    // required void Function() onCallTap,
    required String distanceString,
  })  : _place = place,
        // _distance = distance,
        _onTap = onTap,
        _onReviewTap = onReviewTap,
        // _onCallTap = onCallTap,
        _distanceString = distanceString,
        super(key: key);

  final PlacePreviewUIModel _place;
  // String _distance;
  String _distanceString;
  void Function() _onTap;
  void Function(PlacePreviewUIModel) _onReviewTap;
  // void Function() _onCallTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: WcColors.white,
            boxShadow: [
              BoxShadow(
                  color: WcColors.grey140,
                  blurRadius: 10,
                  offset: Offset(0, 0),
                  spreadRadius: -6)
            ]),
        height: WcHeight(context),
        width: WcWidth(context),
        child: Column(
          children: [
            Container(
              height: 5,
              width: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: WcColors.grey80,
              ),
              margin: EdgeInsets.only(top: 13, bottom: 2),
            ),
            PlacePreviewListTile(
              distanceString: _distanceString,
              isFirstList: false,
              place: _place,
              hasDivider: false,
              onTap: (PlacePreviewUiModel) {
                _onTap();
              },
            ),
            Container(
              width: WcWidth(context) - 30,
              height: 50,
              child: Row(
                children: [
                  PhoneCallButton(
                    phoneNumber: _place.phone,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  WcWideButtonWidget(
                      buttonText: '리뷰쓰기',
                      onTap: () {
                        _onReviewTap.call(_place);
                      },
                      buttonWidth: WcWidth(context) - 30 - 60,
                      activeButtonColor: WcColors.blue100,
                      active: true,
                      activeTextColor: WcColors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
