import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/community/community_new_post_controller.dart';
import 'package:withconi/controller/map/map_review_controller.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/entities/review_entity.dart';
import 'package:withconi/ui/theme/text_theme.dart';
import 'package:withconi/ui/widgets/appbar/appbar.dart';
import 'package:withconi/ui/widgets/button/text_radio_button.dart';
import 'package:withconi/ui/widgets/button/wide_button.dart';

import '../../../data/model/conimal.dart';

class MapNewReviewPage extends StatelessWidget {
  MapNewReviewPage({Key? key}) : super(key: key);

  final MapReviewController _controller = Get.put(MapReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Container(
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
                                    child: (_controller.visitVerified.value)
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
                              visitVerified: _controller.visitVerified.value,
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
                                        text: diseaseTypeToKorean(disease),
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
                                    .reviewItems.keys
                                    .toList()
                                    .map((reviewItem) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: CustomCheckBox(
                                        value: reviewItem,
                                        isSelected: _controller
                                            .selectedReviewItemList
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

class ReviewRateButton extends StatelessWidget {
  ReviewRateButton(
      {Key? key,
      required this.onChanged,
      required this.reviewRate,
      required this.activeBackgroundColor,
      required this.activeIconSrc,
      this.inactiveBackgroundColor = WcColors.grey20,
      required this.inactiveIconSrc,
      required this.text,
      required this.isActive})
      : super(key: key);
  Function(ReviewRateEntity)? onChanged;
  ReviewRateEntity reviewRate;
  Color activeBackgroundColor;
  Color inactiveBackgroundColor;
  String activeIconSrc;
  String inactiveIconSrc;
  bool isActive;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              onChanged!.call(reviewRate);
            },
            child: CircleAvatar(
              radius: 42,
              backgroundColor:
                  (isActive) ? activeBackgroundColor : inactiveBackgroundColor,
              child: SvgPicture.asset(
                (isActive) ? activeIconSrc : inactiveIconSrc,
                width: 34,
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
                fontFamily: WcFontFamily.notoSans,
                color: WcColors.black,
                fontSize: 15,
                height: 1.1,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({
    Key? key,
    required this.value,
    required this.text,
    required this.isSelected,
    required this.onChanged,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.iconHeight = 23,
    this.textSize = 15.5,
  }) : super(key: key);

  dynamic value;
  String text;
  bool isSelected;
  Function(dynamic)? onChanged;
  MainAxisAlignment mainAxisAlignment;
  double iconHeight;
  double textSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged!.call(value);
      },
      child: Container(
        color: WcColors.white,
        height: 45,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: mainAxisAlignment,
          children: [
            (isSelected)
                ? SvgPicture.asset(
                    'assets/icons/checkbox_checked.svg',
                    height: iconHeight,
                  )
                : SvgPicture.asset(
                    'assets/icons/checkbox_unchecked.svg',
                    height: iconHeight,
                  ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  fontFamily: WcFontFamily.notoSans,
                  color: WcColors.black,
                  fontSize: textSize,
                  height: 1.2,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}

class VisitedConimalSelectionButton extends StatelessWidget {
  VisitedConimalSelectionButton({
    Key? key,
    required this.selected,
    required this.conimal,
    this.onChanged,
  }) : super(key: key);

  bool selected;
  Conimal conimal;
  Function(Conimal)? onChanged;

  @override
  Widget build(BuildContext context) {
    String _species;
    if (conimal.species == Species.cat) {
      _species = 'cat';
    } else {
      _species = 'dog';
    }
    return GestureDetector(
      onTap: () {
        onChanged!.call(conimal);
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          const SizedBox(
            width: 110,
            height: 135,
          ),
          Positioned(
            left: 8,
            child: Container(
              alignment: Alignment.center,
              height: 130,
              width: 95,
              padding: EdgeInsets.fromLTRB(8, 12, 8, 0),
              decoration: BoxDecoration(
                  border: (selected)
                      ? Border.all(color: WcColors.blue100, width: 1.4)
                      : Border.all(color: WcColors.grey20),
                  color: (selected) ? WcColors.blue20 : WcColors.grey20,
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    (selected)
                        ? 'assets/icons/$_species.png'
                        : 'assets/icons/${_species}_grey.png',
                    height: 38,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 48,
                    child: Text(
                      conimal.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: WcFontFamily.notoSans,
                          color: (selected) ? WcColors.black : WcColors.grey160,
                          fontSize: 15,
                          height: 1.3,
                          overflow: TextOverflow.fade,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Text('15살',
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.openSans(
                            color:
                                (selected) ? WcColors.black : WcColors.grey140,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
          ),
          (selected)
              ? Positioned(
                  left: 0,
                  top: 0,
                  child:
                      SvgPicture.asset('assets/icons/check_circle_filled.svg'))
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class PlaceVerificationButton extends StatelessWidget {
  PlaceVerificationButton({Key? key, required this.visitVerified, this.onTap})
      : super(key: key);

  bool visitVerified;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: WcColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (visitVerified)
                ? Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: SvgPicture.asset(
                      'assets/icons/visit_verified.svg',
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: SvgPicture.asset(
                      'assets/icons/visit_unverified.svg',
                    ),
                  ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 30,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: (visitVerified) ? WcColors.blue20 : WcColors.red20,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                (visitVerified) ? '방문 인증 완료' : '방문 인증 미완료',
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color:
                        (visitVerified) ? WcColors.blue100 : WcColors.red100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
