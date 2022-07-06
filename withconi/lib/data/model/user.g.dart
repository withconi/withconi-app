// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WcUser _$$_WcUserFromJson(Map<String, dynamic> json) => _$_WcUser(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      nickname: json['nickname'] as String,
      provider: $enumDecode(_$ProviderOptionsEnumMap, json['provider']),
      photoURL: json['photoURL'] as String?,
      conimals: (json['conimals'] as List<dynamic>)
          .map((e) => Conimal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WcUserToJson(_$_WcUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'nickname': instance.nickname,
      'provider': _$ProviderOptionsEnumMap[instance.provider],
      'photoURL': instance.photoURL,
      'conimals': instance.conimals.map((e) => e.toJson()).toList(),
    };

const _$ProviderOptionsEnumMap = {
  ProviderOptions.kakao: 'kakao',
  ProviderOptions.naver: 'naver',
  ProviderOptions.google: 'google',
  ProviderOptions.apple: 'apple',
  ProviderOptions.email: 'email',
  ProviderOptions.none: 'none',
};
