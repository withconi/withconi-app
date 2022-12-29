import 'package:withconi/module/theme/text_theme.dart';

import '../../../import_basic.dart';
import '../../ui_model/comment_ui_model.dart';

showCommentBottomSheet(String nickname, [String? comment]) {
  TextEditingController textEditingController = TextEditingController();
  if (comment != null && comment.isNotEmpty) {
    textEditingController.text = comment;
  }
  return Get.bottomSheet(
    Container(
      height: 280,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$nickname님의 댓글',
                    style: TextStyle(
                        fontFamily: WcFontFamily.notoSans,
                        fontSize: 17,
                        height: 1,
                        color: WcColors.black,
                        fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () {
                    Get.back(result: textEditingController.text);
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.only(left: 20),
                    child: Text('남기기',
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            fontSize: 16,
                            color: WcColors.blue100,
                            fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: WcColors.blue20),
            child: TextField(
              autofocus: false,
              controller: textEditingController,
              style: TextStyle(
                  fontFamily: WcFontFamily.notoSans,
                  color: WcColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5),
              maxLines: 20,
              maxLength: 500,
              minLines: 5,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 10),
                  isDense: true,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontFamily: WcFontFamily.notoSans,
                      color: WcColors.grey120,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.5),
                  hintText:
                      '욕설, 비방 등 상대방을 불쾌하게 하는 의견은 남기지 말아주세요. 신고를 당하면 커뮤니티 이용이 제한될 수 있습니다.'),
            ),
          ),
        ],
      ),
    ),
    enterBottomSheetDuration: const Duration(milliseconds: 170),
    exitBottomSheetDuration: const Duration(milliseconds: 170),
    backgroundColor: Colors.white,
    isScrollControlled: true,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
  );
}
