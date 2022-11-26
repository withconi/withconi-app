// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_duplication_check_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfoExistenceResponseDTO _$$_UserInfoExistenceResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_UserInfoExistenceResponseDTO(
      isAuth: json['isAuth'] as bool? ?? false,
      isDB: json['isDB'] as bool? ?? false,
      provider: $enumDecodeNullable(_$ProviderEnumMap, json['provider']),
    );

Map<String, dynamic> _$$_UserInfoExistenceResponseDTOToJson(
        _$_UserInfoExistenceResponseDTO instance) =>
    <String, dynamic>{
      'isAuth': instance.isAuth,
      'isDB': instance.isDB,
      'provider': _$ProviderEnumMap[instance.provider],
    };

const _$ProviderEnumMap = {
  Provider.kakao: 'kakao',
  Provider.naver: 'naver',
  Provider.google: 'google',
  Provider.apple: 'apple',
  Provider.email: 'email',
  Provider.undefined: 'undefined',
};
