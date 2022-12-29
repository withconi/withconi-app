// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_result_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiagnosisResultResponseDTO _$$_DiagnosisResultResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_DiagnosisResultResponseDTO(
      diseaseId: json['_id'] as String? ?? '',
      diseaseName: json['name'] as String,
      posibility: $enumDecode(_$DiseasePosibilityEnumMap, json['status']),
    );

Map<String, dynamic> _$$_DiagnosisResultResponseDTOToJson(
        _$_DiagnosisResultResponseDTO instance) =>
    <String, dynamic>{
      '_id': instance.diseaseId,
      'name': instance.diseaseName,
      'status': _$DiseasePosibilityEnumMap[instance.posibility]!,
    };

const _$DiseasePosibilityEnumMap = {
  DiseasePosibility.high: 'high',
  DiseasePosibility.middle: 'middle',
  DiseasePosibility.low: 'low',
  DiseasePosibility.undefined: 'undefined',
};
