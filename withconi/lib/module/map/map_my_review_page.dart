import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/community/controllers/community_my_post_controller.dart';
import 'package:withconi/module/map/controllers/map_my_review_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/ui_model/review_preview_ui_model.dart';
import '../theme/text_theme.dart';
import '../../global_widgets/appbar/appbar.dart';
import '../../global_widgets/button/icon_button.dart';
import '../../global_widgets/button/photo_verification_button.dart';

class MapMyReviewPage extends StatelessWidget {
  const MapMyReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapMyReviewController _controller = Get.find();

    return Scaffold(
      appBar: WcAppBar(
        title: '',
      ),
      backgroundColor: WcColors.white,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
          bottom: false,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: WcHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: WcWidth,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '내 리뷰',
                          style: TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              color: WcColors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              height: 1.4),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: _controller.goToNewReviewPage,
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 6),
                            decoration: BoxDecoration(
                                color: WcColors.blue40,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              '리뷰쓰기',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.1,
                                  color: Color.fromARGB(255, 0, 89, 199),
                                  fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    )),
                Container(
                  width: WcWidth,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                  child: Row(
                    children: [
                      Obx(
                        () => Text(
                          '${_controller.totalReviewNum}',
                          style: GoogleFonts.workSans(
                            color: WcColors.black,
                            fontSize: 24,
                            height: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        '개',
                        style: GoogleFonts.workSans(
                          color: WcColors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => ListView.builder(
                      cacheExtent: 1000,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _controller.myReviewList.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return MyReviewListTile(
                          onTapVerificationButton: () =>
                              _controller.goToPhotoVerificationPage(index),
                          review: _controller.myReviewList[index],
                        );
                      })),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyReviewListTile extends StatelessWidget {
  MyReviewListTile(
      {Key? key, required this.review, required this.onTapVerificationButton})
      : super(key: key);

  ReviewPreviewUIModel review;
  void Function() onTapVerificationButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('print');
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
        decoration: const BoxDecoration(
            color: WcColors.white,
            border: Border(bottom: BorderSide(color: WcColors.grey60))),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(review.placeName,
                          style: const TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              fontSize: 17,
                              height: 1,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(review.placeAddress,
                          style: const TextStyle(
                              fontFamily: WcFontFamily.notoSans,
                              color: WcColors.grey140,
                              fontSize: 14,
                              height: 1,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                PhotoVerificationButton(
                  isPhotoReview: review.isPhotoReview,
                  onTap: onTapVerificationButton,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: WcColors.grey40,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 0.3),
                          child: SvgPicture.asset(
                            review.reviewRate!.activeIconSrc,
                            height: 18,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                            review.reviewItems.first
                                .displayText(review.reviewRate!),
                            style: const TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                color: WcColors.grey180,
                                fontSize: 13.5,
                                height: 1,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500)),
                      ]),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Visibility(
                      visible: review.reviewItems.length > 1,
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: WcColors.grey40,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(children: [
                          Text('+${review.reviewItems.length - 1}',
                              style: const TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  color: WcColors.grey140,
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500)),
                        ]),
                      ),
                    ),
                  ],
                ),
                WcIconButton(
                  iconMainAxisAlignment: MainAxisAlignment.end,
                  iconCrossAxisAlignment: CrossAxisAlignment.end,
                  active: true,
                  activeIconColor: WcColors.grey100,
                  iconSrc: 'assets/icons/dots.svg',
                  iconHeight: 23,
                  inactiveIconColor: WcColors.grey100,
                  onTap: () {
                    print('dots');
                  },
                  touchWidth: 50,
                  touchHeight: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
