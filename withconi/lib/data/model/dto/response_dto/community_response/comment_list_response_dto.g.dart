// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentListResponseDTO _$$_CommentListResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_CommentListResponseDTO(
      list: (json['list'] as List<dynamic>)
          .map((e) => CommentResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocuments: json['totalDocuments'] as int,
    );

Map<String, dynamic> _$$_CommentListResponseDTOToJson(
        _$_CommentListResponseDTO instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'totalDocuments': instance.totalDocuments,
    };
