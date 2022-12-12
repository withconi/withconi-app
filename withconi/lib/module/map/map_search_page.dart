import 'dart:ui';

import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/core/tools/helpers/search_highlighter.dart';
import 'package:withconi/module/common/my_lazy_load_scroll_view.dart';
import 'package:withconi/module/community/controllers/custom_state_mixin.dart';
import 'package:withconi/module/map/controllers/map_search_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/global_widgets/searchbar/search_bar.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';
import '../../data/enums/enum.dart';
import '../../global_widgets/appbar/search_appbar.dart';
import '../../global_widgets/loading/loading_page.dart';
import '../page_status.dart';
import '../theme/text_theme.dart';
import '../../global_widgets/error_widget/error_widget.dart';
import 'map_main_page.dart';

class MapSearchPage extends StatelessWidget {
  const MapSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapSearchController _controller = Get.find();
    return Scaffold(
      appBar: WcSearchAppBar(
        hintText: '동물병원/약국 검색',
        textEditingController: _controller.placeNameTextController,
        onClearTap: _controller.clearResult,
        onTextChanged: _controller.onSearchChanged,
        // onTextFieldTap: _controller.onSearchBarTap,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: WcColors.white,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: SizedBox(
            width: WcWidth,
            height: WcHeight,
            child: Stack(fit: StackFit.loose, children: [
              _getWidgetByState(_controller),
              Positioned(
                bottom: 25,
                right: 20,
                child: Obx(
                  () => SetLocationButton(
                    pageStatus: _controller.buttonStatus.value,
                    // isLocationChanged: _controller.isLocationChanged.value,
                    onTap: _controller.onTapSearchPinButton,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _getWidgetByState(MapSearchController _controller) {
    return _controller.obx(
      onInit: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            MyNaverMapView(
              baseSearchLocation: _controller.baseLocation,
              onMapCreated: _controller.onMapCreated,
              onCameraChange: _controller.onCameraChange,
            ),
            Positioned(
              child: MyLocationButton(
                onTap: _controller.onCurrentLocationButtonTap,
              ),
              bottom: 85,
              right: 3,
            ),
            Center(
              child: Image.asset(
                'assets/icons/location_pin.png',
                width: 33,
              ),
            ),
          ],
        ),
      ),
      onSuccess: (placeSearched) => MyLazyLoadScrollView(
          isLoading: (_controller.status == PageStatus.loadingMore() ||
              _controller.status == PageStatus.emptyLastPage()),
          onEndOfPage: _controller.loadNextPage,
          child: Stack(
            children: [
              ListView.builder(
                itemCount: placeSearched.length,
                shrinkWrap: false,
                itemBuilder: (context, index) => PlaceSimpleListTile(
                  baseLocation: _controller.baseLocation,
                  keywords: _controller.searchKeyword,
                  onTap: _controller.onPlaceSelected,
                  index: index,
                  place: placeSearched[index],
                ),
              ),
              (_controller.status == PageStatus.loadingMore())
                  ? Positioned(
                      bottom: 0,
                      child: Center(
                        child: Container(
                          width: WcWidth,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                              child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: WcColors.grey100,
                            ),
                          )),
                        ),
                      ))
                  : SizedBox.shrink(),
            ],
          )),
    );
  }
}

class SetLocationButton extends StatelessWidget {
  SetLocationButton({
    Key? key,
    // required this.isLocationChanged,
    required this.onTap,
    required this.pageStatus,
    // required this.pageStatus,
  }) : super(key: key);
  void Function() onTap;
  // bool isLocationChanged;

  PageStatus pageStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        alignment: Alignment.center,
        width: (pageStatus == PageStatus.init()) ? WcWidth - 40 : 205,
        height: 53,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              (pageStatus == PageStatus.init())
                  ? Icons.my_location_rounded
                  : Icons.location_on,
              size: 22,
              color: WcColors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              (pageStatus == PageStatus.init())
                  ? '이 장소 기준으로 검색'
                  : '새로운 장소 기준 설정',
              style: TextStyle(
                fontFamily: WcFontFamily.notoSans,
                fontSize: 16,
                height: 1.3,
                fontWeight: FontWeight.w500,
                color: WcColors.white,
              ),
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: WcColors.blue100,
          boxShadow: const [
            // BoxShadow(
            //   color: Color.fromARGB(35, 0, 0, 0),
            //   spreadRadius: -1,
            //   blurRadius: 30,
            //   offset: Offset(0, 0),
            // ),

            BoxShadow(
              color: Color.fromARGB(40, 0, 0, 0),
              spreadRadius: -3,
              blurRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceSimpleListTile extends StatelessWidget {
  PlaceSimpleListTile(
      {Key? key,
      required this.onTap,
      required this.baseLocation,
      required this.index,
      required this.keywords,
      required this.place})
      : super(key: key);
  PlacePreviewUIModel place;

  int index;
  void Function(int) onTap;
  String keywords;
  LatLngUIModel baseLocation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call(index);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
        height: 75,
        width: WcWidth,
        decoration: BoxDecoration(
            color: WcColors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: WcColors.grey80))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: Image.asset(
              place.placeType.unselectedImagePng,
              height: 23,
            ),
          ),
          SizedBox(
            width: 13,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      children: highlightOccurrences(
                          place.name,
                          keywords,
                          TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              fontSize: 17,
                              color: WcColors.black,
                              fontWeight: FontWeight.w700)),
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          fontSize: 17,
                          color: WcColors.grey200,
                          fontWeight: FontWeight.w500)),
                  softWrap: false,
                ),
                Text(place.address,
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        color: WcColors.grey140,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        height: 1.5,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          SizedBox(
            width: 80,
            height: 45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(place.placeType.displayName,
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 14,
                        color: WcColors.grey140,
                        fontWeight: FontWeight.w500)),
                Text(place.distanceString(baseLocation),
                    style: GoogleFonts.openSans(
                        color: WcColors.grey140,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
