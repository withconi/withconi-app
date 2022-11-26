import 'dart:io';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/button/icon_button.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import '../../data/enums/enum.dart';

import '../../module/community/widgets/more_tap_bottom_sheet.dart';
import '../../import_basic.dart';
import '../badge/badge.dart';
import '../button/icon_text_button.dart';
import '../button/like_button.dart';

class PostListTile extends StatelessWidget {
  PostListTile(
      {Key? key,
      this.liked,
      required this.post,
      this.badgeText,
      // this.onLikeChanged,
      required this.onPostTap,
      required this.postIndex,
      this.onMoreTap,
      this.simple = false,
      this.activeBadge = true,
      required this.onLikeTap})
      : super(key: key);
  bool simple;
  String? badgeText;
  bool? liked;
  PostUIModel post;
  // void Function(int, bool)? onLikeChanged;
  int postIndex;
  void Function(int postIndex) onPostTap;
  void Function(int, MoreOption?)? onMoreTap;
  void Function(bool) onLikeTap;
  File? userProfile;
  bool activeBadge;

  // String uploadAtStr(DateTime createdAt) =>
  //     TimeCalculator().calculateUploadAt(createdAt);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPostTap.call(postIndex);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 24, 0, 0),
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Text(' • ${post.uploadAtStr}',
                                      style: TextStyle(
                                          fontFamily: WcFontFamily.notoSans,
                                          color: WcColors.grey140,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5)),
                                  (activeBadge)
                                      ? WcBadge(
                                          text: post.postType!.displayName,
                                          backgroundColor:
                                              post.postType!.backgroundColor,
                                          textColor: post.postType!.textColor,
                                        )
                                      : const SizedBox.shrink()
                                ],
                              ),
                            ),
                            Offstage(
                              offstage: post.images.isEmpty,
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
                                                      Color.fromARGB(
                                                          14, 0, 0, 0),
                                                      Colors.transparent,
                                                      Colors.transparent,
                                                      Color.fromARGB(
                                                          14, 0, 0, 0),
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
                                                    image:
                                                        image.getImageByType),
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
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                // color: WcColors.beidgeLight,
                                padding: EdgeInsets.only(bottom: 14),
                                child: Row(
                                  children: [
                                    WcLikeButton(
                                      likeNum: post.likeNum,
                                      isLikeOn: liked ?? false,
                                      onLikeTap: onLikeTap,
                                    ),
                                    WcIconTextButton(
                                      active: true,
                                      activeIconColor: WcColors.grey100,
                                      iconSrc: 'assets/icons/comment.svg',
                                      inactiveIconColor: WcColors.grey100,
                                      onTap: () {},
                                      text: post.commentNum.toString(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                // color: WcColors.blue20,
                                padding:
                                    const EdgeInsets.only(bottom: 14, left: 15),
                                child: WcIconButton(
                                    active: true,
                                    onTap: () async {
                                      MoreOption? selectedOption =
                                          await showMoreBottomSheet(
                                        authorId: post.authorId,
                                        authorName: post.nickname,
                                      );
                                      onMoreTap!
                                          .call(postIndex, selectedOption);
                                    },
                                    touchWidth: 43,
                                    touchHeight: 30,
                                    iconHeight: 23,
                                    backgroundColor: Colors.white,
                                    iconSrc: 'assets/icons/dots.svg',
                                    activeIconColor: WcColors.grey100,
                                    iconMainAxisAlignment:
                                        MainAxisAlignment.start,
                                    inactiveIconColor: WcColors.grey100),
                              ),
                            )
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WcLikeButton extends StatelessWidget {
  WcLikeButton({
    Key? key,
    required this.isLikeOn,
    required this.onLikeTap,
    required this.likeNum,
    this.iconSize = 20,
  }) : super(key: key);

  bool isLikeOn;
  void Function(bool) onLikeTap;
  double iconSize;
  int likeNum;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            onLikeTap.call(!isLikeOn);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 5, 20, 4),
            color: Colors.white,
            child: Row(
              children: [
                Icon(
                  (Icons.favorite),
                  color: (isLikeOn) ? WcColors.red100 : WcColors.grey100,
                  size: iconSize,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  likeNum.toString(),
                  style: GoogleFonts.workSans(
                    fontSize: 16,
                    color: WcColors.grey140,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
