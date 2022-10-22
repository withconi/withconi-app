import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/constants/enum_color.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/data/model/abstract_class/place_preview.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/entities/dropdown_data.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import '../../../controller/map/map_main_page_controller.dart';
import '../../theme/text_theme.dart';
import '../../widgets/searchbar/search_bar.dart';
import 'map_widgets/opening_status_text.dart';
import 'map_widgets/phone_button.dart';
import 'map_widgets/place_toggle_button.dart';
import 'map_widgets/search_refresh_button.dart';

class MapMainPage extends StatelessWidget {
  const MapMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapMainPageController _controller = Get.find(tag: 'Initial');
    // MapMainPageController _controller = Get.put(MapMainPageController());

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // backgroundColor: WcColors.white,s
        body: Obx(
          () => Center(
            child: (!_controller.hasLocationPermission.value)
                ? LocationPermissionWidget(controller: _controller)
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: WcWidth,
                        height: WcHeight,
                        child: Obx(
                          () => NaverMap(
                            onMapCreated: _controller.onMapCreated,
                            mapType: _controller.mapType,
                            locationButtonEnable: false,
                            initLocationTrackingMode:
                                LocationTrackingMode.Follow,
                            markers: [..._controller.placeMarkers],
                            onMapTap: _controller.onMapTap,
                            logoClickEnabled: true,
                            onCameraChange: _controller.onCameraChange,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        left: 20,
                        child: Center(
                          child: SearchBarWidget(
                            width: WcWidth - 40 - 55,
                            // iconSrc: 'assets/icons/list.svg',
                            textController: null,
                            hintText: '동물병원/약국 검색',
                            isEditable: false,
                            onTextFieldTapped: _controller.searchPlace,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(60, 0, 0, 0),
                                spreadRadius: -1,
                                blurRadius: 10,
                                offset: Offset(0, 1),
                              ),
                            ],
                            onTapLeading: () {},
                            activeAction: false,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 88,
                        left: 20,
                        child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: WcColors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(70, 0, 0, 0),
                                  spreadRadius: -1,
                                  blurRadius: 7,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Obx(
                              () => PlaceTypeToggleButton(
                                onPressed:
                                    _controller.onSelectedPlaceTypeChanged,
                                placeTypeList: _controller.placeTypeList,
                                selectedPlaceType:
                                    _controller.selectedPlaceType.value,
                              ),
                            )),
                      ),
                      Positioned(
                        right: 15,
                        top: 88,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.MAP_BOOKMARK,
                                arguments: AuthController.to.wcUser.value!.uid);
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: WcColors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: WcColors.grey120,
                                      blurRadius: 6,
                                      offset: Offset(0, 3),
                                      spreadRadius: -1)
                                ]),
                            child: SvgPicture.asset(
                              'assets/icons/bookmark.svg',
                              color: WcColors.blue100,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15,
                        top: 35,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.MAP_MY_REVIEW,
                            );
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: WcColors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: WcColors.grey120,
                                      blurRadius: 6,
                                      offset: Offset(0, 3),
                                      spreadRadius: -1)
                                ]),
                            child: SvgPicture.asset(
                              'assets/icons/list.svg',
                              color: WcColors.blue100,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                            visible: _controller.showResearchButton.value,
                            child: Positioned(
                              top: 145,
                              child: SearchRefreshButton(
                                onTap: _controller.onSearchRefreshTap,
                              ),
                            )),
                      ),
                      Obx(
                        () => Visibility(
                          visible: _controller.showPlaceListBottomSheet.value,
                          maintainState: true,
                          child: DraggableScrollableSheet(
                              initialChildSize: 0.39,
                              minChildSize: 93 / WcHeight,
                              maxChildSize: 1,
                              controller:
                                  _controller.placePreviewListDragController,
                              builder: (context, scrollController) {
                                _controller.placeListScrollController.value =
                                    scrollController;
                                return SingleChildScrollView(
                                  // physics: ClampingScrollPhysics(),
                                  controller: _controller
                                      .placeListScrollController.value,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      MyLocationButton(
                                        onTap: _controller
                                            .onCurrentLocationButtonTap,
                                      ),
                                      Container(
                                        constraints: BoxConstraints(
                                          minHeight: WcHeight,
                                        ),
                                        decoration: BoxDecoration(
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
                                            DraggableIndicator(),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 13),
                                                    child: Row(
                                                      children: [
                                                        Obx(
                                                          () => CustomDropdownButton(
                                                              dropdownList: _controller
                                                                  .diseaseFilterList
                                                                  .map((e) =>
                                                                      DropdownData(
                                                                          value:
                                                                              e,
                                                                          text: diseaseTypeToKorean(
                                                                              e)))
                                                                  .toList(),
                                                              hintText:
                                                                  '질병별 방문 많은',
                                                              selectedValue:
                                                                  _controller
                                                                      .selectedDiseaseType
                                                                      .value,
                                                              onValueChanged:
                                                                  _controller
                                                                      .onSelectedDiseaseTypeChanged),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Obx(
                                                          () =>
                                                              CustomDropdownButton(
                                                            dropdownList: _controller
                                                                .speciesFilterList
                                                                .map((species) =>
                                                                    DropdownData(
                                                                        value:
                                                                            species,
                                                                        text: speciesToKorean(
                                                                            species)))
                                                                .toList(),
                                                            hintText:
                                                                '품종별 많이 찾는',
                                                            selectedValue:
                                                                _controller
                                                                    .selectedSpeciesType
                                                                    .value,
                                                            onValueChanged:
                                                                _controller
                                                                    .onSelectedSpeciesTypeChanged,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Obx(
                                                          () =>
                                                              OpengingStatusButton(
                                                            onlyOpenPlaces:
                                                                _controller
                                                                    .onlyOpenPlace
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
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Divider(
                                                height: 1,
                                                thickness: 1,
                                                color: WcColors.grey60),
                                            Obx(
                                              () => Visibility(
                                                visible: _controller
                                                    .placeMarkers.isNotEmpty,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Obx(
                                                          () => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 8.0),
                                                            child:
                                                                CustomDropdownButton(
                                                              buttonPadding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 3,
                                                                      right: 0),
                                                              buttonWidth: (_controller
                                                                          .selectedLocationType
                                                                          .value ==
                                                                      LocationType
                                                                          .currentLocation)
                                                                  ? 90
                                                                  : 105,
                                                              selectedButtonColor:
                                                                  WcColors
                                                                      .white,
                                                              selectedTextColor:
                                                                  WcColors
                                                                      .black,
                                                              dropdownList: _controller
                                                                  .locationTypeList
                                                                  .map((e) =>
                                                                      DropdownData(
                                                                          value:
                                                                              e,
                                                                          text:
                                                                              locationTypeToKorean(e)))
                                                                  .toList(),
                                                              hintText: '',
                                                              selectedValue:
                                                                  _controller
                                                                      .selectedLocationType
                                                                      .value,
                                                              onValueChanged:
                                                                  (item) {
                                                                _controller
                                                                        .selectedLocationType
                                                                        .value =
                                                                    item
                                                                        as LocationType;
                                                                _controller
                                                                    .onBaseLocationChanged();
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        Obx(
                                                          () => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 8.0),
                                                            child:
                                                                CustomDropdownButton(
                                                              buttonPadding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 3,
                                                                      right: 0),
                                                              buttonWidth: (_controller
                                                                          .selectedSortType
                                                                          .value ==
                                                                      SortType
                                                                          .nearest)
                                                                  ? 80
                                                                  : 95,
                                                              selectedButtonColor:
                                                                  WcColors
                                                                      .white,
                                                              selectedTextColor:
                                                                  WcColors
                                                                      .black,
                                                              dropdownList: _controller
                                                                  .sortTypeList
                                                                  .map((e) =>
                                                                      DropdownData(
                                                                          value:
                                                                              e,
                                                                          text:
                                                                              sortTypeToKorean(e)))
                                                                  .toList(),
                                                              hintText: '',
                                                              selectedValue:
                                                                  _controller
                                                                      .selectedSortType
                                                                      .value,
                                                              onValueChanged:
                                                                  (item) {
                                                                _controller
                                                                        .selectedSortType
                                                                        .value =
                                                                    item
                                                                        as SortType;
                                                                _controller
                                                                    .onSortTypeChanged();
                                                                print(item);
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    ListView.builder(
                                                        padding:
                                                            EdgeInsets.all(0),
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount: _controller
                                                            .placeMarkers
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          PlacePreview place =
                                                              _controller
                                                                  .placeMarkers[
                                                                      index]
                                                                  .place;
                                                          return PlacePreviewListTile(
                                                            diseaseInfo: place
                                                                .diseaseInfo!
                                                                .diseaseMap,
                                                            isFirstList:
                                                                (index == 0),
                                                            place: place,
                                                            distance: _controller
                                                                .getDistanceToString(
                                                                    distanceMeter:
                                                                        place
                                                                            .distanceByMeter),
                                                            onTap: () {
                                                              // _controller
                                                              //     .goToSelectedPlaceDetail(
                                                              //         selectedLocId:
                                                              //             place.locId);
                                                              _controller
                                                                  .selectedMarker
                                                                  .value = _controller
                                                                      .placeMarkers[
                                                                  index];
                                                            },
                                                          );
                                                        }),
                                                  ],
                                                ),
                                                replacement: Container(
                                                  width: WcWidth,
                                                  height: 200,
                                                  decoration: BoxDecoration(
                                                      color: WcColors.white),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/location_grey.svg',
                                                        color: WcColors.grey100,
                                                        height: 35,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        '일치하는 장소가 없네요 :(',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                WcFontFamily
                                                                    .notoSans,
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: WcColors
                                                                .grey120),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        '소중한 리뷰를 남겨주시면\n더 도움되는 정보로 꼭 보답할게요!',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                WcFontFamily
                                                                    .notoSans,
                                                            fontSize: 15,
                                                            color: WcColors
                                                                .grey120),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible: (_controller.selectedMarker.value != null),
                          child: DraggableScrollableSheet(
                              controller:
                                  _controller.selectedPlaceDragController,
                              minChildSize: 255 / WcHeight,
                              initialChildSize: 255 / WcHeight,
                              maxChildSize: 0.8,
                              snap: true,
                              snapSizes: [260 / WcHeight, 0.8],
                              builder: (context, scrollController) {
                                _controller.selectedPlaceScrollController =
                                    scrollController;
                                return SingleChildScrollView(
                                    controller: _controller
                                        .selectedPlaceScrollController,
                                    child: GestureDetector(
                                      onTap: () {
                                        _controller.goToSelectedPlaceDetail(
                                            selectedPlace: _controller
                                                .selectedMarker.value!.place);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            color: WcColors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: WcColors.grey140,
                                                  blurRadius: 10,
                                                  offset: Offset(0, 0),
                                                  spreadRadius: -6)
                                            ]),
                                        height: WcHeight,
                                        width: WcWidth,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 5,
                                              width: 38,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: WcColors.grey80,
                                              ),
                                              margin: EdgeInsets.only(
                                                  top: 13, bottom: 2),
                                            ),
                                            PlacePreviewListTile(
                                              diseaseInfo: _controller
                                                  .selectedMarker
                                                  .value!
                                                  .place
                                                  .diseaseInfo!
                                                  .diseaseMap,
                                              isFirstList: false,
                                              place: _controller
                                                  .selectedMarker.value!.place,
                                              hasDivider: false,
                                              distance: _controller
                                                  .getDistanceToString(
                                                      distanceMeter: _controller
                                                          .selectedMarker
                                                          .value!
                                                          .place
                                                          .distanceByMeter),
                                            ),
                                            Container(
                                              width: WcWidth - 30,
                                              height: 50,
                                              child: Row(
                                                children: [
                                                  PhoneCallButton(
                                                      phoneNumber: _controller
                                                          .selectedMarker
                                                          .value!
                                                          .place
                                                          .phone),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  WcWideButtonWidget(
                                                      buttonText: '리뷰쓰기',
                                                      onTap: _controller
                                                          .goToNewReviewPage,
                                                      buttonWidth:
                                                          WcWidth - 30 - 60,
                                                      activeButtonColor:
                                                          WcColors.blue100,
                                                      active: true,
                                                      activeTextColor:
                                                          WcColors.white),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )

                                    // SelectedPlacePreview(
                                    //   onReviewTap: _controller.goToNewReviewPage,
                                    //   onTap: () {
                                    //     _controller.goToSelectedPlaceDetail(
                                    //         selectedPlace: _controller
                                    //             .selectedMarker.value!.place);
                                    //   },
                                    //   place:
                                    //       _controller.selectedMarker.value!.place,
                                    //   distance: _controller.getDistanceToString(
                                    //       distanceMeter: _controller
                                    //           .selectedMarker
                                    //           .value!
                                    //           .place
                                    //           .distanceByMeter),
                                    // ),
                                    );
                              }),
                        ),
                      )
                    ],
                  ),
          ),
        ),
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
        height: WcHeight,
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
              Text('위치정보 권한이\n필요해요',
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
              SizedBox(
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
                buttonWidth: WcWidth - 40,
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
        margin: EdgeInsets.fromLTRB(0, 0, 15, 10),
        width: 43,
        height: 43,
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: WcColors.white,
            boxShadow: [
              BoxShadow(
                  color: WcColors.grey180,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                  spreadRadius: -3)
            ]),
        child: SvgPicture.asset(
          'assets/icons/my_location.svg',
          height: 25,
        ),
      ),
    );
  }
}

class OpengingStatusButton extends StatelessWidget {
  OpengingStatusButton({
    Key? key,
    required this.onlyOpenPlaces,
    this.onTap,
  }) : super(key: key);
  bool onlyOpenPlaces;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: (onlyOpenPlaces) ? WcColors.blue100 : WcColors.grey60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/clock.svg',
                height: 15,
                color: (onlyOpenPlaces) ? WcColors.white : WcColors.grey100),
            SizedBox(
              width: 4,
            ),
            Text('진료 중',
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    color: (onlyOpenPlaces) ? WcColors.white : WcColors.grey200,
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

class CustomDropdownButton extends StatelessWidget {
  CustomDropdownButton(
      {Key? key,
      // required MapMainPageController controller,
      required this.hintText,
      required this.dropdownList,
      required this.selectedValue,
      required this.onValueChanged,
      this.buttonWidth = 139,
      this.buttonHeight = 35,
      this.selectedButtonColor,
      this.buttonPadding,
      this.selectedTextColor})
      : super(key: key);

  String hintText;
  List<DropdownData> dropdownList = [];
  dynamic selectedValue;
  void Function(Object?)? onValueChanged;
  double buttonWidth;
  Color? selectedButtonColor;
  Color? selectedTextColor;
  double buttonHeight;
  EdgeInsetsGeometry? buttonPadding;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        // dropdownElevation: 2,
        selectedItemBuilder: (context) => dropdownList
            .map(
              (dropdownItem) => Container(
                alignment: Alignment.centerLeft,
                height: 35,
                child: Text(
                    (selectedValue == null) ? hintText : dropdownItem.text,
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        color: (selectedValue == null)
                            ? WcColors.grey200
                            : selectedTextColor ?? WcColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.5)),
              ),
            )
            .toList(),
        selectedItemHighlightColor: WcColors.grey40,
        buttonDecoration: BoxDecoration(
            color: (selectedValue != null)
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
          color: (selectedValue != null)
              ? selectedTextColor ?? WcColors.white
              : WcColors.grey160,
        ),
        isExpanded: true,
        alignment: Alignment.centerLeft,
        items: dropdownList
            .map((dropdownItem) => DropdownMenuItem(
                  value: dropdownItem.value,
                  child: SizedBox(
                    child: Text(
                      (dropdownItem.value == null) ? '전체' : dropdownItem.text,
                      style: GoogleFonts.notoSans(
                          color: WcColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                          height: 1.3),
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: onValueChanged,
        buttonHeight: buttonHeight,
        buttonWidth: buttonWidth,
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
      height: 4,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: WcColors.grey80,
      ),
      margin: EdgeInsets.only(top: 13, bottom: 15),
    );
  }
}

class PlacePreviewListTile extends StatelessWidget {
  PlacePreviewListTile(
      {Key? key,
      required PlacePreview place,
      bool? hasDivider,
      required String distance,
      void Function()? onTap,
      EdgeInsets? padding,
      required bool isFirstList,
      required Map<DiseaseType, int> diseaseInfo})
      : _place = place,
        _hasDivider = hasDivider ?? true,
        _distance = distance,
        _onTap = onTap,
        _isFirstList = isFirstList,
        _diseaseInfo = diseaseInfo,
        super(key: key);

  final PlacePreview _place;
  bool _hasDivider;
  String _distance;
  void Function()? _onTap;
  bool _isFirstList;
  Map<DiseaseType, int> _diseaseInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: (_isFirstList)
            ? EdgeInsets.fromLTRB(15, 0, 15, 15)
            : EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            color: WcColors.white,
            border: Border(
                bottom: BorderSide(
              color: (_hasDivider) ? WcColors.grey60 : Colors.transparent,
            ))),
        height: 125,
        width: WcWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: WcWidth - 90 - 30 - 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(_place.name,
                          style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                      OpeningStatusText(
                        isOpen: true,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.5),
                            color: colorByDisease(_diseaseInfo.keys.first)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(diseaseTypeToKorean(_diseaseInfo.keys.first),
                          style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              fontSize: 14.5,
                              height: 1.2,
                              color: WcColors.grey200,
                              fontWeight: FontWeight.w600)),
                      Text(' 질환 방문많음',
                          style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              fontSize: 14.5,
                              height: 1.2,
                              color: WcColors.grey160,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 2,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: CircleAvatar(
                          backgroundColor: WcColors.grey120,
                          radius: 1,
                        ),
                      ),
                      Text('리뷰',
                          style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              fontSize: 14.5,
                              height: 1.2,
                              color: WcColors.grey160,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 3,
                      ),
                      Text(_place.totalReviews.toString(),
                          style: GoogleFonts.openSans(
                              fontSize: 14.5,
                              height: 1.2,
                              color: WcColors.grey180,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  Row(
                    children: [
                      Text(_distance,
                          style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: WcColors.black,
                              fontWeight: FontWeight.w700)),
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
                                color: WcColors.grey120,
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: WcColors.grey60,
                image: DecorationImage(
                    image: NetworkImage(_place.thumbnail), fit: BoxFit.cover),
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
    required PlacePreview place,
    required String distance,
    void Function()? onTap,
    void Function()? onReviewTap,
    void Function()? onCallTap,
  })  : _place = place,
        _distance = distance,
        _onTap = onTap,
        _onReviewTap = onReviewTap,
        _onCallTap = onCallTap,
        super(key: key);

  final PlacePreview _place;
  String _distance;
  void Function()? _onTap;
  void Function()? _onReviewTap;
  void Function()? _onCallTap;

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
        height: WcHeight,
        width: WcWidth,
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
              diseaseInfo: _place.diseaseInfo!.diseaseMap,
              isFirstList: false,
              place: _place,
              hasDivider: false,
              distance: _distance,
            ),
            Container(
              width: WcWidth - 30,
              height: 50,
              child: Row(
                children: [
                  PhoneCallButton(phoneNumber: _place.phone),
                  SizedBox(
                    width: 10,
                  ),
                  WcWideButtonWidget(
                      buttonText: '리뷰쓰기',
                      onTap: _onReviewTap,
                      buttonWidth: WcWidth - 30 - 60,
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
