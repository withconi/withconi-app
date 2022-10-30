import '../../../../data/model/post.dart';
import '../../../../import_basic.dart';
import '../../../theme/text_theme.dart';

class HotPostListTile extends StatelessWidget {
  HotPostListTile(
      {Key? key,
      required this.post,
      this.width = double.infinity,
      this.padding = const EdgeInsets.symmetric(horizontal: 15)})
      : super(key: key);
  double? width;
  EdgeInsets? padding;
  Post post;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('asdf');
      },
      child: Container(
        color: WcColors.white,
        height: 40,
        width: width,
        padding: padding,
        child: Row(
          children: [
            Text(
              post.boardId.toString(),
              style: TextStyle(
                  fontFamily: WcFontFamily.notoSans,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: WcColors.black),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                post.content,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: WcColors.grey180),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
