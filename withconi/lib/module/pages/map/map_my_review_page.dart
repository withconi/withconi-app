import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/controller/community/community_my_post_controller.dart';
import 'package:withconi/controller/map/map_my_review_controller.dart';
import 'package:withconi/import_basic.dart';
import '../../../data/model/review.dart';
import '../../theme/text_theme.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/button/icon_button.dart';
import '../../widgets/button/place_verification_button.dart';
import '../../widgets/listtile/post_list_tile.dart';
import 'map_search_page.dart';

class MapMyReviewPage extends StatelessWidget {
  MapMyReviewPage({Key? key}) : super(key: key);
  final MapMyReviewController _controller = Get.put(MapMyReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WcAppBar(
        title: '',
      ),
      backgroundColor: WcColors.white,
      body: Obx(
        () => SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _controller.scrollController.value,
          child: SafeArea(
            bottom: false,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: WcHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: WcWidth,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      '작성한 리뷰',
                      style: GoogleFonts.notoSans(
                          color: WcColors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.4),
                    ),
                  ),
                  Container(
                    width: WcWidth,
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                    child: Row(
                      children: [
                        Obx(
                          () => Text(
                            '${_controller.totalReviewNum}',
                            style: GoogleFonts.montserrat(
                              color: WcColors.black,
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          '개',
                          style: GoogleFonts.montserrat(
                            color: WcColors.black,
                            fontSize: 21,
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
                          Review review = _controller.myReviewList[index];
                          return MyReviewListTile(
                            review: review,
                          );
                        })),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyReviewListTile extends StatelessWidget {
  MyReviewListTile({
    Key? key,
    required this.review,
  }) : super(key: key);

  Review review;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('print');
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        decoration: BoxDecoration(
            color: WcColors.white,
            border: Border(bottom: BorderSide(color: WcColors.grey60))),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.name,
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            fontSize: 17,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 3,
                    ),
                    Text(review.address,
                        style: TextStyle(
                            fontFamily: WcFontFamily.notoSans,
                            color: WcColors.grey120,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400))
                  ],
                ),
                PlaceVerificationButton(
                  visitVerified: review.visitVerified,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: WcColors.grey40,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(children: [
                        Container(
                          margin: EdgeInsets.only(top: 0.5),
                          child: SvgPicture.asset(
                            review.reviewEntity.activeIconSrc,
                            height: 18,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                            (review.reviewEntity.reviewItemsToString(
                                review.reviewEntity.selectedReviewItems[0])),
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                color: WcColors.grey160,
                                fontSize: 13.5,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500)),
                      ]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Visibility(
                      visible:
                          review.reviewEntity.selectedReviewItems.length > 1,
                      child: Container(
                        height: 30,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: WcColors.grey40,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(children: [
                          Text(
                              '+${review.reviewEntity.selectedReviewItems.length - 1}',
                              style: TextStyle(
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
