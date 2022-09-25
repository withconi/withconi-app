import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/ui/entities/review_entity.dart';

class Review {
  ReviewRate reviewRate = ReviewRate.middle;
  late ReviewRateEntity reviewRateEntity;
  int reviewNum = 0;

  Review({
    required this.reviewRate,
    required this.reviewNum,
    required this.reviewRateEntity,
  });

  Review.fromJson(Map<String, dynamic> json, ReviewRate reviewRate) {
    Map<ReviewItems, int> itemMap = {};
    reviewRate = reviewRate;
    reviewNum = json['totalReviews'] ?? 0;

    for (ReviewItems reviewItem in ReviewItems.values) {
      itemMap[reviewItem] = json[reviewItemsToValue(reviewItem)];
    }

    switch (reviewRate) {
      case ReviewRate.high:
        reviewRateEntity = HighReviewEntity();
        reviewRateEntity.reviewItems = itemMap;
        break;

      case ReviewRate.middle:
        reviewRateEntity = MiddleReviewEntity();
        reviewRateEntity.reviewItems = itemMap;
        break;

      case ReviewRate.low:
        reviewRateEntity = LowReviewEntity();
        reviewRateEntity.reviewItems = itemMap;
        break;
    }
  }
}
