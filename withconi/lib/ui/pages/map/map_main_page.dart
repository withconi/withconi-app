import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/model/abstract_class/place_type.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import '../../../controller/map/map_main_page_controller.dart';
import '../../theme/text_theme.dart';
import '../../widgets/searchbar/search_bar.dart';
import 'map_widgets/opening_status_text.dart';
import 'map_widgets/phone_button.dart';
import 'map_widgets/place_toggle_button.dart';
import 'map_widgets/search_refresh_button.dart';

class MapMainPage extends StatelessWidget {
  MapMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapMainPageController _controller = Get.put(MapMainPageController());

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: WcColors.white,
        body: Center(
          child: Stack(
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
                    initLocationTrackingMode: LocationTrackingMode.Follow,
                    markers: _controller.placeMarkers.toList(),
                    onMapTap: _controller.onMapTap,
                    logoClickEnabled: true,
                    onCameraChange: _controller.onCameraChange,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: 20,
                child: Center(
                  child: SearchBarWidget(
                    hintText: '동물병원/약국 검색',
                  ),
                ),
              ),
              Positioned(
                top: 90,
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
                        onPressed: (int index) {
                          for (int i = 0;
                              i < _controller.selectedPlaceTypeList.length;
                              i++) {
                            if (i == index) {
                              _controller.selectedPlaceTypeList[i] = true;
                            } else {
                              _controller.selectedPlaceTypeList[i] = false;
                            }
                          }

                          _controller.selectedPlaceTypeList.refresh();
                        },
                        isSelectedList:
                            _controller.selectedPlaceTypeList.toList(),
                      ),
                    )),
              ),
              Positioned(
                right: 20,
                top: 90,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.all(13),
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
                      initialChildSize: 0.40,
                      minChildSize: 87 / WcHeight,
                      maxChildSize: 1,
                      controller: _controller.placePreviewListDragController,
                      builder: (context, scrollController) {
                        _controller.placeListScrollController.value =
                            scrollController;
                        return SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          controller:
                              _controller.placeListScrollController.value,
                          child: Container(
                            constraints: BoxConstraints(
                              minHeight: WcHeight,
                            ),
                            color: WcColors.white,
                            child: Column(
                              children: [
                                DraggableIndicator(),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 13),
                                        child: Row(
                                          children: [
                                            Obx(
                                              () => DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  // dropdownElevation: 2,
                                                  selectedItemBuilder:
                                                      (context) => _controller
                                                          .diseaseFilterList
                                                          .map(
                                                            (diseaseType) =>
                                                                Container(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              height: 35,
                                                              child: Text(
                                                                  diseaseType ??
                                                                      '질병별 많이 찾는',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          WcFontFamily
                                                                              .notoSans,
                                                                      color: (diseaseType == null)
                                                                          ? WcColors
                                                                              .grey200
                                                                          : WcColors
                                                                              .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          13.5)),
                                                            ),
                                                          )
                                                          .toList(),
                                                  selectedItemHighlightColor:
                                                      WcColors.grey40,
                                                  buttonDecoration: BoxDecoration(
                                                      color: (_controller
                                                                  .selectedDiseaseFilter
                                                                  .value !=
                                                              null)
                                                          ? WcColors.blue100
                                                          : WcColors.grey60,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  // hint: Text(
                                                  //   '질병별 많이 찾는',
                                                  //   style: GoogleFonts.notoSans(
                                                  //       color: WcColors.grey160,
                                                  //       fontWeight:
                                                  //           FontWeight.w600,
                                                  //       fontSize: 13),
                                                  // ),

                                                  dropdownPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0),
                                                  buttonPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 8),
                                                  dropdownDecoration:
                                                      const BoxDecoration(
                                                          color: WcColors.white,
                                                          boxShadow: [
                                                        BoxShadow(
                                                            color:
                                                                Color.fromARGB(
                                                                    69,
                                                                    124,
                                                                    124,
                                                                    124),
                                                            blurRadius: 8,
                                                            offset: Offset(
                                                              0.0, // Move to right 10  horizontally
                                                              8.0,
                                                            )),
                                                      ]),
                                                  icon: SvgPicture.asset(
                                                    'assets/icons/arrow_down.svg',
                                                    color: (_controller
                                                                .selectedDiseaseFilter
                                                                .value !=
                                                            null)
                                                        ? WcColors.white
                                                        : WcColors.grey160,
                                                  ),
                                                  isExpanded: true,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  items: _controller
                                                      .diseaseFilterList
                                                      .map((diseaseType) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: diseaseType,
                                                            child: SizedBox(
                                                              child: Text(
                                                                diseaseType ??
                                                                    '전체',
                                                                style: GoogleFonts.notoSans(
                                                                    color: WcColors
                                                                        .black,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w100,
                                                                    height:
                                                                        1.3),
                                                              ),
                                                            ),
                                                          ))
                                                      .toList(),
                                                  value: _controller
                                                      .selectedDiseaseFilter
                                                      .value,
                                                  onChanged: (String? item) {
                                                    _controller
                                                        .selectedDiseaseFilter
                                                        .value = item;
                                                  },
                                                  buttonHeight: 35,
                                                  buttonWidth: 130,
                                                  itemHeight: 45,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Obx(
                                              () => DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  // dropdownElevation: 2,
                                                  selectedItemHighlightColor:
                                                      WcColors.grey40,
                                                  selectedItemBuilder: (context) => _controller
                                                      .conimalFilterList
                                                      .map((conimalType) => Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          height: 35,
                                                          child: Text(
                                                              conimalType ??
                                                                  '품종별 많이 찾는',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      WcFontFamily
                                                                          .notoSans,
                                                                  color: (conimalType == null)
                                                                      ? WcColors
                                                                          .grey200
                                                                      : WcColors
                                                                          .white,
                                                                  fontWeight:
                                                                      FontWeight.w500,
                                                                  fontSize: 13.5))))
                                                      .toList(),
                                                  buttonDecoration: BoxDecoration(
                                                      color: (_controller
                                                                  .selectedConimalFilter
                                                                  .value !=
                                                              null)
                                                          ? WcColors.blue100
                                                          : WcColors.grey60,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  dropdownPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0),
                                                  buttonPadding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 8),

                                                  dropdownDecoration:
                                                      const BoxDecoration(
                                                          color: WcColors.white,
                                                          boxShadow: [
                                                        BoxShadow(
                                                            color:
                                                                Color.fromARGB(
                                                                    69,
                                                                    124,
                                                                    124,
                                                                    124),
                                                            blurRadius: 8,
                                                            offset: Offset(
                                                              0.0, // Move to right 10  horizontally
                                                              8.0,
                                                            )),
                                                      ]),
                                                  icon: SvgPicture.asset(
                                                    'assets/icons/arrow_down.svg',
                                                    color: (_controller
                                                                .selectedConimalFilter
                                                                .value !=
                                                            null)
                                                        ? WcColors.white
                                                        : WcColors.grey160,
                                                  ),
                                                  isExpanded: true,

                                                  items: _controller
                                                      .conimalFilterList
                                                      .map((conimalType) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                            value: conimalType,
                                                            child: Text(
                                                              conimalType ??
                                                                  '전체',
                                                              style: GoogleFonts.notoSans(
                                                                  color: WcColors
                                                                      .black,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w100,
                                                                  height: 1.3),
                                                            ),
                                                          ))
                                                      .toList(),
                                                  value: _controller
                                                      .selectedConimalFilter
                                                      .value,
                                                  onChanged: (String? item) {
                                                    _controller
                                                        .selectedConimalFilter
                                                        .value = item;
                                                  },
                                                  buttonHeight: 35,
                                                  buttonWidth: 130,
                                                  itemHeight: 45,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                height: 35,
                                                width: 75,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: WcColors.grey60),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/icons/clock.svg',
                                                      height: 15,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('진료 중',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                WcFontFamily
                                                                    .notoSans,
                                                            color: WcColors
                                                                .grey200,
                                                            height: 1,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 13.5)),
                                                    SizedBox(
                                                      width: 3,
                                                    ),
                                                  ],
                                                ),
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
                                    visible:
                                        _controller.placeMarkers.isNotEmpty,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 15),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton2(
                                              selectedItemHighlightColor:
                                                  WcColors.grey40,
                                              itemPadding:
                                                  EdgeInsets.only(left: 8),
                                              buttonPadding:
                                                  const EdgeInsets.only(
                                                      top: 5,
                                                      left: 0,
                                                      right: 0),
                                              dropdownPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 0),
                                              dropdownDecoration:
                                                  const BoxDecoration(
                                                      color: WcColors.white,
                                                      boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            69, 124, 124, 124),
                                                        blurRadius: 8,
                                                        offset: Offset(
                                                          0.0, // Move to right 10  horizontally
                                                          8.0,
                                                        )),
                                                  ]),
                                              icon: SvgPicture.asset(
                                                'assets/icons/arrow_down.svg',
                                                color: WcColors.black,
                                              ),
                                              isExpanded: true,
                                              items: _controller.sortTypeList
                                                  .map((sortType) =>
                                                      DropdownMenuItem<String>(
                                                        value: sortType,
                                                        child: Text(sortType,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    WcFontFamily
                                                                        .notoSans,
                                                                color: WcColors
                                                                    .grey200,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                height: 1.3)),
                                                      ))
                                                  .toList(),
                                              value: _controller
                                                  .selectedSortType.value,
                                              onChanged: (String? item) {
                                                _controller.selectedSortType
                                                    .value = item ?? '거리순';
                                              },
                                              buttonHeight: 40,
                                              buttonWidth: 90,
                                              itemHeight: 45,

                                              // buttonDecoration: BoxDecoration(
                                              //     color: WcColors.green20),
                                            ),
                                          ),
                                        ),
                                        ListView.builder(
                                            padding: EdgeInsets.all(0),
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                                _controller.placeMarkers.length,
                                            itemBuilder: (context, index) {
                                              PlacePreviewType place =
                                                  _controller
                                                      .placeMarkers[index]
                                                      .place;
                                              return PlacePreviewListTile(
                                                isFirstList: (index == 0),
                                                place: place,
                                                distance: _controller
                                                    .getDistanceString(
                                                        placeLocation:
                                                            place.location),
                                                onTap: () {
                                                  _controller
                                                      .goToSelectedPlaceDetail(
                                                          selectedLocId:
                                                              place.locId);
                                                },
                                              );
                                            }),
                                      ],
                                    ),
                                    replacement: Container(
                                      width: WcWidth,
                                      height: 200,
                                      decoration:
                                          BoxDecoration(color: WcColors.white),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '일치하는 장소가 없네요 :(',
                                            style: TextStyle(
                                                fontFamily:
                                                    WcFontFamily.notoSans,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: WcColors.grey160),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            '위드코니는 반려자분들의 \n정보를 통해 활성화된답니다.',
                                            style: TextStyle(
                                                fontFamily:
                                                    WcFontFamily.notoSans,
                                                fontSize: 15,
                                                color: WcColors.grey180),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '소중한 리뷰를 남겨주시면\n더 도움되는 정보로 꼭 보답할게요!',
                                            style: TextStyle(
                                                fontFamily:
                                                    WcFontFamily.notoSans,
                                                fontSize: 15,
                                                color: WcColors.grey180),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: (_controller.selectedMarker.value != null),
                  child: DraggableScrollableSheet(
                      controller: _controller.selectedPlaceDragController,
                      minChildSize: 235 / WcHeight,
                      initialChildSize: 235 / WcHeight,
                      maxChildSize: 0.8,
                      snap: true,
                      snapSizes: [240 / WcHeight, 0.8],
                      builder: (context, scrollController) {
                        _controller.selectedPlaceScrollController =
                            scrollController;
                        return SingleChildScrollView(
                          controller: _controller.selectedPlaceScrollController,
                          child: SelectedPlacePreview(
                            onTap: () {
                              _controller.goToSelectedPlaceDetail(
                                  selectedLocId: _controller
                                      .selectedMarker.value!.place.locId);
                            },
                            place: _controller.selectedMarker.value!.place,
                            distance: _controller.getDistanceString(
                                placeLocation: _controller
                                    .selectedMarker.value!.place.location),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
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
    required PlacePreviewType place,
    bool? hasDivider,
    required String distance,
    void Function()? onTap,
    EdgeInsets? padding,
    required bool isFirstList,
  })  : _place = place,
        _hasDivider = hasDivider ?? true,
        _distance = distance,
        _onTap = onTap,
        _isFirstList = isFirstList,
        super(key: key);

  final PlacePreviewType _place;
  bool _hasDivider;
  String _distance;
  void Function()? _onTap;
  bool _isFirstList;

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
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                      OpeningStatusText(
                        isOpen: true,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/good_face.svg',
                        width: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('추천해요',
                          style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              fontSize: 15,
                              height: 1.3,
                              color: WcColors.grey180,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 2,
                      ),
                      Text(_place.totalRecommend.toString(),
                          style: GoogleFonts.openSans(
                              fontSize: 15,
                              height: 1.3,
                              color: WcColors.grey180,
                              fontWeight: FontWeight.w600)),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7),
                        child: CircleAvatar(
                          backgroundColor: WcColors.grey120,
                          radius: 1,
                        ),
                      ),
                      Text('코니멀 방문',
                          style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              fontSize: 15,
                              height: 1.3,
                              color: WcColors.grey180,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 2,
                      ),
                      Text(_place.totalVisitingConimal.toString(),
                          style: GoogleFonts.openSans(
                              fontSize: 15,
                              height: 1.3,
                              color: WcColors.grey180,
                              fontWeight: FontWeight.w600)),
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
  SelectedPlacePreview(
      {Key? key,
      required PlacePreviewType place,
      required String distance,
      void Function()? onTap})
      : _place = place,
        _distance = distance,
        _onTap = onTap,
        super(key: key);

  final PlacePreviewType _place;
  String _distance;
  void Function()? _onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: WcColors.white,
        ),
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
              distance: _distance,
            ),
            Container(
              width: WcWidth - 30,
              height: 50,
              child: Row(
                children: [
                  PhoneButton(),
                  SizedBox(
                    width: 10,
                  ),
                  WcWideButtonWidget(
                      buttonText: '리뷰쓰기',
                      onTap: () {},
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
