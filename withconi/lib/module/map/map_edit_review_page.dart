// import 'dart:ui';
import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/global_widgets/button/item_text_button.dart';
import 'package:withconi/module/map/controllers/map_edit_review_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/global_widgets/appbar/appbar.dart';
import 'package:withconi/global_widgets/button/wide_button.dart';
import '../../global_widgets/button/check_selection_button.dart';
import '../../global_widgets/button/photo_verification_button.dart';
import '../../global_widgets/checkbox/custom_checkbox.dart';
import '../../global_widgets/scaffold/loading_scaffold.dart';
import 'widgets/review_rate_button.dart';

class MapEditReviewPage extends StatelessWidget {
  const MapEditReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapEditReviewController _controller = Get.find();
    return Obx(() => LoadingScaffold(
          isLoading: _controller.isLoading.value,
          appBar: WcAppBar(
            title: '리뷰 수정하기',
            leading: SvgPicture.asset(
              'assets/icons/arrow_back.svg',
              color: WcColors.grey200,
            ),
            // onActionTap: _controller.onCreateButtonTap,
            onLeadingTap: _controller.getBack,
          ),
          backgroundColor: WcColors.white,
          body: SingleChildScrollView(
              controller: _controller.scrollController,
              child: SafeArea(
                bottom: false,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      color: WcColors.grey40,
                                      image: DecorationImage(
                                        image: _controller.placeThumbnail.value
                                            .getImageByType,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _controller.placeName.value,
                                      style: TextStyle(
                                          fontFamily: WcFontFamily.notoSans,
                                          fontSize: 16,
                                          height: 1.8,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      height: 30,
                                      child: Text(
                                        _controller.placeAddress.value,
                                        style: TextStyle(
                                            fontFamily: WcFontFamily.notoSans,
                                            fontSize: 13.5,
                                            height: 1.8,
                                            overflow: TextOverflow.fade,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Obx(
                              () => PhotoVerificationButton(
                                isPhotoReview: _controller
                                    .selectedReviewImageList.isNotEmpty,
                                onTap: _controller.goToPhotoVerificationPage,
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
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    children: _controller.previousConimalList
                                        .map(
                                          (e) => VisitedConimalSelectionButton(
                                            selected: _controller
                                                .selectedConimalList
                                                .contains(e),
                                            conimal: e,
                                            onChanged:
                                                _controller.onConimalSelected,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Obx(
                            () => Visibility(
                              visible: _controller.showDiseaseTypeSection.value,
                              child: Column(
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
                                  Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: ItemListValueButton(
                                        hintText: '질병 검색하기',
                                        onTapButton: _controller.searchDisease,
                                        itemTextList: _controller
                                            .selectedDiseaseList
                                            .map((e) => e.name)
                                            .toList(),
                                        onItemDelete: (deleteIndex) {
                                          _controller.selectedDiseaseList
                                              .removeAt(deleteIndex);
                                        },
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Obx(
                            () => Visibility(
                              visible: _controller.showDiseaseTypeSection.value,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '어떤 종류의 문제로 방문하셨나요? (최대 3개)',
                                          style: TextStyle(
                                              fontFamily: WcFontFamily.notoSans,
                                              color: WcColors.black,
                                              fontSize: 17,
                                              // height: 2,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '구체적인 질병에 대한 종류는 자동 선택됩니다.',
                                          style: TextStyle(
                                              fontFamily: WcFontFamily.notoSans,
                                              color: WcColors.grey160,
                                              fontSize: 15.7,
                                              height: 1.6,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Wrap(
                                      direction: Axis.horizontal,
                                      children: DiseaseType.values
                                          .map(
                                            (disease) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                              child: SizedBox(
                                                width:
                                                    (WcWidth(context) / 2) - 40,
                                                child: CustomCheckBox(
                                                  value: disease,
                                                  isSelected: _controller
                                                      .selectedDiseaseTypeSet
                                                      .contains(disease),
                                                  onChanged: (diseaseType) {
                                                    _controller
                                                        .onSelectedDiseaseTypeListChanged(
                                                            diseaseType
                                                                as DiseaseType);
                                                  },
                                                  text: disease.displayName,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList())
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => Visibility(
                              visible:
                                  (_controller.showReviewRateSection.value &&
                                      _controller.showDiseaseTypeSection.value),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: ReviewRate.values
                                          .map(
                                            (reviewRate) => ReviewRateButton(
                                              activeBackgroundColor: reviewRate
                                                  .activeBackgroundColor,
                                              activeIconSrc:
                                                  reviewRate.activeIconSrc,
                                              inactiveIconSrc:
                                                  reviewRate.inactiveIconSrc,
                                              onChanged: _controller
                                                  .onReviewRateChanged,
                                              reviewRate: reviewRate,
                                              isActive: (_controller
                                                      .selectedReviewRate
                                                      .value ==
                                                  reviewRate),
                                              text: reviewRate.displayName,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => Visibility(
                              visible: _controller.showReviewItemSection.value,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: Text(
                                      (_controller.showReviewItemSection.value)
                                          ? _controller.selectedReviewRate
                                              .value!.question
                                          : '',
                                      style: TextStyle(
                                          fontFamily: WcFontFamily.notoSans,
                                          color: WcColors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Column(
                                    children: (_controller
                                                .selectedReviewRate.value ==
                                            null)
                                        ? []
                                        : _controller.selectedReviewRate.value!
                                            .reviewItems
                                            .map((reviewItem) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                              child: CustomCheckBox(
                                                value: reviewItem,
                                                isSelected: _controller
                                                    .selectedReviewItems
                                                    .contains(reviewItem),
                                                onChanged: (reviewItem) {
                                                  _controller
                                                      .onReviewItemSelected(
                                                          reviewItem
                                                              as ReviewItem);
                                                },
                                                text: reviewItem.displayText(
                                                    _controller
                                                        .selectedReviewRate
                                                        .value!),
                                              ),
                                            );
                                          }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Obx(
                            () => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: WcWideButtonWidget(
                                  buttonText: '리뷰 등록하기',
                                  onTap: _controller.createNewReview,
                                  activeButtonColor: WcColors.blue100,
                                  active: _controller.validateButton(),
                                  activeTextColor: WcColors.white),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ]),
              )),
        ));
  }
}
