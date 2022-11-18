// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_history_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiseaseHistoryResponseDTO _$$_DiseaseHistoryResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_DiseaseHistoryResponseDTO(
      diseaseType: $enumDecode(_$DiseaseTypeEnumMap, json['diseaseType']),
      totalDiseaseType: json['totalDiseaseType'] as int,
      diseaseHistoryItems: (json['diseaseHistoryItems'] as List<dynamic>)
          .map((e) =>
              DiseaseHistoryItemResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DiseaseHistoryResponseDTOToJson(
        _$_DiseaseHistoryResponseDTO instance) =>
    <String, dynamic>{
      'diseaseType': _$DiseaseTypeEnumMap[instance.diseaseType]!,
      'totalDiseaseType': instance.totalDiseaseType,
      'diseaseHistoryItems':
          instance.diseaseHistoryItems.map((e) => e.toJson()).toList(),
    };

const _$DiseaseTypeEnumMap = {
  DiseaseType.all: '',
  DiseaseType.cardiovacular: 'cardiovacular',
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
  DiseaseType.undefined: 'undefined',
};
