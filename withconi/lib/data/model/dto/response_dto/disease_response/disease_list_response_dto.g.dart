// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiseaseListResponseDTO _$$_DiseaseListResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_DiseaseListResponseDTO(
      list: (json['list'] as List<dynamic>)
          .map((e) => DiseaseResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocuments: json['totalDocuments'] as int,
    );

Map<String, dynamic> _$$_DiseaseListResponseDTOToJson(
        _$_DiseaseListResponseDTO instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'totalDocuments': instance.totalDocuments,
    };
