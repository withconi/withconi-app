import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/ui/entities/review_rate_entity.dart';

class ReviewGroupEntity {
  ReviewRate reviewRate = ReviewRate.middle;
  late ReviewEntity reviewRateEntity;
  int reviewNum = 0;

  ReviewGroupEntity({
    required this.reviewRate,
    required this.reviewNum,
    required this.reviewRateEntity,
  });

  ReviewGroupEntity.fromJson(Map<String, dynamic> json, ReviewRate reviewRate) {
    Map<ReviewItems, int> itemMap = {};
    reviewRate = reviewRate;
    reviewNum = json['totalReviews'] ?? 0;

    for (ReviewItems reviewItem in ReviewItems.values) {
      itemMap[reviewItem] = json[reviewItemsToValue(reviewItem)];
    }

    switch (reviewRate) {
      case ReviewRate.high:
        reviewRateEntity = HighReviewEntity(selectedReviewItems: []);
        reviewRateEntity.reviewItemsMap = itemMap;
        break;

      case ReviewRate.middle:
        reviewRateEntity = MiddleReviewEntity(selectedReviewItems: []);
        reviewRateEntity.reviewItemsMap = itemMap;
        break;

      case ReviewRate.low:
        reviewRateEntity = LowReviewEntity(selectedReviewItems: []);
        reviewRateEntity.reviewItemsMap = itemMap;
        break;
    }
  }
}
