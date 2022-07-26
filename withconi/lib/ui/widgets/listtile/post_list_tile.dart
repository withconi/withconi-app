import 'dart:io';
import 'package:withconi/ui/widgets/button/icon_button.dart';
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
                                onTap: () {
                                  print('asdfa');
                                },
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
