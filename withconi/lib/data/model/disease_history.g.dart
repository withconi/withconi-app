// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiseaseHistory _$$_DiseaseHistoryFromJson(Map<String, dynamic> json) =>
    _$_DiseaseHistory(
      diseaseType: $enumDecode(_$DiseaseTypeEnumMap, json['diseaseType']),
      totalTypeHistory: json['totalTypeHistory'] as int,
      diseaseTypeDetailList: (json['diseaseTypeDetailList'] as List<dynamic>)
          .map((e) => DiseaseHistoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DiseaseHistoryToJson(_$_DiseaseHistory instance) =>
    <String, dynamic>{
      'diseaseType': _$DiseaseTypeEnumMap[instance.diseaseType]!,
      'totalTypeHistory': instance.totalTypeHistory,
      'diseaseTypeDetailList':
          instance.diseaseTypeDetailList.map((e) => e.toJson()).toList(),
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
