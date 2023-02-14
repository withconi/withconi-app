import 'package:withconi/module/ui_model/post_ui_model.dart';

import '../../../global_widgets/button/icon_text_button.dart';
import '../../../global_widgets/listtile/post_list_tile.dart';
import '../../../import_basic.dart';
import '../../theme/text_theme.dart';

class HotPostListTile extends StatelessWidget {
  HotPostListTile(
      {Key? key,
      required this.hotPost,
      this.width = double.infinity,
      this.padding = const EdgeInsets.symmetric(horizontal: 15),
      required this.onPostTap})
      : super(key: key);
  double? width;
  EdgeInsets? padding;
  PostUIModel hotPost;
  void Function(PostUIModel) onPostTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPostTap.call(hotPost);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 13),
        width: (WcWidth(context) - 20) / 2,
        decoration: BoxDecoration(
            color: WcColors.grey20, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  hotPost.diseaseType.iconUrl,
                  height: 13,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(hotPost.diseaseType.displayName + ' 게시판',
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        color: WcColors.grey180,
                        fontSize: 12)),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Text(
                hotPost.content,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 2,
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    color: WcColors.grey200,
                    fontSize: 15),
              ),
            ),
            Row(
              children: [
                WcLikeButton(
                  isLikeOn: false,
                  iconSize: 16,
                  likeNum: hotPost.likeNum,
                  onLikeTap: (bool) {},
                  padding: EdgeInsets.only(right: 10),
                ),
                WcIconTextButton(
                  active: false,
                  activeIconColor: WcColors.grey100,
                  iconSrc: 'assets/icons/comment.svg',
                  iconHeight: 15,
                  inactiveIconColor: WcColors.grey100,
                  onTap: () {},
                  text: hotPost.commentNum.toString(),
                  padding: EdgeInsets.zero,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
