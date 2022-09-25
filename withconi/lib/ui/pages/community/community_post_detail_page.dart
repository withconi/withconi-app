import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/widgets/button/icon_button.dart';
import 'package:withconi/ui/widgets/button/like_button.dart';
import 'package:withconi/ui/widgets/listtile/comment_list_tile.dart';
import 'package:withconi/ui/widgets/photo_gallary/image_item.dart';
import '../../../controller/community/community_post_detail_controller.dart';
import '../../../data/model/comment.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/badge/badge.dart';
import '../../widgets/button/icon_text_button.dart';
import '../../widgets/photo_gallary/photo_gallary.dart';

class CommunityPostDetailPage extends StatelessWidget {
  CommunityPostDetailPage({Key? key}) : super(key: key);
  final CommunityPostDetailController _controller =
      Get.put(CommunityPostDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          width: WcWidth,
          child: Row(
            children: [
              const CircleAvatar(
                radius: 21,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _controller.addComment();
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 50,
                    color: WcColors.white,
                    child: Text(
                      '댓글을 남겨보세요',
                      style: GoogleFonts.notoSans(
                          fontSize: 15, color: WcColors.grey120),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
      appBar: WcAppBar(
        title: '커뮤니티',
        leading: SvgPicture.asset(
          'assets/icons/arrow_back.svg',
          color: WcColors.grey200,
        ),
        onLeadingTap: () {
          Get.back();
        },
      ),
      backgroundColor: WcColors.white,
      body: SingleChildScrollView(
        // onEndOfPage: () {},
        // isLoading: _controller.lastPage,
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: WcColors.grey80))),
                width: WcWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: WcWidth - 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 2),
                                child: CircleAvatar(
                                  radius: 16,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                _controller.thisPost.value.nickname,
                                style: GoogleFonts.notoSans(
                                    color: WcColors.grey200,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 0.98),
                              ),
                              Text(
                                ' • ${1}시간 전',
                                style: GoogleFonts.notoSans(
                                    color: WcColors.grey140,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              WcBadge(
                                text: '고양이',
                                textSize: 14,
                                backgroundColor: WcColors.blue40,
                                textColor: WcColors.blue100,
                                width: 60,
                                height: 26,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          SizedBox(
                            height: 180,
                            child: Material(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  // side: BorderSide(color: Colors.blue), if you need
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      PhotoView().openPhotoView(
                                          _controller.currentImageIndex.value,
                                          _controller.images);
                                    },
                                    child: SizedBox(
                                      height: 180,
                                      width: WcWidth - 40,
                                      child: CarouselSlider(
                                        options: CarouselOptions(
                                            onPageChanged: (index, reason) =>
                                                _controller.currentImageIndex
                                                    .value = index,
                                            height: 180.0,
                                            viewportFraction: 1),
                                        items: _controller.images.map((image) {
                                          return Container(
                                            width: WcWidth - 40,
                                            foregroundDecoration:
                                                const BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color.fromARGB(20, 0, 0, 0),
                                                    Colors.transparent,
                                                    Colors.transparent,
                                                    Color.fromARGB(70, 0, 0, 0),
                                                  ],
                                                  stops: [
                                                    0.0,
                                                    0.2,
                                                    0.8,
                                                    1
                                                    // 1
                                                  ]),
                                            ),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: image.toImageByType()),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 7,
                                      right: 7,
                                      child: SvgPicture.asset(
                                        'assets/icons/image_multiple.svg',
                                        color: WcColors.grey60,
                                        width: 28,
                                      )),
                                  Positioned(
                                    bottom: 15,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: WcWidth - 40,
                                      child: Obx(
                                        () => CarouselIndicator(
                                          animationDuration: 200,
                                          color: Color.fromARGB(
                                              119, 255, 255, 255),
                                          width: 12,
                                          height: 5,
                                          count: _controller.images.length,
                                          index: _controller
                                              .currentImageIndex.value,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextField(
                              readOnly: true,
                              controller: TextEditingController(
                                  text:
                                      '저희집 고양이가 잘 먹는 사료 소개합니다.\n어쩌구 저쩌구 이건 제목이 아니고 글입니다,저희집 고양이가 잘 먹는 사료 소개합니다. \n어쩌구 저쩌구 이건 제목이 아니고 글입니다,\n저희집 고양이가 잘 먹는 사료 소개합니다. 어쩌구 저쩌구 이건 제목이 아니고 글입니다.저희집 고양이가 잘 먹는 사료 소개합니다. 어쩌구 저쩌구 이건 제목이 아니고 글입니다.저희집 고양이가 잘 먹는 사료 소개합니다. 어쩌구 저쩌구 이건 제목이 아니고 글입니다'),
                              style: GoogleFonts.notoSans(
                                  color: WcColors.black,
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.w500,
                                  height: 1.6),
                              maxLines: 100,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              )),
                          SizedBox(
                            height: 50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    WcLikeButton(
                                      valueChanged: (_) {},
                                      likeNum: '34',
                                      isLiked: true,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    WcIconTextButton(
                                      active: true,
                                      activeIconColor: WcColors.grey100,
                                      iconSrc: 'assets/icons/comment.svg',
                                      inactiveIconColor: WcColors.grey100,
                                      onTap: () {},
                                      text: '34',
                                      iconHeight: 19,
                                    ),
                                  ],
                                ),
                                WcIconButton(
                                  active: true,
                                  activeIconColor: WcColors.grey100,
                                  iconSrc: 'assets/icons/dots.svg',
                                  iconHeight: 23,
                                  inactiveIconColor: WcColors.grey100,
                                  onTap: () {
                                    print('dots');
                                  },
                                  touchWidth: 50,
                                  touchHeight: 30,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Text('댓글',
                    style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w600, fontSize: 19)),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controller.commentList.length,
                    itemBuilder: ((context, index) {
                      Comment thisComment = _controller.commentList[index];
                      return WcCommentListTile(
                        activeBadge: false,
                        activeComment: false,
                        commentsNum: 23,
                        contents: thisComment.content,
                        likesNum: 12,
                        uploadAt:
                            _controller.uploadAtStr(thisComment.createdAt),
                        liked: false,
                        authorName: thisComment.nickname,
                        onLikeTap: (_) {},
                        onMoreTap: () {
                          _controller.onMoreTap(
                              authorId: thisComment.authorId!,
                              authorNickname: thisComment.nickname);
                        },
                        badgeBackgroundColor: WcColors.blue40,
                        badgeTextColor: WcColors.blue100,
                      );
                    }));
              })
            ],
          ),
        ),
      ),
    );
  }
}
