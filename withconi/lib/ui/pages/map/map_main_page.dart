import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/model/abstract_class/place_type.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';
import '../../../controller/map/map_main_page_controller.dart';
import '../../theme/text_theme.dart';
import '../../widgets/searchbar/search_bar.dart';
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
                top: 10,
                left: 20,
                child: Center(
                  child: SearchBarWidget(
                    hintText: '동물병원/약국 검색',
                  ),
                ),
              ),
              Positioned(
                top: 95,
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
              Obx(
                () => Visibility(
                    visible: _controller.showResearchButton.value,
                    child: Positioned(
                      top: 153,
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
                      initialChildSize: (_controller.placeMarkers.length >= 2)
                          ? 0.40
                          : 93 / WcHeight,
                      minChildSize: 90 / WcHeight,
                      maxChildSize:
                          (((_controller.placeMarkers.length * 155) + 95) /
                                      WcHeight <
                                  1)
                              ? ((_controller.placeMarkers.length * 155) + 95) /
                                  WcHeight
                              : 1,
                      snap: false,
                      // snapSizes: [0.17, 0.4, 1],
                      controller: _controller.placePreviewListDragController,
                      builder: (context, scrollController) {
                        _controller.placeListScrollController.value =
                            scrollController;
                        return SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          controller:
                              _controller.placeListScrollController.value,
                          child: Container(
                            // height: ((_controller.placeMarkers.length * 155) +
                            //             95 <
                            //         WcHeight)
                            //     ? (_controller.placeMarkers.length * 155) + 51
                            //     : WcHeight,
                            color: WcColors.white,
                            child: Column(
                              children: [
                                Container(
                                  height: 4,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: WcColors.grey80,
                                  ),
                                  margin: EdgeInsets.only(top: 13, bottom: 15),
                                ),
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
                                                                    '선택안함',
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
                                                    if (item == '전체') {
                                                      _controller
                                                          .selectedDiseaseFilter
                                                          .value = null;
                                                    } else {
                                                      _controller
                                                          .selectedDiseaseFilter
                                                          .value = item;
                                                    }
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
                                                  // hint: Text(
                                                  //   '품종별 많이 찾는',
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
                                                  // itemPadding: const EdgeInsets
                                                  //         .symmetric(
                                                  //     vertical: 15,
                                                  //     horizontal: 10),
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
                                                                  '선택안함',
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
                                                    if (item == '전체') {
                                                      _controller
                                                          .selectedConimalFilter
                                                          .value = null;
                                                    } else {
                                                      _controller
                                                          .selectedConimalFilter
                                                          .value = item;
                                                    }
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
                                                    Text('진료중',
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
                                ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: _controller.placeMarkers.length,
                                    itemBuilder: (context, index) {
                                      PlacePreviewType place =
                                          _controller.placeMarkers[index].place;
                                      return PlacePreviewListTile(
                                        place: place,
                                        distance: _controller.getDistanceString(
                                            placeLocation: place.location),
                                        onTap: () {
                                          _controller.goToPlaceDetail();
                                        },
                                      );
                                    })
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
                            onTap: _controller.goToPlaceDetail,
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

class PlacePreviewListTile extends StatelessWidget {
  PlacePreviewListTile({
    Key? key,
    required PlacePreviewType place,
    bool? hasDivider,
    required String distance,
    void Function()? onTap,
  })  : _place = place,
        _hasDivider = hasDivider ?? true,
        _distance = distance,
        _onTap = onTap,
        super(key: key);

  final PlacePreviewType _place;
  bool _hasDivider;
  String _distance;
  void Function()? _onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: CircleAvatar(
                          backgroundColor: WcColors.blue100,
                          radius: 2.5,
                        ),
                      ),
                      Text('진료 중',
                          style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600)),
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
              height: 4,
              width: 37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: WcColors.grey80,
              ),
              margin: EdgeInsets.only(top: 13, bottom: 2),
            ),
            PlacePreviewListTile(
              place: _place,
              hasDivider: false,
              distance: _distance,
            ),
            Container(
              width: WcWidth - 30,
              height: 50,
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/call.png',
                    height: 50,
                    width: 50,
                  ),
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
