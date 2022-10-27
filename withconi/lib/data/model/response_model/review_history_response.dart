import '../../../configs/constants/enum.dart';
import '../../../ui/entities/review_rate_entity.dart';

class ReviewHistoryResponse {
  List<ReviewEntity> reviewList;
  int totalReview = 0;

  ReviewHistoryResponse({required this.reviewList, required this.totalReview});

  factory ReviewHistoryResponse.fromJson(Map<String, dynamic> json) {
    List<ReviewEntity> list = [
      HighReviewEntity(selectedReviewItems: []),
      MiddleReviewEntity(selectedReviewItems: []),
      LowReviewEntity(selectedReviewItems: [])
    ];
    int totalNum = 0;

    ReviewRate.values.forEach(
      (reviewRate) {
        Map<ReviewItems, int> itemMap = {};
        for (ReviewItems reviewItem in ReviewItems.values) {
          itemMap[reviewItem] = json[reviewRateToValue(reviewRate)]
              [reviewItemsToValue(reviewItem)] as int;
        }
        switch (reviewRate) {
          case ReviewRate.high:
            list[0].reviewItemsMap = itemMap;
            list[0].reviewNum = json['high']['totalReviews'] as int;

            break;
          case ReviewRate.middle:
            list[1].reviewItemsMap = itemMap;
            list[1].reviewNum = json['middle']['totalReviews'] as int;
            break;
          case ReviewRate.low:
            list[2].reviewItemsMap = itemMap;
            list[2].reviewNum = json['low']['totalReviews'] as int;
            break;
          default:
        }
      },
    );

    for (ReviewEntity reviewItem in list) {
      totalNum += reviewItem.reviewNum;
    }

    return ReviewHistoryResponse(reviewList: list, totalReview: totalNum);
  }
}
