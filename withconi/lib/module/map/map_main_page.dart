import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/ui_model/dropdown_data_ui_model.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';
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
    final MapMainPageController _controller = Get.find(tag: 'tag');
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // backgroundColor: WcColors.white,s
        body: Obx(
          () => Center(
            child: (_controller.pageLoading.value)
                ? SizedBox.shrink()
                // : (!_controller.hasLocationPermission.value)
                //     ? LocationPermissionWidget(controller: _controller)
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: WcWidth,
                        height: WcHeight,
                        child: NaverMap(
                          onMapCreated: _controller.onMapCreated,
                          mapType: _controller.mapType,
                          locationButtonEnable: false,
                          initLocationTrackingMode: LocationTrackingMode.Follow,
                          markers: _controller.placeMarkers.toList(),
                          onMapTap: _controller.onMapTap,
                          logoClickEnabled: true,
                          onCameraChange: _controller.onCameraChange,
                        ),
                      ),
                      Positioned(
                        top: 35,
                        left: 15,
                        child: Center(
                          child: SearchBarWidget(
                            width: WcWidth - 40 - 45,
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
                        top: 88,
                        left: 15,
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
                                onPressed:
                                    _controller.onSelectedPlaceTypeChanged,
                                placeTypeList: PlaceType.values,
                                selectedPlaceType: _controller
                                    .mapFilterUiModel.value.placeType,
                              ),
                            )),
                      ),
                      Positioned(
                        right: 13,
                        top: 88,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes.MAP_BOOKMARK,
                            );
                          },
                          child: Container(
                            width: 48,
                            height: 48,
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
                            child: SvgPicture.asset(
                              'assets/icons/bookmark.svg',
                              color: WcColors.blue100,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 13,
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
                            padding: EdgeInsets.all(12.8),
                            decoration: BoxDecoration(
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
                              'assets/icons/review.svg',
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
                                onTap: _controller.searchRefresh,
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
                                _controller.placeListScrollController =
                                    scrollController;
                                _controller.addInfiniteScrollListener();
                                return SingleChildScrollView(
                                  // physics: ClampingScrollPhysics(),
                                  controller:
                                      _controller.placeListScrollController,
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
                                                          () =>
                                                              CustomDropdownButton(
                                                                  dropdownList:
                                                                      DiseaseType
                                                                          .values
                                                                          .map(
                                                                              (diseaseType) {
                                                                    return DropdownDataUIModel(
                                                                        value: (diseaseType == DiseaseType.all)
                                                                            ? null
                                                                            : diseaseType,
                                                                        text: diseaseType
                                                                            .displayName);
                                                                  }).toList(),
                                                                  hintText:
                                                                      '질병별 방문 많은',
                                                                  selectedValue:
                                                                      _controller
                                                                          .mapFilterUiModel
                                                                          .value
                                                                          .diseaseType,
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
                                                            hintText:
                                                                '품종별 많이 찾는',
                                                            selectedValue:
                                                                _controller
                                                                    .mapFilterUiModel
                                                                    .value
                                                                    .speciesType,
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
                                                              OpeningStatusButton(
                                                            openingStatus: _controller
                                                                .mapFilterUiModel
                                                                .value
                                                                .openingStatus,
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
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: CustomDropdownButton(
                                                      buttonPadding:
                                                          const EdgeInsets.only(
                                                              left: 3,
                                                              right: 0),
                                                      buttonWidth: (_controller
                                                                  .mapFilterUiModel
                                                                  .value
                                                                  .locationType ==
                                                              LocationSearchType
                                                                  .currentLocation)
                                                          ? 92
                                                          : 105,
                                                      selectedButtonColor:
                                                          WcColors.white,
                                                      selectedTextColor:
                                                          WcColors.black,
                                                      dropdownList: LocationSearchType
                                                          .values
                                                          .map((locationType) =>
                                                              DropdownDataUIModel(
                                                                  value:
                                                                      locationType,
                                                                  text: locationType
                                                                      .displayName))
                                                          .toList(),
                                                      hintText: '',
                                                      selectedValue: _controller
                                                          .mapFilterUiModel
                                                          .value
                                                          .locationType,
                                                      onValueChanged: (item) {
                                                        _controller
                                                            .onBaseLocationChanged(item
                                                                as LocationSearchType);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Obx(
                                                  () => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: CustomDropdownButton(
                                                      buttonPadding:
                                                          const EdgeInsets.only(
                                                              left: 3,
                                                              right: 0),
                                                      buttonWidth: (_controller
                                                                  .mapFilterUiModel
                                                                  .value
                                                                  .sortType ==
                                                              SortType.nearest)
                                                          ? 65
                                                          : 95,
                                                      selectedButtonColor:
                                                          WcColors.white,
                                                      selectedTextColor:
                                                          WcColors.black,
                                                      dropdownList: SortType
                                                          .values
                                                          .map((sortType) =>
                                                              DropdownDataUIModel(
                                                                  value:
                                                                      sortType,
                                                                  text: sortType
                                                                      .displayName))
                                                          .toList(),
                                                      hintText: '',
                                                      selectedValue: _controller
                                                          .mapFilterUiModel
                                                          .value
                                                          .sortType,
                                                      onValueChanged: (item) {
                                                        _controller
                                                            .onSortTypeChanged(
                                                                item
                                                                    as SortType);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Obx(
                                              () => Visibility(
                                                visible: _controller
                                                    .placePreviewList
                                                    .isNotEmpty,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    ListView.builder(
                                                        cacheExtent: 2000,
                                                        padding:
                                                            EdgeInsets.all(0),
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount: _controller
                                                            .placePreviewList
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          PlacePreviewUiModel
                                                              place =
                                                              _controller
                                                                      .placePreviewList[
                                                                  index];
                                                          return PlacePreviewListTile(
                                                            isFirstList:
                                                                (index == 0),
                                                            place: place,
                                                            onTap: (PlacePreviewUiModel
                                                                placePreview) {
                                                              _controller
                                                                      .selectedPlacePreview
                                                                      .value =
                                                                  placePreview;
                                                            },
                                                          );
                                                        }),
                                                  ],
                                                ),
                                                replacement: Container(
                                                  width: WcWidth,
                                                  height: 220,
                                                  decoration: BoxDecoration(
                                                      color: WcColors.white),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/location_grey.svg',
                                                        color: WcColors.grey120,
                                                        height: 35,
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        '일치하는 장소가 없어요',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                WcFontFamily
                                                                    .notoSans,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: WcColors
                                                                .grey140),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        '소중한 리뷰를 남겨주시면\n도움되는 정보로 꼭 보답할게요!',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                WcFontFamily
                                                                    .notoSans,
                                                            fontSize: 15,
                                                            color: WcColors
                                                                .grey140),
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
                          visible:
                              (_controller.selectedPlacePreview.value != null),
                          child: DraggableScrollableSheet(
                              controller:
                                  // DraggableScrollableController(),
                                  _controller.selectedPlaceDragController,
                              // _controller.makeNewDraggableSelected(),
                              minChildSize: 250 / WcHeight,
                              initialChildSize: 250 / WcHeight,
                              maxChildSize: 0.90,
                              // snap: true,
                              // snapSizes: [250 / WcHeight, 0.8],
                              builder: (context, scrollController) {
                                _controller.selectedPlaceScrollController =
                                    scrollController;
                                return SingleChildScrollView(
                                    controller: _controller
                                        .selectedPlaceScrollController,
                                    child: GestureDetector(
                                      onTap:
                                          _controller.goToSelectedPlaceDetail,
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
                                                  top: 13, bottom: 0),
                                            ),
                                            PlacePreviewListTile(
                                              isFirstList: false,
                                              place: _controller
                                                  .selectedPlacePreview.value!,
                                              hasDivider: false,
                                              onTap: (placePreview) {
                                                _controller
                                                    .goToSelectedPlaceDetail(
                                                        placePreview);
                                              },
                                            ),
                                            Container(
                                              width: WcWidth - 30,
                                              height: 50,
                                              child: Row(
                                                children: [
                                                  PhoneCallButton(
                                                      phoneNumber: _controller
                                                          .selectedPlacePreview
                                                          .value!
                                                          .phone),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  WcWideButtonWidget(
                                                      buttonText: '리뷰쓰기',
                                                      onTap: () {
                                                        _controller
                                                            .newPlaceReviewPage(
                                                                _controller
                                                                    .selectedPlacePreview
                                                                    .value!);
                                                      },
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
                                    ));
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
        width: 75,
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
  List<DropdownDataUIModel> dropdownList = [];
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
        scrollbarAlwaysShow: true,
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
        buttonWidth: buttonWidth, dropdownMaxHeight: 200,
        dropdownWidth: buttonWidth + 35,
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
  PlacePreviewListTile({
    Key? key,
    required PlacePreviewUiModel place,
    bool? hasDivider,
    // required String distance,
    required void Function(PlacePreviewUiModel) onTap,
    EdgeInsets? padding,
    required bool isFirstList,
  })  : _place = place,
        _hasDivider = hasDivider ?? true,
        _onTap = onTap,
        _isFirstList = isFirstList,
        super(key: key);

  final PlacePreviewUiModel _place;
  bool _hasDivider;
  void Function(PlacePreviewUiModel) _onTap;
  bool _isFirstList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTap.call(_place);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
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
                          height: 18.5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(maxWidth: WcWidth - 220),
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
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.5),
                              color: _place.highestDiseaseType.color),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(_place.highestDiseaseType.displayName,
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
                                color: WcColors.grey180,
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
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(_place.distanceString,
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
              height: 90,
              width: 90,
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
    required PlacePreviewUiModel place,
    required String distance,
    required void Function() onTap,
    required void Function() onReviewTap,
    required void Function() onCallTap,
  })  : _place = place,
        _distance = distance,
        _onTap = onTap,
        _onReviewTap = onReviewTap,
        _onCallTap = onCallTap,
        super(key: key);

  final PlacePreviewUiModel _place;
  String _distance;
  void Function() _onTap;
  void Function() _onReviewTap;
  void Function() _onCallTap;

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
              isFirstList: false,
              place: _place,
              hasDivider: false,
              onTap: (PlacePreviewUiModel) {
                _onTap();
              },
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
