import 'dart:io';

import 'package:withconi/ui/widgets/button/icon_button.dart';

import '../../../import_basic.dart';
import '../../pages/community/community_board_detail_page.dart';
import '../badge/badge.dart';
import '../button/icon_text_button.dart';

class WcCommentListTile extends StatelessWidget {
  WcCommentListTile({
    Key? key,
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
    required this.onLikeTap,
    this.onCommentTap,
    this.onPostTap,
    this.activeBadge = true,
    this.activeComment = true,
    this.activeLike = true,
  }) : super(key: key);

  String authorName;
  String uploadAt;
  String? badgeText;
  Color? badgeBackgroundColor;
  Color? badgeTextColor;
  String contents;
  bool liked;
  int likesNum;
  int commentsNum;
  void Function()? onLikeTap;
  void Function()? onCommentTap;
  void Function()? onPostTap;
  File? userProfile;
  bool activeBadge;
  bool activeComment;
  bool activeLike;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPostTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: WcColors.grey80))),
        width: WcWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18,
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
                            height: 19,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  authorName,
                                  style: GoogleFonts.notoSans(
                                      color: WcColors.grey200,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5),
                                ),
                                Text(
                                  ' • $uploadAt시간 전',
                                  style: GoogleFonts.notoSans(
                                      color: WcColors.grey140,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                ),
                                (activeBadge)
                                    ? WcBadge(
                                        text: badgeText ?? '',
                                        backgroundColor: badgeBackgroundColor ??
                                            Colors.transparent,
                                        textColor: badgeTextColor ??
                                            Colors.transparent,
                                      )
                                    : SizedBox.shrink()
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
                                maxLines: 3,
                                minLines: 1,
                                style: GoogleFonts.notoSans(
                                    fontSize: 14,
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
                  height: 35,
                  width: WcWidth - 40 - 46,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (activeLike)
                          ? Row(
                              children: [
                                WcIconTextButton(
                                  active: liked,
                                  activeIconColor: WcColors.red100,
                                  iconSrc: 'assets/icons/heart.svg',
                                  inactiveIconColor: WcColors.grey100,
                                  onTap: onLikeTap,
                                  text: '34',
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
                              text: '34',
                            )
                          : SizedBox.shrink(),
                      WcIconButton(
                          active: true,
                          onTap: () {},
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
      ),
    );
  }
}
