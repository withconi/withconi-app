// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_preview_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlacePreviewListResponseDTO _$$_PlacePreviewListResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_PlacePreviewListResponseDTO(
      list: (json['list'] as List<dynamic>)
          .map((e) =>
              PlacePreviewResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocuments: json['totalDocuments'] as int,
    );

Map<String, dynamic> _$$_PlacePreviewListResponseDTOToJson(
        _$_PlacePreviewListResponseDTO instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'totalDocuments': instance.totalDocuments,
    };
