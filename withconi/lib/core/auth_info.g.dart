// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthInfo _$$_AuthInfoFromJson(Map<String, dynamic> json) => _$_AuthInfo(
      authObject: json['authObject'],
      email: json['email'] as String,
      provider: $enumDecode(_$ProviderEnumMap, json['provider']),
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      isEmailVerifySkipped: json['isEmailVerifySkipped'] as bool? ?? false,
      required: json['required'],
    );

Map<String, dynamic> _$$_AuthInfoToJson(_$_AuthInfo instance) =>
    <String, dynamic>{
      'authObject': instance.authObject,
      'email': instance.email,
      'provider': _$ProviderEnumMap[instance.provider],
      'isEmailVerified': instance.isEmailVerified,
      'isEmailVerifySkipped': instance.isEmailVerifySkipped,
      'required': instance.required,
    };

const _$ProviderEnumMap = {
  Provider.kakao: 'kakao',
  Provider.naver: 'naver',
  Provider.google: 'google',
  Provider.apple: 'apple',
  Provider.email: 'email',
  Provider.none: 'none',
};
