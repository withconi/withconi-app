// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomToken _$$_CustomTokenFromJson(Map<String, dynamic> json) =>
    _$_CustomToken(
      provider: $enumDecode(_$ProviderEnumMap, json['provider']),
      uid: json['uid'] as String,
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$$_CustomTokenToJson(_$_CustomToken instance) =>
    <String, dynamic>{
      'provider': _$ProviderEnumMap[instance.provider]!,
      'uid': instance.uid,
      'accessToken': instance.accessToken,
    };

const _$ProviderEnumMap = {
  Provider.kakao: 'kakao',
  Provider.naver: 'naver',
  Provider.google: 'google',
  Provider.apple: 'apple',
  Provider.email: 'email',
  Provider.none: 'none',
};
