import 'package:withconi/module/ui_model/review_detail_ui_model.dart';

abstract class AbstractMapReviewUpdate {
  // void updateReview(ReviewDetailUIModel updatedReview) {}
  void addReview(ReviewDetailUIModel newReview) {}
  void deleteReview(String reviewId, String placeId) {}
}
