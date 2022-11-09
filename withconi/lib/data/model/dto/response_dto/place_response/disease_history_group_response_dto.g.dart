// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_history_group_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiseaseHistoryListResponseDTO _$$_DiseaseHistoryListResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_DiseaseHistoryListResponseDTO(
      diseaseHistoryList: (json['diseaseHistoryList'] as List<dynamic>)
          .map((e) =>
              DiseaseHistoryResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDiseaseHistoryCount: json['totalDiseaseHistoryCount'] as int,
    );

Map<String, dynamic> _$$_DiseaseHistoryListResponseDTOToJson(
        _$_DiseaseHistoryListResponseDTO instance) =>
    <String, dynamic>{
      'diseaseHistoryList':
          instance.diseaseHistoryList.map((e) => e.toJson()).toList(),
      'totalDiseaseHistoryCount': instance.totalDiseaseHistoryCount,
    };
