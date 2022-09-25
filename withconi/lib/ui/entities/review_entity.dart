import 'dart:ui';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/ui/theme/colors.dart';

abstract class ReviewRateEntity {
  // late final List<ReviewItems> reviewItems;
  late final int reviewNum;
  late final Map<ReviewItems, int> reviewItems;
  late final String Function(ReviewItems reviewItems) reviewItemsToString;
  late final String activeIconSrc;
  late final String inactiveIconSrc;
  late final Color activeBackground;
  late final Color inactiveBackground;
  late final ReviewRate reviewRate;
  late final String text;
  late final String question;
}

class HighReviewEntity implements ReviewRateEntity {
  @override
  int reviewNum = 0;

  @override
  ReviewRate reviewRate = ReviewRate.high;

  @override
  Map<ReviewItems, int> reviewItems = {
    ReviewItems.explanation: 0,
    ReviewItems.kindness: 0,
    ReviewItems.price: 0,
    ReviewItems.adequateExamination: 0,
    ReviewItems.effectiveness: 0,
    ReviewItems.waitingExperience: 0,
  };

  @override
  String Function(ReviewItems reviewItem) reviewItemsToString = (reviewItem) {
    switch (reviewItem) {
      case ReviewItems.explanation:
        return "설명이 상세해요";
      case ReviewItems.kindness:
        return "친절해요";
      case ReviewItems.price:
        return "진료 금액이 적절해요";
      case ReviewItems.adequateExamination:
        return "필요한 진료만 해요";
      case ReviewItems.effectiveness:
        return "진료가 효과적이에요";
      case ReviewItems.waitingExperience:
        return "진료 대기 환경이 좋았어요";
      default:
        return "";
    }
  };

  @override
  Color activeBackground = WcColors.blue60;

  @override
  Color inactiveBackground = WcColors.grey20;

  @override
  String activeIconSrc = 'assets/icons/good_face.svg';
  @override
  String inactiveIconSrc = 'assets/icons/good_face_inactive.svg';
  @override
  String text = '추천해요';
  @override
  String question = '어떤 점 때문에 추천하시나요?';
}

class MiddleReviewEntity implements ReviewRateEntity {
  @override
  int reviewNum = 0;

  @override
  ReviewRate reviewRate = ReviewRate.middle;

  @override
  Map<ReviewItems, int> reviewItems = {
    ReviewItems.explanation: 0,
    ReviewItems.kindness: 0,
    ReviewItems.price: 0,
    ReviewItems.adequateExamination: 0,
    ReviewItems.effectiveness: 0,
    ReviewItems.waitingExperience: 0,
  };

  @override
  String Function(ReviewItems reviewItem) reviewItemsToString = (reviewItem) {
    switch (reviewItem) {
      case ReviewItems.explanation:
        return "설명이 상세해요";
      case ReviewItems.kindness:
        return "친절해요";
      case ReviewItems.price:
        return "진료 금액이 꽤 적절해요";
      case ReviewItems.adequateExamination:
        return "필요한 진료만 해요";
      case ReviewItems.effectiveness:
        return "진료가 꽤 효과적이에요";
      case ReviewItems.waitingExperience:
        return "진료 대기 환경이 괜찮았어요";
      default:
        return "";
    }
  };

  @override
  Color activeBackground = WcColors.yellow20;

  @override
  Color inactiveBackground = WcColors.grey20;

  @override
  String activeIconSrc = 'assets/icons/neutral_face.svg';
  @override
  String inactiveIconSrc = 'assets/icons/neutral_face_inactive.svg';

  @override
  String text = '적당해요';

  @override
  String question = '어떤 점 때문에 적당한가요?';
}

class LowReviewEntity implements ReviewRateEntity {
  @override
  int reviewNum = 0;

  @override
  ReviewRate reviewRate = ReviewRate.low;

  @override
  Map<ReviewItems, int> reviewItems = {
    ReviewItems.explanation: 0,
    ReviewItems.kindness: 0,
    ReviewItems.price: 0,
    ReviewItems.adequateExamination: 0,
    ReviewItems.effectiveness: 0,
    ReviewItems.waitingExperience: 0,
  };

  @override
  String Function(ReviewItems reviewItem) reviewItemsToString = (reviewItem) {
    switch (reviewItem) {
      case ReviewItems.explanation:
        return "설명이 상세하지 않아요";
      case ReviewItems.kindness:
        return "불친절해요";
      case ReviewItems.price:
        return "진료 금액이 생각보다 비싸요";
      case ReviewItems.adequateExamination:
        return "필요 이상의 진료를 해요";
      case ReviewItems.effectiveness:
        return "진료 효과가 미비했어요";
      case ReviewItems.waitingExperience:
        return "진료 대기 환경이 좋지 않아요";
      default:
        return "";
    }
  };

  @override
  Color activeBackground = WcColors.pink20;

  @override
  Color inactiveBackground = WcColors.grey20;

  @override
  String activeIconSrc = 'assets/icons/bad_face.svg';
  @override
  String inactiveIconSrc = 'assets/icons/bad_face_inactive.svg';

  @override
  String text = '아쉬워요';

  @override
  String question = '어떤 점 때문에 아쉬우신가요?';
}
