import '../../../import_basic.dart';
import '../../ui_model/comment_ui_model.dart';

showCommentBottomSheet(String nickname) {
  TextEditingController textEditingController = TextEditingController();
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
                    style: GoogleFonts.notoSans(
                        fontSize: 17,
                        color: WcColors.black,
                        fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () {
                    Get.back(result: textEditingController.text);
                  },
                  child: Text('남기기',
                      style: GoogleFonts.notoSans(
                          fontSize: 16,
                          color: WcColors.blue100,
                          fontWeight: FontWeight.bold)),
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
                borderRadius: BorderRadius.circular(25),
                color: WcColors.blue20),
            child: TextField(
              autofocus: false,
              controller: textEditingController,
              style: GoogleFonts.notoSans(
                  color: WcColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.5),
              maxLines: 20,
              minLines: 5,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  isDense: true,
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.notoSans(
                      color: WcColors.grey120,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
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
