import 'dart:io';
import '../../../configs/constants/enum.dart';
import '../../../import_basic.dart';
import '../badge/badge.dart';
import '../button/icon_text_button.dart';

class WcUserPostListTile extends StatelessWidget {
  WcUserPostListTile({
    Key? key,
    required this.authorName,
    required this.uploadAt,
    required this.contents,
    required this.liked,
    required this.likesNum,
    required this.commentsNum,
    this.postType,
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
  PostType? postType;
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
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: WcColors.grey80))),
        width: WcWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 27,
            ),
            SizedBox(
              width: WcWidth - 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 18,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        height: 23,
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
                              ' • $uploadAt',
                              style: GoogleFonts.notoSans(
                                  color: WcColors.grey140,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5),
                            ),
                            (activeBadge)
                                ? WcBadge(
                                    text: postTypeToKorean(postType),
                                    backgroundColor: badgeBackgroundColor ??
                                        Colors.transparent,
                                    textColor:
                                        badgeTextColor ?? Colors.transparent,
                                  )
                                : const SizedBox.shrink()
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
                        height: 36,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                                      const SizedBox(
                                        width: 18,
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            (activeComment)
                                ? WcIconTextButton(
                                    active: true,
                                    activeIconColor: WcColors.grey100,
                                    iconSrc: 'assets/icons/comment.svg',
                                    inactiveIconColor: WcColors.grey100,
                                    onTap: onCommentTap,
                                    text: '34',
                                    iconHeight: 19,
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                      const SizedBox(
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
