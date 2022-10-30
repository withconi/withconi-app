import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/community/community_new_post_controller.dart';
import 'package:withconi/controller/map/map_edit_review_controller.dart';
import 'package:withconi/controller/map/map_new_review_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/ui_model/review_ui_class.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/module/widgets/appbar/appbar.dart';
import 'package:withconi/module/widgets/button/text_radio_button.dart';
import 'package:withconi/module/widgets/button/wide_button.dart';

import '../../../data/model/conimal.dart';
import '../../widgets/button/check_selection_button.dart';
import '../../widgets/button/place_verification_button.dart';
import '../../widgets/checkbox/custom_checkbox.dart';
import 'map_widgets/review_rate_button.dart';

class MapEditReviewPage extends StatelessWidget {
  MapEditReviewPage({Key? key}) : super(key: key);

  final MapEditReviewController _controller =
      Get.put(MapEditReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        color: WcColors.grey40,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              _controller.place.thumbnail),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: (_controller
                                            .placeVerification.value!.verified)
                                        ? SizedBox.shrink()
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            // make sure we apply clip it properly
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 30, sigmaY: 10),
                                              child: Container(
                                                alignment: Alignment.center,
                                                color: WcColors.grey40
                                                    .withOpacity(0.3),
                                              ),
                                            ),
                                          )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _controller.place.name,
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
                                      _controller.place.address,
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
                            () => PlaceVerificationButton(
                              visitVerified: _controller.place.visitVerified,
                              onTap: () {
                                _controller.verifyPlaceVisit(
                                  context: context,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
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
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: AuthController.to.wcUser.value!.conimals
                                .map(
                                  (e) => VisitedConimalSelectionButton(
                                    selected: _controller.selectedConimalList
                                        .contains(e),
                                    conimal: e,
                                    onChanged: _controller.onConimalSelected,
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
                              '어떤 문제로 방문하셨나요? (최대 3개)',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  color: WcColors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Column(
                              children: _controller.diseaseTypeList
                                  .map(
                                    (disease) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: CustomCheckBox(
                                        value: disease,
                                        isSelected: _controller
                                            .selectedDiseaseTypeList
                                            .contains(disease),
                                        onChanged: (diseaseType) {
                                          _controller.onDiseaseTypeSelected(
                                              diseaseType as DiseaseType);
                                        },
                                        text: disease.displayName,
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
                      visible: (_controller.showReviewRateSection.value &&
                          _controller.showDiseaseTypeSection.value),
                      child: Container(
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
                              children: _controller.reviewRateEntities
                                  .map(
                                    (reviewRateEntity) => ReviewRateButton(
                                      activeBackgroundColor:
                                          reviewRateEntity.activeBackground,
                                      activeIconSrc:
                                          reviewRateEntity.activeIconSrc,
                                      inactiveIconSrc:
                                          reviewRateEntity.inactiveIconSrc,
                                      onChanged:
                                          _controller.onReviewRateChanged,
                                      reviewRate: reviewRateEntity,
                                      isActive: (_controller
                                              .selectedReviewEntity.value ==
                                          reviewRateEntity),
                                      text: reviewRateEntity.text,
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
                      visible: (_controller.showReviewItemSection.value &&
                          _controller.showReviewRateSection.value &&
                          _controller.showDiseaseTypeSection.value),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Text(
                              (_controller.showReviewItemSection.value)
                                  ? _controller
                                      .selectedReviewEntity.value!.question
                                  : '',
                              style: TextStyle(
                                  fontFamily: WcFontFamily.notoSans,
                                  color: WcColors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Column(
                            children: (_controller.selectedReviewEntity.value ==
                                    null)
                                ? []
                                : _controller.selectedReviewEntity.value!
                                    .reviewItemsMap.keys
                                    .toList()
                                    .map((reviewItem) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: CustomCheckBox(
                                        value: reviewItem,
                                        isSelected: _controller
                                            .selectedReviewEntity
                                            .value!
                                            .selectedReviewItems
                                            .contains(reviewItem),
                                        onChanged: (reviewItem) {
                                          _controller.onReviewItemSelected(
                                              reviewItem as ReviewItems);
                                        },
                                        text: _controller
                                            .selectedReviewEntity.value!
                                            .reviewItemsToString(reviewItem),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
