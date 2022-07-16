import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/import_basic.dart';
import '../../../controller/community/community_post_detail_controller.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/badge/badge.dart';
import '../../widgets/button/icon_text_button.dart';
import '../../widgets/post/user_postbox.dart';

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
              CircleAvatar(
                radius: 21,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.COMMUNITY_NEW_POST);
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
                              CircleAvatar(
                                radius: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                _controller.thisPost.value.nickname,
                                style: GoogleFonts.notoSans(
                                    color: WcColors.grey200,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    height: 0.8),
                              ),
                              Text(
                                ' • ${1}시간 전',
                                style: GoogleFonts.notoSans(
                                    color: WcColors.grey140,
                                    fontSize: 15,
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
                                height: 28,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          SizedBox(
                            height: 200,
                            child: Material(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  // side: BorderSide(color: Colors.blue), if you need
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13.0))),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: WcWidth - 40,
                                    child: CarouselSlider(
                                      options: CarouselOptions(
                                          height: 200.0, viewportFraction: 1),
                                      items: [1, 2, 3, 4, 5].map((i) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return Container(
                                              width: WcWidth - 40,
                                              foregroundDecoration:
                                                  const BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color.fromARGB(
                                                          20, 0, 0, 0),
                                                      Colors.transparent,
                                                      Colors.transparent,
                                                      Color.fromARGB(
                                                          70, 0, 0, 0),
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
                                                    image: NetworkImage(
                                                        'https://blog.kakaocdn.net/dn/rtgCl/btq6QthUvct/raf0kBKf6zELmZHR5XzDI1/img.jpg')),
                                              ),
                                            );
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  // AbsorbPointer(
                                  //   absorbing: false,
                                  //   child: Container(
                                  //     width: WcWidth - 40,
                                  //     decoration: BoxDecoration(
                                  //       gradient: LinearGradient(
                                  //           begin: Alignment.topCenter,
                                  //           end: Alignment.bottomCenter,
                                  //           colors: [
                                  //             Color.fromARGB(33, 0, 0, 0),
                                  //             Color.fromARGB(11, 0, 0, 0),
                                  //             Colors.transparent,
                                  //             Color.fromARGB(11, 0, 0, 0),
                                  //             Color.fromARGB(53, 0, 0, 0),
                                  //           ],
                                  //           stops: [
                                  //             0.0,
                                  //             0.1,
                                  //             0.1,
                                  //             0.8,
                                  //             1
                                  //           ]),
                                  //     ),
                                  //   ),
                                  // ),
                                  Positioned(
                                      top: 7,
                                      right: 7,
                                      child: SvgPicture.asset(
                                        'assets/icons/image_multiple.svg',
                                        color: WcColors.grey60,
                                        width: 32,
                                      )),
                                  Positioned(
                                    bottom: 17,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: WcWidth - 40,
                                      child: CarouselIndicator(
                                        color:
                                            Color.fromARGB(119, 255, 255, 255),
                                        width: 13,
                                        count: 4,
                                        index: 2,
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5),
                              maxLines: 100,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              )),
                          SizedBox(
                            height: 50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                WcIconTextButton(
                                  active: false,
                                  activeIconColor: WcColors.red100,
                                  iconSrc: 'assets/icons/heart.svg',
                                  inactiveIconColor: WcColors.grey100,
                                  onTap: () {},
                                  text: '34',
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                                WcIconTextButton(
                                  active: true,
                                  activeIconColor: WcColors.grey100,
                                  iconSrc: 'assets/icons/comment.svg',
                                  inactiveIconColor: WcColors.grey100,
                                  onTap: () {},
                                  text: '34',
                                )
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
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Text('댓글',
                    style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w600, fontSize: 19)),
              ),
              Obx(
                () => Column(
                  children: _controller.commentList
                      .map((post) => WcUserPostListTile(
                            activeBadge: false,
                            activeComment: false,
                            commentsNum: 23,
                            contents: post.content,
                            likesNum: 12,
                            uploadAt: '1',
                            liked: false,
                            authorName: post.nickname,
                            onLikeTap: () {
                              // if (_controller.userLikedPost
                              //     .contains(post.itemId)) {
                              //   _controller.userLikedPost.remove(post.itemId);
                              // } else {
                              //   _controller.userLikedPost.add(post.itemId);
                              // }
                            },
                            badgeBackgroundColor: WcColors.blue40,
                            badgeTextColor: WcColors.blue100,
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
