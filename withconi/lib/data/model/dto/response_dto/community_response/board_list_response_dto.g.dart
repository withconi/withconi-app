// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BoardListResponseDTO _$$_BoardListResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_BoardListResponseDTO(
      list: (json['list'] as List<dynamic>)
          .map((e) => BoardResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocuments: json['totalDocuments'] as int,
    );

Map<String, dynamic> _$$_BoardListResponseDTOToJson(
        _$_BoardListResponseDTO instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'totalDocuments': instance.totalDocuments,
    };
