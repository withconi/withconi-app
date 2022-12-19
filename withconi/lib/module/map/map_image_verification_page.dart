import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/core/tools/helpers/search_highlighter.dart';
import 'package:withconi/module/map/controllers/map_image_verification_controller.dart';
import 'package:withconi/module/map/controllers/map_new_review_controller.dart';
import 'package:withconi/module/map/controllers/map_search_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/global_widgets/searchbar/search_bar.dart';
import '../../data/enums/enum.dart';
import '../../global_widgets/appbar/appbar.dart';
import '../theme/text_theme.dart';
import '../../global_widgets/error_widget/error_widget.dart';

class MapImageVerificationPage extends StatelessWidget {
  const MapImageVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MapImageVerificationController _controller = Get.find();
    return Scaffold(
      appBar: WcAppBar(
        title: '사진 인증하기',
        onLeadingTap: _controller.getBack,
        onActionTap: _controller.onFinishButtonTap,
        action: const Text(
          '완료',
          style: TextStyle(
              fontFamily: WcFontFamily.notoSans,
              fontSize: 16,
              height: 1,
              color: WcColors.blue100,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6),
        ),
      ),
      backgroundColor: WcColors.white,
      body: IgnorePointer(
        ignoring: !_controller.editable,
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _controller.onTapPickImageButton,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.centerLeft,
                        width: WcWidth - 40,
                        height: 50,
                        decoration: BoxDecoration(
                            color: WcColors.grey40,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/add_photo.svg',
                              color: WcColors.grey180,
                              height: 21,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '방문한 장소 or 영수증 사진 올리기',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  color: WcColors.grey180,
                                  fontSize: 15,
                                  height: 1.4,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: WcColors.grey80,
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 25, 15),
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: '${_controller.selectedPhotoList.length}/',
                      style: GoogleFonts.workSans(
                          color: WcColors.grey160,
                          fontSize: 19,
                          fontWeight: FontWeight.w400),
                    ),
                    TextSpan(
                      text: '${_controller.maxImageNum}',
                      style: GoogleFonts.workSans(
                          color: WcColors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                    ),
                  ], style: TextStyle(letterSpacing: 1.7))),
                ),
              ),
              Obx(
                () => Offstage(
                    offstage: _controller.selectedPhotoList.isNotEmpty,
                    child: GestureDetector(
                      onTap: () => _controller.onTapPickImageButton(),
                      child: Container(
                        height: WcHeight - 400,
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: Color.fromARGB(255, 245, 245, 247),
                          child: SvgPicture.asset(
                            'assets/icons/add_photo.svg',
                            color: WcColors.grey100,
                          ),
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: Obx(() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller.selectedPhotoList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: (WcHeight - 70) / 2,
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              alignment: Alignment.topRight,
                              // width: 110,

                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: _controller
                                      .selectedPhotoList[index].getImageByType,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(50, 0, 0, 0),
                                    spreadRadius: 0,
                                    blurRadius: 8,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  _controller.deleteImage(index);
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  width: 35,
                                  height: 35,
                                  padding: const EdgeInsets.all(0),
                                  child: SvgPicture.asset(
                                    "assets/icons/delete_circle.svg",
                                    color: WcColors.white,
                                    fit: BoxFit.none,
                                    colorBlendMode: BlendMode.modulate,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
