import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/community/controllers/community_my_post_controller.dart';
import 'package:withconi/module/map/controllers/map_my_bookmark_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';
import '../theme/text_theme.dart';
import '../../global_widgets/appbar/appbar.dart';
import '../../global_widgets/listtile/post_list_tile.dart';
import 'map_search_page.dart';

class MapBookmarkPage extends StatelessWidget {
  const MapBookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapMyBookmarkController _controller = Get.find();
    return Scaffold(
      appBar: WcAppBar(
        title: '',
      ),
      backgroundColor: WcColors.white,
      body: Obx(
        () => RefreshIndicator(
          strokeWidth: 2.5,
          backgroundColor: WcColors.white,
          color: WcColors.blue100,
          onRefresh: _controller.resetPage,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _controller.scrollController.value,
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                height: WcHeight(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: WcWidth(context),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Text(
                        '즐겨찾기 한 장소',
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            color: WcColors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            height: 1.4),
                      ),
                    ),
                    Container(
                      width: WcWidth(context),
                      padding:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 17),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${_controller.bookmarkedPlaceList.length}',
                            style: GoogleFonts.workSans(
                              color: WcColors.black,
                              fontSize: 23,
                              height: 1,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '개',
                            style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              color: WcColors.black,
                              fontSize: 21,
                              height: 1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => ListView.builder(
                          cacheExtent: 1000,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _controller.bookmarkedPlaceList.length,
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            PlacePreviewUIModel thisPlace =
                                _controller.bookmarkedPlaceList[index];
                            return PlaceBookmarkListTile(
                              onTap: _controller.onPlaceTap,
                              index: index,
                              onBookmarkTap: _controller.onBookmarkTap,
                              isBookmarked: _controller
                                  .bookmarkedPlaceList[index].isBookmarked,
                              place: thisPlace,
                            );
                          })),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PlaceBookmarkListTile extends StatelessWidget {
  PlaceBookmarkListTile({
    Key? key,
    required this.place,
    this.onBookmarkTap,
    required this.onTap,
    required this.index,
    required this.isBookmarked,
    this.showBookmark = true,
  }) : super(key: key);

  PlacePreviewUIModel place;
  void Function(int) onTap;
  void Function(int, bool)? onBookmarkTap;
  bool isBookmarked;
  int index;
  bool showBookmark;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call(index);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
        width: WcWidth(context),
        decoration: BoxDecoration(
            color: WcColors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: WcColors.grey80))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: Image.asset(
              place.placeType.unselectedImagePng,
              height: 23,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(place.name,
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 17,
                        fontWeight: FontWeight.w500)),
                Text(place.address,
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        color: WcColors.grey140.withOpacity(0.8),
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        height: 1.6,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          Visibility(
            replacement: SizedBox(width: 10),
            visible: showBookmark,
            child: GestureDetector(
              onTap: () {
                onBookmarkTap!.call(index, !isBookmarked);
                print('clicked');
              },
              child: Container(
                  width: 50,
                  height: 40,
                  padding: EdgeInsets.only(right: 20),
                  alignment: Alignment.topRight,
                  color: WcColors.white,
                  child: SvgPicture.asset(
                    'assets/icons/bookmark.svg',
                    width: 15,
                    color: (isBookmarked) ? WcColors.blue100 : WcColors.grey110,
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
