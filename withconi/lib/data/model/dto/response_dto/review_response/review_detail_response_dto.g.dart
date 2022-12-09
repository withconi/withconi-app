// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_detail_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewDetailResponseDTO _$$_ReviewDetailResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ReviewDetailResponseDTO(
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
      conimals: (json['conimals'] as List<dynamic>)
          .map((e) => ConimalResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      diseaseTypeList: (json['diseaseTypeList'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$DiseaseTypeEnumMap, e))
              .toList() ??
          const [],
      diseaseList: (json['diseaseList'] as List<dynamic>?)
              ?.map(
                  (e) => DiseaseResponseDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      placeName: json['name'] as String? ?? '장소 이름 없음',
      reviewRate: $enumDecode(_$ReviewRateEnumMap, json['status']),
      reviewId: json['_id'] as String,
      userId: json['userId'] as String,
      placeThumbnail: json['placeThumbnail'] as String? ?? '',
      placeId: json['locId'] as String,
      placeType: $enumDecode(_$PlaceTypeEnumMap, json['locType']),
      placeAddress: json['address'] as String,
      reviewImageList: (json['reviewImageList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      reviewItems: (json['reviewItems'] as List<dynamic>)
          .map((e) => $enumDecode(_$ReviewItemEnumMap, e))
          .toList(),
      reviewDesc: json['reviewDesc'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReviewDetailResponseDTOToJson(
        _$_ReviewDetailResponseDTO instance) =>
    <String, dynamic>{
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'conimals': instance.conimals.map((e) => e.toJson()).toList(),
      'diseaseTypeList': instance.diseaseTypeList
          .map((e) => _$DiseaseTypeEnumMap[e]!)
          .toList(),
      'diseaseList': instance.diseaseList.map((e) => e.toJson()).toList(),
      'name': instance.placeName,
      'status': _$ReviewRateEnumMap[instance.reviewRate]!,
      '_id': instance.reviewId,
      'userId': instance.userId,
      'placeThumbnail': instance.placeThumbnail,
      'locId': instance.placeId,
      'locType': _$PlaceTypeEnumMap[instance.placeType]!,
      'address': instance.placeAddress,
      'reviewImageList': instance.reviewImageList,
      'reviewItems':
          instance.reviewItems.map((e) => _$ReviewItemEnumMap[e]!).toList(),
      'reviewDesc': instance.reviewDesc,
    };

const _$DiseaseTypeEnumMap = {
  DiseaseType.all: 'all',
  DiseaseType.oncology: 'oncology',
  DiseaseType.endocrinology: 'endocrinology',
  DiseaseType.urinary: 'urinary',
  DiseaseType.cardiovacular: 'cardiovacular',
  DiseaseType.digestive: 'digestive',
  DiseaseType.infectiousDisease: 'infectiousDisease',
  DiseaseType.musculoskeletal: 'musculoskeletal',
  DiseaseType.brainNeurology: 'brainNeurology',
  DiseaseType.dermatology: 'dermatology',
  DiseaseType.otorhinolaryngology: 'otorhinolaryngology',
  DiseaseType.respiratory: 'respiratory',
  DiseaseType.dentistry: 'dentistry',
  DiseaseType.ophthalmology: 'ophthalmology',
  DiseaseType.emergency: 'emergency',
  DiseaseType.undefined: '',
};

const _$ReviewRateEnumMap = {
  ReviewRate.low: 'low',
  ReviewRate.middle: 'middle',
  ReviewRate.high: 'high',
};

const _$PlaceTypeEnumMap = {
  PlaceType.all: 'all',
  PlaceType.hospital: 'hospital',
  PlaceType.pharmacy: 'pharmacy',
};

const _$ReviewItemEnumMap = {
  ReviewItem.explanation: 'explanation',
  ReviewItem.kindness: 'kindness',
  ReviewItem.price: 'price',
  ReviewItem.adequateExamination: 'adequateExamination',
  ReviewItem.effectiveness: 'effectiveness',
  ReviewItem.waitingExperience: 'waitingExperience',
};
