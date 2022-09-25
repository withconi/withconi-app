import 'dart:io';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/ui/widgets/button/icon_button.dart';
import 'package:withconi/ui/widgets/photo_gallary/image_item.dart';
import '../../../configs/constants/enum.dart';
import '../../../import_basic.dart';
import '../badge/badge.dart';
import '../button/icon_text_button.dart';
import '../button/like_button.dart';

class WcUserPostListTile extends StatelessWidget {
  WcUserPostListTile(
      {Key? key,
      required this.authorName,
      required this.uploadAt,
      required this.contents,
      required this.liked,
      required this.likesNum,
      required this.commentsNum,
      required this.images,
      this.badgeText,
      this.badgeBackgroundColor,
      this.badgeTextColor,
      this.userProfile,
      required this.onLikeChanged,
      this.onCommentTap,
      this.onPostTap,
      this.onMoreTap,
      this.activeBadge = true,
      this.activeComment = true,
      this.activeLike = true,
      this.activeMore = false,
      required this.postType,
      this.blockLikeButton = false,
      this.onLikeTap})
      : super(key: key);

  List<ImageItem> images;
  String authorName;
  String uploadAt;
  String? badgeText;
  Color? badgeBackgroundColor;
  Color? badgeTextColor;
  String contents;
  bool liked;
  int likesNum;
  int commentsNum;
  void Function(bool) onLikeChanged;
  void Function()? onCommentTap;
  void Function()? onPostTap;
  void Function()? onMoreTap;
  void Function()? onLikeTap;
  File? userProfile;
  bool activeBadge;
  bool activeComment;
  bool activeLike;
  bool activeMore;
  PostType postType;
  bool blockLikeButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPostTap,
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
                                Text(
                                  authorName,
                                  style: GoogleFonts.notoSans(
                                      color: WcColors.grey200,
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                      height: 1.4),
                                ),
                                Text(
                                  ' • $uploadAt',
                                  style: GoogleFonts.notoSans(
                                      color: WcColors.grey140,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      height: 1.4),
                                ),
                                (activeBadge)
                                    ? WcBadge(
                                        text: postTypeToKorean(postType),
                                        backgroundColor: badgeBackgroundColor ??
                                            Colors.transparent,
                                        textColor: badgeTextColor ??
                                            Colors.transparent,
                                      )
                                    : const SizedBox.shrink()
                              ],
                            ),
                          ),
                          Visibility(
                            visible: images.isNotEmpty,
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
                                            onPageChanged: (index, reason) {},
                                            height: 180.0,
                                            viewportFraction: 1),
                                        items: images.map((image) {
                                          return Container(
                                            width: WcWidth - 90,
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
                                    Visibility(
                                      visible: images.length > 1,
                                      child: Positioned(
                                          top: 7,
                                          right: 7,
                                          child: SvgPicture.asset(
                                            'assets/icons/image_multiple.svg',
                                            color: WcColors.grey60,
                                            width: 28,
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
                                    TextEditingController(text: contents),
                                readOnly: true,
                                maxLines: 4,
                                minLines: 1,
                                style: GoogleFonts.notoSans(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: Colors.transparent,
                    width: WcWidth - 40 - 46,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            (activeLike)
                                ? Row(
                                    children: [
                                      WcLikeButton(
                                        valueChanged: onLikeChanged,
                                        likeNum: likesNum.toString(),
                                        isLiked: liked,
                                        disableLike: blockLikeButton,
                                        onLikeTap: onLikeTap,
                                      ),
                                      SizedBox(
                                        width: 18,
                                      ),
                                    ],
                                  )
                                : SizedBox.shrink(),
                            (activeComment)
                                ? WcIconTextButton(
                                    active: true,
                                    activeIconColor: WcColors.grey100,
                                    iconSrc: 'assets/icons/comment.svg',
                                    inactiveIconColor: WcColors.grey100,
                                    onTap: onCommentTap,
                                    text: commentsNum.toString(),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                        (activeMore)
                            ? WcIconButton(
                                active: true,
                                onTap: onMoreTap,
                                iconHeight: 22,
                                touchWidth: 50,
                                touchHeight: 30,
                                backgroundColor: Colors.white,
                                iconSrc: 'assets/icons/dots.svg',
                                activeIconColor: WcColors.grey100,
                                inactiveIconColor: WcColors.grey100)
                            : SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
