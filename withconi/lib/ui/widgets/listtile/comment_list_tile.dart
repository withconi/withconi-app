import 'dart:io';

import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/community/communty_widgets/more_tap_bottom_sheet.dart';
import 'package:withconi/ui/widgets/button/icon_button.dart';

import '../../../configs/helpers/calculator.dart';
import '../../../data/model/comment.dart';
import '../../../import_basic.dart';
import '../../pages/community/community_post_list_page.dart';
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
  void Function(Comment, MoreOption?)? onMoreTap;
  File? userProfile;
  bool activeComment;
  bool activeLike;
  Comment comment;

  @override
  Widget build(BuildContext context) {
    String uploadAtStr(DateTime createdAt) =>
        TimeCalculator().calculateUploadAt(createdAt);
    return GestureDetector(
      onTap: onPostTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
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
                      radius: 16,
                      backgroundColor: WcColors.grey110,
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
                                        style: GoogleFonts.notoSans(
                                            color: WcColors.grey200,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            height: 1.5),
                                      ),
                                      Text(
                                        ' • ${uploadAtStr(comment.createdAt)}',
                                        style: GoogleFonts.notoSans(
                                            color: WcColors.grey140,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: WcWidth - 40 - 46,
                                  child: IgnorePointer(
                                    ignoring: true,
                                    child: TextField(
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true),
                                      controller: TextEditingController(
                                          text: comment.content),
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
                    ),
                  ],
                ),
                Container(
                  height: 35,
                  width: WcWidth - 65,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (activeLike)
                          ? Row(
                              children: [
                                WcLikeButton(
                                  isLiked: liked,
                                  valueChanged: onLikeTap,
                                ),
                                Text(
                                  comment.likeNum.toString(),
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    color: WcColors.grey140,
                                  ),
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
                            MoreOption? selectedOption =
                                await showMoreBottomSheet(
                              userId: AuthController.to.wcUser.value!.uid,
                              authorId: comment.authorId,
                              authorName: comment.nickname,
                            );
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
