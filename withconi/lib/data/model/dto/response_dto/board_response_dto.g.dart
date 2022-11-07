// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BoardResponseDTO _$$_BoardResponseDTOFromJson(Map<String, dynamic> json) =>
    _$_BoardResponseDTO(
      boardId: json['boardId'] as int,
      title: json['title'] as String,
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
    );

Map<String, dynamic> _$$_BoardResponseDTOToJson(_$_BoardResponseDTO instance) =>
    <String, dynamic>{
      'boardId': instance.boardId,
      'title': instance.title,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };
