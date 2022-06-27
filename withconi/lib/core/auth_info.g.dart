// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthInfo _$$_AuthInfoFromJson(Map<String, dynamic> json) => _$_AuthInfo(
      authObject: json['authObject'],
      email: json['email'] as String,
      provider: $enumDecode(_$ProviderOptionsEnumMap, json['provider']),
    );

Map<String, dynamic> _$$_AuthInfoToJson(_$_AuthInfo instance) =>
    <String, dynamic>{
      'authObject': instance.authObject,
      'email': instance.email,
      'provider': _$ProviderOptionsEnumMap[instance.provider],
    };

const _$ProviderOptionsEnumMap = {
  ProviderOptions.kakao: 'kakao',
  ProviderOptions.naver: 'naver',
  ProviderOptions.google: 'google',
  ProviderOptions.apple: 'apple',
  ProviderOptions.email: 'email',
  ProviderOptions.none: 'none',
};
