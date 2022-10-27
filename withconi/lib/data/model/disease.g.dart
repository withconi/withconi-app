// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Disease _$$_DiseaseFromJson(Map<String, dynamic> json) => _$_Disease(
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      symptomGroups: (json['symptomGroups'] as List<dynamic>?)
              ?.map((e) => SymptomGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      diseaseType:
          $enumDecodeNullable(_$DiseaseTypeEnumMap, json['diseaseType']),
    );

Map<String, dynamic> _$$_DiseaseToJson(_$_Disease instance) =>
    <String, dynamic>{
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'symptomGroups': instance.symptomGroups.map((e) => e.toJson()).toList(),
      'diseaseType': _$DiseaseTypeEnumMap[instance.diseaseType],
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
