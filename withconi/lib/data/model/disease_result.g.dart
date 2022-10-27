// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiseaseResult _$$_DiseaseResultFromJson(Map<String, dynamic> json) =>
    _$_DiseaseResult(
      diseaseId: json['diseaseId'] as String,
      diseaseName: json['diseaseName'] as String,
      posibility: $enumDecode(_$DiseasePosibilityEnumMap, json['posibility']),
    );

Map<String, dynamic> _$$_DiseaseResultToJson(_$_DiseaseResult instance) =>
    <String, dynamic>{
      'diseaseId': instance.diseaseId,
      'diseaseName': instance.diseaseName,
      'posibility': _$DiseasePosibilityEnumMap[instance.posibility]!,
    };

const _$DiseasePosibilityEnumMap = {
  DiseasePosibility.high: 'high',
  DiseasePosibility.middle: 'middle',
  DiseasePosibility.low: 'low',
};
