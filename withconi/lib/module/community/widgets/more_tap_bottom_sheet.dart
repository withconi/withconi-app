import 'package:flutter_svg/svg.dart';
import 'package:withconi/core/values/constants/auth_variables.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/theme/text_theme.dart';

import '../../../import_basic.dart';

enum BottomSheetFor { post, comment, mapReview }

showMoreBottomSheet(
    {required String authorId,
    required String authorName,
    required BottomSheetFor bottomSheetFor}) {
  List<MoreBottomSheetOption> optionList = [];
  // if (firebaseAuth.currentUser?.uid == authorId) {
  //   if (bottomSheetFor == BottomSheetFor.comment) {
  //     optionList = [MoreBottomSheetOption.delete];
  //   } else {
  //     optionList = [MoreBottomSheetOption.edit, MoreBottomSheetOption.delete];
  //   }

  switch (bottomSheetFor) {
    case BottomSheetFor.comment:
      if (firebaseAuth.currentUser?.uid == authorId) {
        optionList = [MoreBottomSheetOption.delete];
      } else {
        optionList = [
          MoreBottomSheetOption.report,
          MoreBottomSheetOption.block
        ];
      }
      break;
    case BottomSheetFor.post:
      if (firebaseAuth.currentUser?.uid == authorId) {
        optionList = [MoreBottomSheetOption.edit, MoreBottomSheetOption.delete];
      } else {
        optionList = [
          MoreBottomSheetOption.report,
          MoreBottomSheetOption.block
        ];
      }

      break;
    case BottomSheetFor.mapReview:
      if (firebaseAuth.currentUser?.uid == authorId) {
        optionList = [MoreBottomSheetOption.delete];
      }
      break;
    default:
  }

  return Get.bottomSheet(
    Container(
      height: optionList.length * 85,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            children: optionList
                .map((e) =>
                    _moreSheetListTile(moreOption: e, authorName: authorName))
                .toList(),
          ),
          const SizedBox(
            height: 10,
          ),
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
    {required MoreBottomSheetOption moreOption, required String authorName}) {
  return GestureDetector(
    onTap: () {
      Get.back(result: moreOption);
    },
    child: Container(
      height: 50,
      width: WcWidth(Get.context!),
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(moreOption.svgSrc),
            const SizedBox(
              width: 12,
            ),
            Text(
                (moreOption == MoreBottomSheetOption.block)
                    ? '$authorName의 글 ${moreOption.displayName}'
                    : moreOption.displayName,
                style: TextStyle(
                    fontFamily: WcFontFamily.notoSans,
                    fontSize: 16.5,
                    color: WcColors.black,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    ),
  );
}
