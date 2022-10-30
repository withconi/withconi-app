import 'dart:io';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/module/widgets/button/icon_button.dart';
import 'package:withconi/module/widgets/photo_gallary/image_item.dart';
import '../../../data/enums/enum.dart';
import '../../../data/enums/enum_color.dart';
import '../../../core/tools/helpers/calculator.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/community/communty_widgets/more_tap_bottom_sheet.dart';
import '../../../data/model/post.dart';
import '../../../import_basic.dart';
import '../badge/badge.dart';
import '../button/icon_text_button.dart';
import '../button/like_button.dart';

class PostListTile extends StatelessWidget {
  PostListTile(
      {Key? key,
      this.liked,
      required this.post,
      this.badgeText,
      this.onLikeChanged,
      required this.onPostTap,
      this.onMoreTap,
      this.simple = false,
      this.activeBadge = true,
      this.onLikeTap})
      : super(key: key);
  bool simple;
  String? badgeText;
  bool? liked;
  Post post;
  void Function(String, bool)? onLikeChanged;

  void Function(Post post) onPostTap;
  void Function(Post, MoreOption?)? onMoreTap;
  void Function()? onLikeTap;
  File? userProfile;
  bool activeBadge;

  String uploadAtStr(DateTime createdAt) =>
      TimeCalculator().calculateUploadAt(createdAt);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPostTap.call(post);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 24, 20, 16),
        decoration: BoxDecoration(
            color: WcColors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: WcColors.grey80))),
        width: WcWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 17,
              backgroundColor: WcColors.grey110,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(post.nickname,
                                    style: TextStyle(
                                        fontFamily: WcFontFamily.notoSans,
                                        color: WcColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5)),
                                Text(' • ${uploadAtStr(post.createdAt)}',
                                    style: TextStyle(
                                        fontFamily: WcFontFamily.notoSans,
                                        color: WcColors.grey140,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5)),
                                (activeBadge)
                                    ? WcBadge(
                                        text: post.postType.displayName,
                                        backgroundColor:
                                            postTypeBackgroundColor(
                                                post.postType),
                                        textColor:
                                            postTypeTextColor(post.postType),
                                      )
                                    : const SizedBox.shrink()
                              ],
                            ),
                          ),
                          Visibility(
                            visible: post.images.isNotEmpty,
                            child: Container(
                              height: 170,
                              margin: EdgeInsets.only(top: 15),
                              child: Material(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height: 180,
                                      width: WcWidth - 90,
                                      child: CarouselSlider(
                                        options: CarouselOptions(
                                            enableInfiniteScroll: false,
                                            onPageChanged: (index, reason) {},
                                            height: 180.0,
                                            viewportFraction: 1),
                                        items: post.images.map((image) {
                                          return Container(
                                            width: WcWidth - 90,
                                            foregroundDecoration:
                                                const BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color.fromARGB(14, 0, 0, 0),
                                                    Colors.transparent,
                                                    Colors.transparent,
                                                    Color.fromARGB(14, 0, 0, 0),
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
                                    Visibility(
                                      visible: post.images.length > 1,
                                      child: Positioned(
                                          top: 7,
                                          right: 7,
                                          child: Image.asset(
                                            'assets/icons/image_multiple.png',
                                            width: 20,
                                            colorBlendMode:
                                                BlendMode.luminosity,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: WcWidth - 40 - 46,
                            child: IgnorePointer(
                              ignoring: true,
                              child: TextField(
                                decoration: const InputDecoration(
                                    border: InputBorder.none, isDense: true),
                                controller:
                                    TextEditingController(text: post.content),
                                readOnly: true,
                                maxLines: 4,
                                minLines: 1,
                                style: TextStyle(
                                    fontFamily: WcFontFamily.notoSans,
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                (simple)
                    ? SizedBox()
                    : Column(
                        children: [
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            color: Colors.transparent,
                            width: WcWidth - 40 - 46,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        WcLikeButton(
                                          valueChanged: (isLike) {
                                            if (onLikeChanged != null) {
                                              onLikeChanged!
                                                  .call(post.postId!, isLike);
                                            }
                                          },
                                          isLiked: liked ?? false,
                                          onLikeTap: onLikeTap,
                                        ),
                                        Text(
                                          post.likeNum.toString(),
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            color: WcColors.grey140,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 18,
                                        ),
                                      ],
                                    ),
                                    WcIconTextButton(
                                      active: true,
                                      activeIconColor: WcColors.grey100,
                                      iconSrc: 'assets/icons/comment.svg',
                                      inactiveIconColor: WcColors.grey100,
                                      onTap: () {},
                                      text: post.commentNum.toString(),
                                    )
                                  ],
                                ),
                                WcIconButton(
                                    active: true,
                                    onTap: () async {
                                      MoreOption? selectedOption =
                                          await showMoreBottomSheet(
                                        userId:
                                            AuthController.to.wcUser.value!.uid,
                                        authorId: post.authorId,
                                        authorName: post.nickname,
                                      );
                                      onMoreTap!.call(post, selectedOption);
                                    },
                                    iconHeight: 22,
                                    touchWidth: 50,
                                    touchHeight: 30,
                                    backgroundColor: Colors.white,
                                    iconSrc: 'assets/icons/dots.svg',
                                    activeIconColor: WcColors.grey100,
                                    inactiveIconColor: WcColors.grey100)
                              ],
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
