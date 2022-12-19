// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewListResponseDTO _$$_ReviewListResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ReviewListResponseDTO(
      list: (json['list'] as List<dynamic>)
          .map((e) =>
              ReviewDetailResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocuments: json['totalDocuments'] as int,
    );

Map<String, dynamic> _$$_ReviewListResponseDTOToJson(
        _$_ReviewListResponseDTO instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'totalDocuments': instance.totalDocuments,
    };
