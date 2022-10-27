import 'package:flutter_svg/svg.dart';
import 'package:withconi/configs/constants/enum.dart';
import '../../../configs/constants/enum_icon.dart';
import '../../../data/model/comment.dart';
import '../../../data/model/user.dart';
import '../../../import_basic.dart';

showMoreBottomSheet(
    {required String userId,
    required String authorId,
    required String authorName}) {
  List<MoreOption> optionList = [];
  if (userId == authorId) {
    optionList = [MoreOption.edit, MoreOption.delete];
  } else {
    optionList = [
      MoreOption.report,
      MoreOption.block,
    ];
  }
  return Get.bottomSheet(
    Container(
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Column(
            children: optionList
                .map((e) =>
                    _moreSheetListTile(moreOption: e, authorName: authorName))
                .toList(),
          )
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
    {required MoreOption moreOption, required String authorName}) {
  return GestureDetector(
    onTap: () {
      Get.back(result: moreOption);
    },
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
            moreOptionsToSvgIcon(moreOption),
            const SizedBox(
              width: 12,
            ),
            Text(
                moreOptionsToKorean(option: moreOption, authorName: authorName),
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
