// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_history_item_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiseaseHistoryResponseDTO _$$_DiseaseHistoryResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_DiseaseHistoryResponseDTO(
      diseaseName: json['diseaseName'] as String? ?? '구체적인 질병 없음',
      diseasePercent: json['diseasePercent'] as int? ?? 0,
    );

Map<String, dynamic> _$$_DiseaseHistoryResponseDTOToJson(
        _$_DiseaseHistoryResponseDTO instance) =>
    <String, dynamic>{
      'diseaseName': instance.diseaseName,
      'diseasePercent': instance.diseasePercent,
    };
