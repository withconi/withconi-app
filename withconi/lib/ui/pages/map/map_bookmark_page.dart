import 'package:flutter_svg/svg.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/common_controller/my_post_controller.dart';
import 'package:withconi/import_basic.dart';
import '../../theme/text_theme.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/listtile/post_list_tile.dart';
import 'map_search_page.dart';

class MapBookmarkPage extends StatelessWidget {
  MapBookmarkPage({Key? key}) : super(key: key);
  final MyPostPageController _controller = Get.put(MyPostPageController());

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: WcWidth,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      '내 장소 즐겨찾기',
                      style: GoogleFonts.notoSans(
                          color: WcColors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.4),
                    ),
                  ),
                  Container(
                    width: WcWidth,
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          '${_controller.userPostList.length}',
                          style: GoogleFonts.montserrat(
                            color: WcColors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '개',
                          style: GoogleFonts.montserrat(
                            color: WcColors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Obx(
                  //   () => ListView.builder(
                  //       cacheExtent: 1000,
                  //       physics: const NeverScrollableScrollPhysics(),
                  //       itemCount: _controller.userPostList.length,
                  //       shrinkWrap: true,
                  //       itemBuilder: ((context, index) {
                  //         return WcUserPostListTile(
                  //           commentsNum: 23,
                  //           contents: _controller.userPostList[index].content,
                  //           likesNum: 12,
                  //           postType: _controller.userPostList[index].postType,
                  //           uploadAt: _controller.uploadAtStr(index),
                  //           liked: _controller.isLiked.value,
                  //           authorName:
                  //               _controller.userPostList[index].nickname,
                  //           onLikeChanged: (_) {},
                  //           blockLikeButton: true,
                  //           onLikeTap: _controller.onLikeTap,
                  //           badgeBackgroundColor:
                  //               _controller.badgeBackgroundColor(index),
                  //           badgeTextColor: _controller.badgeTextColor(index),
                  //           onCommentTap: () {
                  //             _controller.onLikeTap();
                  //           },
                  //           onPostTap: () {
                  //             Get.toNamed(Routes.COMMUNITY_POST_DETAIL);
                  //           },
                  //           activeMore: true,
                  //           images: _controller.images,
                  //           onMoreTap: () {
                  //             Get.toNamed(Routes.COMMUNITY_POST_EDIT,
                  //                 arguments: _controller.userPostList[index]);
                  //           },
                  //         );
                  //       })),
                  // )

                  PlaceBookmarkListTile(
                    address: '서울시 동작구 어쩌동',
                    distance: '',
                    placeName: '참편한 동물병원',
                    placeType: PlaceType.hospital,
                  ),
                ],
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
    required this.address,
    required this.placeType,
    required this.placeName,
    required this.distance,
    this.onBookmarkTap,
    this.onTap,
  }) : super(key: key);

  String address;
  PlaceType placeType;
  String placeName;
  String distance;
  void Function()? onTap;
  void Function()? onBookmarkTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 12, 0, 0),
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
              'assets/icons/hospital_unclicked.png',
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
                Text(placeName,
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 17,
                        fontWeight: FontWeight.w500)),
                Text(address,
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        color: WcColors.grey120,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        height: 1.5,
                        fontWeight: FontWeight.w500)),
                // Row(
                //   children: [
                //     Text('리뷰',
                //         style: TextStyle(
                //             height: 1.5,
                //             fontFamily: WcFontFamily.notoSans,
                //             fontSize: 13,
                //             color: WcColors.grey140,
                //             fontWeight: FontWeight.w500)),
                //     SizedBox(
                //       width: 5,
                //     ),
                //     Text('24',
                //         style: TextStyle(
                //             height: 1.5,
                //             fontFamily: WcFontFamily.notoSans,
                //             fontSize: 13,
                //             color: WcColors.grey200,
                //             fontWeight: FontWeight.w500)),
                //   ],
                // ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onBookmarkTap,
            child: Container(
                width: 50,
                height: 40,
                padding: EdgeInsets.only(right: 20),
                alignment: Alignment.topRight,
                color: WcColors.white,
                child: SvgPicture.asset(
                  'assets/icons/bookmark.svg',
                  width: 16,
                )),
          )
        ]),
      ),
    );
  }
}
