// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_history_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiseaseHistoryResponseDTO _$$_DiseaseHistoryResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_DiseaseHistoryResponseDTO(
      diseaseType:
          $enumDecodeNullable(_$DiseaseTypeEnumMap, json['diseaseType']) ??
              DiseaseType.undefined,
      totalDiseaseType: json['totalDiseaseType'] as int? ?? 0,
      diseaseTypeItemList: (json['diseaseTypeItemList'] as List<dynamic>?)
              ?.map((e) => DiseaseHistoryItemResponseDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_DiseaseHistoryResponseDTOToJson(
        _$_DiseaseHistoryResponseDTO instance) =>
    <String, dynamic>{
      'diseaseType': _$DiseaseTypeEnumMap[instance.diseaseType]!,
      'totalDiseaseType': instance.totalDiseaseType,
      'diseaseTypeItemList':
          instance.diseaseTypeItemList.map((e) => e.toJson()).toList(),
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
