// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostListResponseDTO _$$_PostListResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_PostListResponseDTO(
      list: (json['list'] as List<dynamic>)
          .map((e) => PostResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocuments: json['totalDocuments'] as int,
    );

Map<String, dynamic> _$$_PostListResponseDTOToJson(
        _$_PostListResponseDTO instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'totalDocuments': instance.totalDocuments,
    };
