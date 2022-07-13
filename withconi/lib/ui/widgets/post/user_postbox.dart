import 'dart:io';

import '../../../import_basic.dart';
import '../../pages/community/community_detail_page.dart';
import '../badge/badge.dart';
import '../button/icon_text_button.dart';

class WcUserPostBox extends StatelessWidget {
  WcUserPostBox({
    Key? key,
    required this.userName,
    required this.uploadAt,
    required this.contents,
    required this.userLiked,
    required this.likesNum,
    required this.commentsNum,
    required this.badgeText,
    required this.badgeBackgroundColor,
    required this.badgeTextColor,
    this.userProfile,
    required this.onLikeTap,
    required this.onCommentTap,
    required this.onPostTap,
    this.activeBadge = true,
    this.activeComment = true,
    this.activeLike = true,
  }) : super(key: key);

  String userName;
  String uploadAt;
  String badgeText;
  Color badgeBackgroundColor;
  Color badgeTextColor;
  String contents;
  bool userLiked;
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
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: WcColors.grey80))),
        width: WcWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 27,
            ),
            SizedBox(
              width: WcWidth - 40,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        height: 27,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: GoogleFonts.notoSans(
                                  color: WcColors.grey200,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  height: 1.4),
                            ),
                            Text(
                              ' • $uploadAt시간 전',
                              style: GoogleFonts.notoSans(
                                  color: WcColors.grey180,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 1.4),
                            ),
                            (activeBadge)
                                ? WcBadge(
                                    text: badgeText,
                                    backgroundColor: badgeBackgroundColor,
                                    textColor: badgeTextColor,
                                  )
                                : SizedBox.shrink()
                          ],
                        ),
                      ),
                      SizedBox(
                        width: WcWidth - 100,
                        child: IgnorePointer(
                          ignoring: true,
                          child: TextField(
                            decoration: const InputDecoration(
                                border: InputBorder.none, isDense: true),
                            controller: TextEditingController(text: contents),
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
                      SizedBox(
                        height: 35,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            (activeLike)
                                ? Row(
                                    children: [
                                      WcIconTextButton(
                                        active: true,
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
