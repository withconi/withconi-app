import 'package:flutter_svg/svg.dart';
import '../../../data/model/comment.dart';
import '../../../data/model/user.dart';
import '../../../import_basic.dart';

List<String> authorTrueStringList = ['수정하기', '삭제하기'];
List<SvgPicture> authorTrueIconList = [
  SvgPicture.asset('assets/icons/circle_edit.svg'),
  SvgPicture.asset('assets/icons/circle_delete.svg'),
];

List<SvgPicture> authorFalseIconList = [
  SvgPicture.asset('assets/icons/circle_report.svg'),
  SvgPicture.asset('assets/icons/circle_block.svg'),
];

String authorFalseString({required int index, required String authorNickname}) {
  if (index == 0) {
    return '신고하기';
  } else if (index == 1) {
    return '$authorNickname의 글 보지 않기';
  } else {
    return '';
  }
}

showMoreBottomSheet({required bool isAuthor, required String authorNickname}) {
  return Get.bottomSheet(
    Container(
      height: 170,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          _moreSheetListTile(
              icon: (isAuthor) ? authorTrueIconList[0] : authorFalseIconList[0],
              text: (isAuthor)
                  ? authorTrueStringList[0]
                  : authorFalseString(
                      index: 0, authorNickname: authorNickname)),
          _moreSheetListTile(
              icon: (isAuthor) ? authorTrueIconList[1] : authorFalseIconList[1],
              text: (isAuthor)
                  ? authorTrueStringList[1]
                  : authorFalseString(
                      index: 0, authorNickname: authorNickname)),
        ],
      ),
    ),
    enterBottomSheetDuration: const Duration(milliseconds: 170),
    exitBottomSheetDuration: const Duration(milliseconds: 170),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
  );
}

GestureDetector _moreSheetListTile(
    {required Widget icon, required String text, void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50,
      width: WcWidth,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              width: 12,
            ),
            Text(text,
                style: GoogleFonts.notoSans(
                    fontSize: 17,
                    color: WcColors.black,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    ),
  );
}
