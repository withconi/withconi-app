import 'package:flutter_svg/svg.dart';
import 'package:withconi/core/values/constants/auth_variables.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';

import '../../../import_basic.dart';
import '../map_bookmark_page.dart';

showOverlappedPlaceBottomSheet(
    {required List<PlacePreviewUIModel> placePreview}) async {
  // List<MoreBottomSheetOption> optionList = [];
  // if (firebaseAuth.currentUser?.uid == authorId) {
  //   if (bottomSheetFor == BottomSheetFor.comment) {
  //     optionList = [MoreBottomSheetOption.delete];
  //   } else {
  //     optionList = [MoreBottomSheetOption.edit, MoreBottomSheetOption.delete];
  //   }

  return await Get.bottomSheet(
    Container(
      height: placePreview.length * 110,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            '비슷한 위치의 ${placePreview.length}개 장소가 있습니다',
            style: TextStyle(
                fontFamily: WcFontFamily.notoSans,
                fontSize: 16,
                height: 1,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
              cacheExtent: 1000,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: placePreview.length,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return PlaceBookmarkListTile(
                  showBookmark: false,
                  onTap: (index) {
                    Get.back(result: index);
                  },
                  index: index,
                  onBookmarkTap: (q, a) {},
                  isBookmarked: true,
                  place: placePreview[index],
                );
              })),
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
