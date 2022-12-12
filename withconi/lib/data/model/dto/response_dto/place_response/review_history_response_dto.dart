import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/review_history_item_response_dto.dart';

import '../../../../enums/enum.dart';
import '../abstract_dto/response_dto.dart';
part 'review_history_response_dto.freezed.dart';
part 'review_history_response_dto.g.dart';

@freezed
class ReviewHistoryResponseDTO
    with _$ReviewHistoryResponseDTO
    implements ResponseDTO {
  factory ReviewHistoryResponseDTO({
    @JsonKey(name: 'totalReviews') @Default(0) int totalReviewCount,
    required Map<ReviewRate, ReviewItemResponseDTO> reviewHistoryMap,
  }) = _ReviewHistoryGroupResponseDTO;

  factory ReviewHistoryResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewHistoryResponseDTOFromJson(json);
}
