// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_history_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewHistoryGroupResponseDTO _$$_ReviewHistoryGroupResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ReviewHistoryGroupResponseDTO(
      totalReviewCount: json['totalReviews'] as int,
      reviewHistoryMap: (json['reviewHistoryMap'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$ReviewRateEnumMap, k),
            ReviewItemResponseDTO.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_ReviewHistoryGroupResponseDTOToJson(
        _$_ReviewHistoryGroupResponseDTO instance) =>
    <String, dynamic>{
      'totalReviews': instance.totalReviewCount,
      'reviewHistoryMap': instance.reviewHistoryMap
          .map((k, e) => MapEntry(_$ReviewRateEnumMap[k]!, e)),
    };

const _$ReviewRateEnumMap = {
  ReviewRate.low: 'low',
  ReviewRate.middle: 'middle',
  ReviewRate.high: 'high',
};
