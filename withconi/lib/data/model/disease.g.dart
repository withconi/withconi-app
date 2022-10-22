// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Disease _$$_DiseaseFromJson(Map<String, dynamic> json) => _$_Disease(
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
      code: json['code'] as String,
      name: json['name'] as String,
      symptoms:
          (json['symptoms'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String? ?? '',
      diseaseType:
          $enumDecodeNullable(_$DiseaseTypeEnumMap, json['diseaseType']),
    );

Map<String, dynamic> _$$_DiseaseToJson(_$_Disease instance) =>
    <String, dynamic>{
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'code': instance.code,
      'name': instance.name,
      'symptoms': instance.symptoms,
      'description': instance.description,
      'diseaseType': _$DiseaseTypeEnumMap[instance.diseaseType],
    };

const _$DiseaseTypeEnumMap = {
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
