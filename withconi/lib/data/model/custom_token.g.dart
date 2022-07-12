// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomToken _$$_CustomTokenFromJson(Map<String, dynamic> json) =>
    _$_CustomToken(
      provider: $enumDecode(_$ProviderOptionsEnumMap, json['provider']),
      uid: json['uid'] as String,
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$$_CustomTokenToJson(_$_CustomToken instance) =>
    <String, dynamic>{
      'provider': _$ProviderOptionsEnumMap[instance.provider],
      'uid': instance.uid,
      'accessToken': instance.accessToken,
    };

const _$ProviderOptionsEnumMap = {
  ProviderOptions.kakao: 'kakao',
  ProviderOptions.naver: 'naver',
  ProviderOptions.google: 'google',
  ProviderOptions.apple: 'apple',
  ProviderOptions.email: 'email',
  ProviderOptions.none: 'none',
};
