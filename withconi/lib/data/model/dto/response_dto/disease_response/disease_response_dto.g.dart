// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiseaseResponseDTO _$$_DiseaseResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_DiseaseResponseDTO(
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
      code: json['_id'] as String,
      name: json['name'] as String,
      definition: json['definition'] as String? ?? '',
      diagnosisTechnique: json['diagnosisTechnique'] as String? ?? '',
      treatment: json['treatment'] as String? ?? '',
      advice: json['detailAdvice'] as String? ?? '',
      symptomGroupList: (json['symptomGroupList'] as List<dynamic>?)
              ?.map((e) => SymptomGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      diseaseType:
          $enumDecodeNullable(_$DiseaseTypeEnumMap, json['diseaseType']) ??
              DiseaseType.undefined,
    );

Map<String, dynamic> _$$_DiseaseResponseDTOToJson(
        _$_DiseaseResponseDTO instance) =>
    <String, dynamic>{
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      '_id': instance.code,
      'name': instance.name,
      'definition': instance.definition,
      'diagnosisTechnique': instance.diagnosisTechnique,
      'treatment': instance.treatment,
      'detailAdvice': instance.advice,
      'symptomGroupList':
          instance.symptomGroupList.map((e) => e.toJson()).toList(),
      'diseaseType': _$DiseaseTypeEnumMap[instance.diseaseType]!,
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
