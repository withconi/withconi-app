// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_history_group_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiseaseHistoryGroupResponseDTO _$$_DiseaseHistoryGroupResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_DiseaseHistoryGroupResponseDTO(
      historyList: (json['historyList'] as List<dynamic>)
          .map((e) =>
              DiseaseHistoryResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalHistory: json['totalHistory'] as int,
    );

Map<String, dynamic> _$$_DiseaseHistoryGroupResponseDTOToJson(
        _$_DiseaseHistoryGroupResponseDTO instance) =>
    <String, dynamic>{
      'historyList': instance.historyList.map((e) => e.toJson()).toList(),
      'totalHistory': instance.totalHistory,
    };
