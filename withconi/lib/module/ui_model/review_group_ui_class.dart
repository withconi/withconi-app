import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/ui_model/review_ui_class.dart';

class ReviewGroupUIClass {
  ReviewRate reviewRate = ReviewRate.middle;
  late ReviewUIClassImpl reviewRateEntity;
  int reviewNum = 0;

  ReviewGroupUIClass({
    required this.reviewRate,
    required this.reviewNum,
    required this.reviewRateEntity,
  });

  ReviewGroupUIClass.fromJson(
      Map<String, dynamic> json, ReviewRate reviewRate) {
    Map<ReviewItems, int> itemMap = {};
    reviewRate = reviewRate;
    reviewNum = json['totalReviews'] ?? 0;

    for (ReviewItems reviewItem in ReviewItems.values) {
      itemMap[reviewItem] = json[reviewItem.code];
    }

    switch (reviewRate) {
      case ReviewRate.high:
        reviewRateEntity = HighReviewUIClass(selectedReviewItems: []);
        reviewRateEntity.reviewItemsMap = itemMap;
        break;

      case ReviewRate.middle:
        reviewRateEntity = MiddleReviewUIClass(selectedReviewItems: []);
        reviewRateEntity.reviewItemsMap = itemMap;
        break;

      case ReviewRate.low:
        reviewRateEntity = LowReviewUIClass(selectedReviewItems: []);
        reviewRateEntity.reviewItemsMap = itemMap;
        break;
    }
  }
}
