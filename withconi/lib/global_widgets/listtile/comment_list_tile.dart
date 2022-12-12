import 'dart:io';

import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/global_widgets/listtile/post_list_tile.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/module/community/widgets/more_tap_bottom_sheet.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/button/icon_button.dart';
import 'package:withconi/module/ui_model/comment_ui_model.dart';

import '../../core/tools/helpers/calculator.dart';
import '../../import_basic.dart';
import '../../module/community/pages/community_post_list_page.dart';
import '../badge/badge.dart';
import '../button/icon_text_button.dart';
import '../button/like_button.dart';

class WcCommentListTile extends StatelessWidget {
  WcCommentListTile(
      {Key? key,
      required this.liked,
      this.badgeText,
      this.userProfile,
      required this.onLikeTap,
      this.onCommentTap,
      this.onPostTap,
      this.activeComment = true,
      this.activeLike = true,
      required this.onMoreTap,
      required this.comment})
      : super(key: key);

  String? badgeText;
  bool liked;
  void Function(bool) onLikeTap;
  void Function()? onCommentTap;
  void Function()? onPostTap;
  void Function(CommentUIModel, MoreBottomSheetOption?)? onMoreTap;
  File? userProfile;
  bool activeComment;
  bool activeLike;
  CommentUIModel comment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPostTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 15, 0, 13),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: WcColors.grey80))),
        width: WcWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: WcColors.grey110.withOpacity(0.6),
                      backgroundImage: comment.profileImage.getImageByType,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: SizedBox(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        comment.nickname,
                                        style: TextStyle(
                                            fontFamily: WcFontFamily.notoSans,
                                            color: WcColors.grey200,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            height: 1.5),
                                      ),
                                      Text(
                                        ' • ${comment.uploadAtStr}',
                                        style: TextStyle(
                                            fontFamily: WcFontFamily.notoSans,
                                            color: WcColors.grey140,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // color: WcColors.babyPinkLight,
                                  padding: EdgeInsets.only(top: 10),
                                  width: WcWidth - 40 - 46,
                                  child: Text(
                                    comment.content,
                                    maxLines: 20,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: WcFontFamily.notoSans,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 33,
                  width: WcWidth - 65,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (activeLike)
                          ? Row(
                              children: [
                                WcLikeButton(
                                  likeNum: comment.likeNum,
                                  isLikeOn: liked,
                                  onLikeTap: onLikeTap,
                                  iconSize: 18,
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                              ],
                            )
                          : SizedBox.shrink(),
                      WcIconButton(
                          active: true,
                          onTap: () async {
                            MoreBottomSheetOption? selectedOption =
                                await showMoreBottomSheet(
                                    authorId: comment.authorId,
                                    authorName: comment.nickname,
                                    bottomSheetFor: BottomSheetFor.comment);
                            onMoreTap!.call(comment, selectedOption);
                          },
                          iconHeight: 22,
                          touchWidth: 50,
                          touchHeight: 30,
                          iconMainAxisAlignment: MainAxisAlignment.center,
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
