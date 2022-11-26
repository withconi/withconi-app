// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_history_item_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewItemResponseDTO _$$_ReviewItemResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ReviewItemResponseDTO(
      totalReviewRateCount: json['totalReviews'] as int,
      reviewHistoryMap: (json['reviewHistoryMap'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$ReviewItemEnumMap, k), e as int),
      ),
    );

Map<String, dynamic> _$$_ReviewItemResponseDTOToJson(
        _$_ReviewItemResponseDTO instance) =>
    <String, dynamic>{
      'totalReviews': instance.totalReviewRateCount,
      'reviewHistoryMap': instance.reviewHistoryMap
          .map((k, e) => MapEntry(_$ReviewItemEnumMap[k]!, e)),
    };

const _$ReviewItemEnumMap = {
  ReviewItem.explanation: 'explanation',
  ReviewItem.kindness: 'kindness',
  ReviewItem.price: 'price',
  ReviewItem.adequateExamination: 'adequateExamination',
  ReviewItem.effectiveness: 'effectiveness',
  ReviewItem.waitingExperience: 'waitingExperience',
};
