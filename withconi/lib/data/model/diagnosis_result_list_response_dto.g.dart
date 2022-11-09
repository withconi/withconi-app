// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_result_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiagnosisResultListResponseDTO _$$_DiagnosisResultListResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_DiagnosisResultListResponseDTO(
      list: (json['list'] as List<dynamic>)
          .map((e) =>
              DiagnosisResultResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocuments: json['totalDocuments'] as int,
    );

Map<String, dynamic> _$$_DiagnosisResultListResponseDTOToJson(
        _$_DiagnosisResultListResponseDTO instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'totalDocuments': instance.totalDocuments,
    };
