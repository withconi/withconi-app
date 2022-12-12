// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiseaseResponseDTO _$$_DiseaseResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_DiseaseResponseDTO(
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
      diseaseId: json['_id'] as String,
      code: json['code'] as String,
      boardId: json['boardId'] as int? ?? 1,
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
      '_id': instance.diseaseId,
      'code': instance.code,
      'boardId': instance.boardId,
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
