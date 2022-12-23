// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer_info_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeveloperInfoListResponseDTO _$$_DeveloperInfoListResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_DeveloperInfoListResponseDTO(
      frontend: DeveloperInfoResponseDTO.fromJson(
          json['frontend'] as Map<String, dynamic>),
      backend: DeveloperInfoResponseDTO.fromJson(
          json['backend'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DeveloperInfoListResponseDTOToJson(
        _$_DeveloperInfoListResponseDTO instance) =>
    <String, dynamic>{
      'frontend': instance.frontend.toJson(),
      'backend': instance.backend.toJson(),
    };
