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
      provider: $enumDecode(_$ProviderEnumMap, json['provider']),
      photoURL: json['photoURL'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      verificationSkipped: json['verificationSkipped'] as bool? ?? false,
      conimals: (json['conimals'] as List<dynamic>)
          .map((e) => Conimal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WcUserToJson(_$_WcUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'nickname': instance.nickname,
      'provider': _$ProviderEnumMap[instance.provider]!,
      'photoURL': instance.photoURL,
      'isEmailVerified': instance.isEmailVerified,
      'verificationSkipped': instance.verificationSkipped,
      'conimals': instance.conimals.map((e) => e.toJson()).toList(),
    };

const _$ProviderEnumMap = {
  Provider.kakao: 'kakao',
  Provider.naver: 'naver',
  Provider.google: 'google',
  Provider.apple: 'apple',
  Provider.email: 'email',
  Provider.none: 'none',
};
