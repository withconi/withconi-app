import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/core/tools/helpers/search_highlighter.dart';
import 'package:withconi/module/common/lazy_load.dart';
import 'package:withconi/module/map/controllers/map_search_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/global_widgets/searchbar/search_bar.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';
import '../../data/enums/enum.dart';
import '../../global_widgets/appbar/search_appbar.dart';
import '../../global_widgets/loading/loading_page.dart';
import '../page_status.dart';
import '../theme/text_theme.dart';
import '../../global_widgets/error_widget/error_widget.dart';

class MapSearchPage extends StatelessWidget {
  const MapSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapSearchController _controller = Get.find();
    return Scaffold(
      appBar: WcSearchAppBar(
        hintText: '동물병원/약국 검색',
        textEditingController: _controller.placeNameTextController,
        onClearTap: _controller.clearResult,
        onTextChanged: _controller.onSearchChanged,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: WcColors.white,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: SizedBox(
            width: WcWidth,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SearchBarWidget(
                //   textController: _controller.placeNameTextController,
                //   onTextChanged: _controller.onSearchChanged,
                //   onTapAction: _controller.clearResult,
                //   hintText: '동물병원/약국 검색',
                //   boxShadow: const [
                //     BoxShadow(
                //       color: Color.fromARGB(50, 0, 0, 0),
                //       spreadRadius: -2,
                //       blurRadius: 5,
                //       offset: Offset(0, 1),
                //     ),
                //   ],
                //   margin: EdgeInsets.symmetric(vertical: 20),
                // ),
                Divider(
                  height: 10,
                  color: WcColors.grey20,
                  thickness: 10,
                ),
                Obx(() => _getWidgetByState(
                    _controller.pageStatus.value, _controller)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getWidgetByState(PageStatus status, MapSearchController _controller) {
    return status.maybeWhen(
      init: () => SizedBox.shrink(),
      loading: () => LoadingPage(
        height: WcHeight - 300,
      ),
      empty: () => WcErrorWidget(
        image: Image.asset(
          'assets/icons/no_result.png',
          height: 90,
        ),
        title: '검색 결과가 없습니다',
        message: '다른 검색어로 시도해주세요 :)',
      ),
      error: (message) => WcErrorWidget(
        image: Image.asset(
          'assets/icons/no_result.png',
          height: 90,
        ),
        title: message,
        message: '',
      ),
      orElse: () => Expanded(
        child: MyLazyLoadScrollView(
          isLoading: (status == PageStatus.loadingMore() ||
              status == PageStatus.emptyLastPage()),
          onEndOfPage: _controller.loadNextPage,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _controller.placeListSearched.length,
            itemBuilder: (context, index) => PlaceSimpleListTile(
              keywords: _controller.mapSearchFilter.value.keyword!,
              onTap: _controller.onPlaceSelected,
              index: index,
              place: _controller.placeListSearched[index],
            ),
          ),
        ),
      ),
    );
  }
}

class PlaceSimpleListTile extends StatelessWidget {
  PlaceSimpleListTile(
      {Key? key,
      // required this.address,
      // required this.placeType,
      // required this.placeName,
      // required this.distance,
      required this.onTap,
      // required this.placeIconSrc,
      required this.index,
      required this.keywords,
      required this.place})
      : super(key: key);
  PlacePreviewUiModel place;
  // String address;
  // PlaceType placeType;
  // String placeName;
  // String distance;
  // String placeIconSrc;
  int index;
  void Function(int) onTap;
  String keywords;

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
                Text(place.distanceString,
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
