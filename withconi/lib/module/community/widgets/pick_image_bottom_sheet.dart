import 'package:flutter_svg/svg.dart';
import 'package:withconi/core/values/constants/auth_variables.dart';
import 'package:withconi/data/enums/enum.dart';

import '../../../import_basic.dart';

showPickImageBottomSheet() {
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
            children: ImagePickOption.values
                .map((e) => _imagePickSheetListTile(e))
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

GestureDetector _imagePickSheetListTile(
  ImagePickOption imagePickOption,
) {
  return GestureDetector(
    onTap: () {
      Get.back(result: imagePickOption);
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
            SvgPicture.asset(
              imagePickOption.svgSrc,
              color: WcColors.grey160,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(imagePickOption.displayName,
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
