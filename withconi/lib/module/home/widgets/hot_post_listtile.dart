import 'package:withconi/module/ui_model/post_ui_model.dart';

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
        // color: WcColors.white,
        alignment: Alignment.center,
        height: 37,
        width: width,
        padding: padding,
        child: Row(
          children: [
            Text(
              '${hotPost.diseaseType.displayName} 게시판',
              style: TextStyle(
                  fontFamily: WcFontFamily.notoSans,
                  fontSize: 14.4,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  color: WcColors.black),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                hotPost.content,
                overflow: TextOverflow.fade,
                softWrap: false,
                maxLines: 1,
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    fontSize: 14.7,
                    height: 1,
                    fontWeight: FontWeight.w400,
                    color: WcColors.grey200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
