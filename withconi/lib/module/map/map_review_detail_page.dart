import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/global_widgets/button/item_text_button.dart';
import 'package:withconi/global_widgets/snackbar.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/module/community/controllers/community_new_post_controller.dart';
import 'package:withconi/module/map/controllers/map_new_review_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/map/controllers/map_review_detail_controller.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/review_ui_class.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/global_widgets/button/text_radio_button.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import '../../global_widgets/button/check_selection_button.dart';
import '../../global_widgets/button/photo_verification_button.dart';
import '../../global_widgets/button/text_button.dart';
import '../../global_widgets/checkbox/custom_checkbox.dart';
import '../../global_widgets/scaffold/loading_scaffold.dart';
import 'widgets/review_rate_button.dart';

class MapReviewDetailPage extends StatelessWidget {
  const MapReviewDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapReviewDetailController _controller = Get.find();
    return GestureDetector(
      onTap: () {
        showCustomSnackbar(text: '이미 작성된 리뷰는 수정할 수 없습니다.');
      },
      child: Scaffold(
        appBar: WcAppBar(
          title: '리뷰 상세',
          leading: SvgPicture.asset(
            'assets/icons/arrow_back.svg',
            color: WcColors.grey200,
          ),
        ),
        backgroundColor: WcColors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        height: 60,
                        width: WcWidth - 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: WcColors.grey40,
                                  image: DecorationImage(
                                    image: _controller.reviewDetail
                                        .placeThumbnail.getImageByType,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _controller.reviewDetail.placeName,
                                    softWrap: false,
                                    style: TextStyle(
                                        fontFamily: WcFontFamily.notoSans,
                                        fontSize: 16.5,
                                        height: 1.8,
                                        overflow: TextOverflow.fade,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    _controller.reviewDetail.placeAddress,
                                    softWrap: false,
                                    style: TextStyle(
                                        fontFamily: WcFontFamily.notoSans,
                                        fontSize: 13.5,
                                        height: 1.8,
                                        overflow: TextOverflow.fade,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            PhotoVerificationButton(
                              isPhotoReview:
                                  _controller.reviewDetail.isPhotoReview,
                              onTap: _controller.onTapPhotoVerificationButton,
                            ),
                          ],
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            children: [
                              Text(
                                '어떤 코니멀과 방문했나요? (중복선택 가능)',
                                style: TextStyle(
                                    fontFamily: WcFontFamily.notoSans,
                                    color: WcColors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        ColorFiltered(
                          colorFilter: ColorFilter.matrix(<double>[
                            0.2000,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2016,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                          ]),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: _controller.reviewDetail.conimals
                                  .map(
                                    (e) => VisitedConimalSelectionButton(
                                      selected: true,
                                      conimal: e,
                                      // onChanged: _controller.onConimalSelected,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Text(
                            '방문하신 구체적인 질병이 있나요? (선택항목)',
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                color: WcColors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        ColorFiltered(
                          colorFilter: ColorFilter.matrix(<double>[
                            0.2000,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2016,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                          ]),
                          child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ItemListValueButton(
                                hintText: '질병 검색하기',
                                itemTextList: _controller
                                    .reviewDetail.diseaseList
                                    .map((e) => e.name)
                                    .toList(),
                                onItemDelete: (deleteIndex) {},
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '어떤 문제로 방문하셨나요?',
                                style: TextStyle(
                                    fontFamily: WcFontFamily.notoSans,
                                    color: WcColors.black,
                                    fontSize: 17,
                                    // height: 2,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '고르신 질병에 대한 문제는 자동선택됩니다.',
                                style: TextStyle(
                                    fontFamily: WcFontFamily.notoSans,
                                    color: WcColors.grey140,
                                    fontSize: 15.5,
                                    height: 1.7,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        ColorFiltered(
                            colorFilter: ColorFilter.matrix(<double>[
                              0.2000,
                              0.7152,
                              0.0722,
                              0,
                              0,
                              0.2016,
                              0.7152,
                              0.0722,
                              0,
                              0,
                              0.2126,
                              0.7152,
                              0.0722,
                              0,
                              0,
                              0,
                              0,
                              0,
                              1,
                              0,
                            ]),
                            child: Wrap(
                                direction: Axis.horizontal,
                                children: DiseaseType.values
                                    .where((element) =>
                                        (element != DiseaseType.all &&
                                            element != DiseaseType.undefined))
                                    .map(
                                      (disease) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: SizedBox(
                                          width: (WcWidth / 2) - 40,
                                          child: CustomCheckBox(
                                            value: disease,
                                            isSelected: _controller
                                                .reviewDetail.diseaseTypes
                                                .contains(disease),
                                            onChanged: (diseaseType) {},
                                            text: disease.displayName,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList())),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '이 장소는 어땠나요?',
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                color: WcColors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: ReviewRate.values
                                .map(
                                  (reviewRate) => ReviewRateButton(
                                    activeBackgroundColor:
                                        reviewRate.activeBackgroundColor,
                                    activeIconSrc: reviewRate.activeIconSrc,
                                    inactiveIconSrc: reviewRate.inactiveIconSrc,
                                    onChanged: (_) {},
                                    reviewRate: reviewRate,
                                    isActive:
                                        _controller.reviewDetail.reviewRate ==
                                            reviewRate,
                                    text: reviewRate.displayName,
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Text(
                            _controller.reviewDetail.reviewRate!.question,
                            style: TextStyle(
                                fontFamily: WcFontFamily.notoSans,
                                color: WcColors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        ColorFiltered(
                          colorFilter: ColorFilter.matrix(<double>[
                            0.2000,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2016,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                          ]),
                          child: Column(
                            children: _controller
                                .reviewDetail.reviewRate!.reviewItems
                                .map((reviewItem) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: CustomCheckBox(
                                  value: reviewItem,
                                  isSelected: _controller
                                      .reviewDetail.reviewItems
                                      .contains(reviewItem),
                                  onChanged: null,
                                  text: reviewItem.displayText(
                                      _controller.reviewDetail.reviewRate!),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //   child: WcWideButtonWidget(
                    //       buttonText: '리뷰 등록하기',
                    //       onTap: () {},
                    //       activeButtonColor: WcColors.blue100,
                    //       active: false,
                    //       activeTextColor: WcColors.white),
                    // ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
