import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/enums/enum.dart';

import '../abstract_dto/response_dto.dart';
part 'review_history_item_response_dto.freezed.dart';
part 'review_history_item_response_dto.g.dart';

@freezed
class ReviewItemResponseDTO
    with _$ReviewItemResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory ReviewItemResponseDTO({
    @JsonKey(name: 'totalReviews') @Default(0) int totalReviewRateCount,
    required Map<ReviewItem, int> reviewHistoryMap,
  }) = _ReviewItemResponseDTO;
  factory ReviewItemResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewItemResponseDTOFromJson(json);
}
