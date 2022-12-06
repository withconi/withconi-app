// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WcUser _$$_WcUserFromJson(Map<String, dynamic> json) => _$_WcUser(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      nickname: json['nickname'] as String,
      provider: $enumDecode(_$ProviderEnumMap, json['provider']),
      isEmailVerified: json['isEmailVerified'] as bool,
      verificationSkipped: json['verificationSkipped'] as bool,
      photoURL: json['profileImageUrl'] as String? ?? '',
      isWrittenReview: json['isWrittenReview'] as bool? ?? false,
      conimals: (json['conimals'] as List<dynamic>)
          .map((e) => ConimalResponseDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WcUserToJson(_$_WcUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'nickname': instance.nickname,
      'provider': _$ProviderEnumMap[instance.provider]!,
      'isEmailVerified': instance.isEmailVerified,
      'verificationSkipped': instance.verificationSkipped,
      'profileImageUrl': instance.photoURL,
      'isWrittenReview': instance.isWrittenReview,
      'conimals': instance.conimals.map((e) => e.toJson()).toList(),
    };

const _$ProviderEnumMap = {
  Provider.kakao: 'kakao',
  Provider.naver: 'naver',
  Provider.google: 'google',
  Provider.apple: 'apple',
  Provider.email: 'email',
  Provider.undefined: 'undefined',
};
