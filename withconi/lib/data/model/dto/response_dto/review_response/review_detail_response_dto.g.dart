// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_detail_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewDetailResponseDTO _$$_ReviewDetailResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ReviewDetailResponseDTO(
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
      placePreview: PlacePreviewResponseDTO.fromJson(
          json['placePreview'] as Map<String, dynamic>),
      conimals: (json['conimals'] as List<dynamic>)
          .map((e) => ConimalResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      diseaseTypeList: (json['diseaseTypeList'] as List<dynamic>)
          .map((e) => $enumDecode(_$DiseaseTypeEnumMap, e))
          .toList(),
      diseaseList: (json['diseaseList'] as List<dynamic>)
          .map((e) => DiseaseResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewRate: $enumDecode(_$ReviewRateEnumMap, json['reviewRate']),
      reviewItems: (json['reviewItems'] as List<dynamic>)
          .map((e) => $enumDecode(_$ReviewItemEnumMap, e))
          .toList(),
      reviewDesc: json['reviewDesc'] as String,
      definition: json['definition'] as String? ?? '',
      diagnosisTechnique: json['diagnosisTechnique'] as String? ?? '',
      treatment: json['treatment'] as String? ?? '',
      advice: json['advice'] as String? ?? '',
      symptomGroupList: (json['symptomGroupList'] as List<dynamic>?)
              ?.map((e) => SymptomGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      diseaseType:
          $enumDecodeNullable(_$DiseaseTypeEnumMap, json['diseaseType']) ??
              DiseaseType.brainNeurology,
    );

Map<String, dynamic> _$$_ReviewDetailResponseDTOToJson(
        _$_ReviewDetailResponseDTO instance) =>
    <String, dynamic>{
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'placePreview': instance.placePreview.toJson(),
      'conimals': instance.conimals.map((e) => e.toJson()).toList(),
      'diseaseTypeList': instance.diseaseTypeList
          .map((e) => _$DiseaseTypeEnumMap[e]!)
          .toList(),
      'diseaseList': instance.diseaseList.map((e) => e.toJson()).toList(),
      'reviewRate': _$ReviewRateEnumMap[instance.reviewRate]!,
      'reviewItems':
          instance.reviewItems.map((e) => _$ReviewItemEnumMap[e]!).toList(),
      'reviewDesc': instance.reviewDesc,
      'definition': instance.definition,
      'diagnosisTechnique': instance.diagnosisTechnique,
      'treatment': instance.treatment,
      'advice': instance.advice,
      'symptomGroupList':
          instance.symptomGroupList.map((e) => e.toJson()).toList(),
      'diseaseType': _$DiseaseTypeEnumMap[instance.diseaseType]!,
    };

const _$DiseaseTypeEnumMap = {
  DiseaseType.all: 'all',
  DiseaseType.cardiovascular: 'cardiovascular',
  DiseaseType.musculoskeletal: 'musculoskeletal',
  DiseaseType.digestive: 'digestive',
  DiseaseType.ophthalmology: 'ophthalmology',
  DiseaseType.urinary: 'urinary',
  DiseaseType.respiratory: 'respiratory',
  DiseaseType.otorhinolaryngology: 'otorhinolaryngology',
  DiseaseType.infectiousDisease: 'infectiousDisease',
  DiseaseType.brainNeurology: 'brainNeurology',
  DiseaseType.dentistry: 'dentistry',
  DiseaseType.oncology: 'oncology',
  DiseaseType.dermatology: 'dermatology',
  DiseaseType.endocrinology: 'endocrinology',
  DiseaseType.emergency: 'emergency',
};

const _$ReviewRateEnumMap = {
  ReviewRate.low: 'low',
  ReviewRate.middle: 'middle',
  ReviewRate.high: 'high',
};

const _$ReviewItemEnumMap = {
  ReviewItem.explanation: 'explanation',
  ReviewItem.kindness: 'kindness',
  ReviewItem.price: 'price',
  ReviewItem.adequateExamination: 'adequate_examination',
  ReviewItem.effectiveness: 'effectiveness',
  ReviewItem.waitingExperience: 'waiting_experience',
};
