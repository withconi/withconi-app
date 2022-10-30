import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/community/community_new_post_controller.dart';
import 'package:withconi/controller/map/map_new_review_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/ui_model/review_ui_class.dart';
import 'package:withconi/module/theme/text_theme.dart';
import 'package:withconi/module/widgets/appbar/appbar.dart';
import 'package:withconi/module/widgets/button/text_radio_button.dart';
import 'package:withconi/module/widgets/button/wide_button.dart';
import '../../widgets/button/check_selection_button.dart';
import '../../widgets/button/place_verification_button.dart';
import '../../widgets/button/text_button.dart';
import '../../widgets/checkbox/custom_checkbox.dart';
import '../../widgets/scaffold/loading_scaffold.dart';
import 'map_widgets/review_rate_button.dart';

class MapNewReviewPage extends StatelessWidget {
  MapNewReviewPage({Key? key}) : super(key: key);

  final MapNewReviewController _controller = Get.put(MapNewReviewController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingScaffold(
        isLoading: _controller.isLoading.value,
        appBar: WcAppBar(
          title: '리뷰 작성하기',
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
                      GestureDetector(
                        onTap: _controller.searchNewPlaceToReview,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '리뷰를 작성할 병원을 검색해주세요',
                                style: GoogleFonts.notoSans(
                                    color: WcColors.grey200,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              SvgPicture.asset(
                                'assets/icons/search.svg',
                                color: WcColors.grey120,
                              )
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => Container(
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
                                          image: NetworkImage(_controller
                                              .reviewPlace.value.thumbnail),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: (_controller.isPlaceVerified.value)
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
                                          ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _controller.reviewPlace.value.name,
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
                                          _controller.reviewPlace.value.address,
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
                              PlaceVerificationButton(
                                visitVerified:
                                    _controller.isPlaceVerified.value,
                                onTap: () {
                                  _controller.verifyPlaceVisit(
                                    context: context,
                                  );
                                },
                              ),
                            ],
                          ),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
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
                                '어떤 질병으로 방문하셨나요?(선택)',
                                style: TextStyle(
                                    fontFamily: WcFontFamily.notoSans,
                                    color: WcColors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Obx(
                              () => Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: WcUnderlinedTextButton(
                                  active: _controller.isDiseaseSelected.value,
                                  onTap: _controller.searchDisease,
                                  valueText: _controller.diseaseText.value,
                                  hintText: '질병 검색하여 추가',
                                  suffixIcon: SvgPicture.asset(
                                    'assets/icons/search.svg',
                                  ),
                                  suffixText:
                                      _controller.diseaseSuffixText.value,
                                ),
                              ),
                            )
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
                            Wrap(
                                direction: Axis.horizontal,
                                children: _controller.diseaseTypeList
                                    .map(
                                      (disease) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: SizedBox(
                                          width: (WcWidth / 2) - 40,
                                          child: CustomCheckBox(
                                            value: disease,
                                            isSelected: _controller
                                                .selectedDiseaseTypeList
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
                        visible: (_controller.showReviewRateSection.value &&
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
                              children: (_controller
                                          .selectedReviewEntity.value ==
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
      ),
    );
  }
}
