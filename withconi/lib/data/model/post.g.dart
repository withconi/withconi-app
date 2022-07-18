// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      boardId: json['boardId'] as String,
      postId: json['postId'] as String,
      authorId: json['authorId'] as String? ?? '',
      nickname: json['nickname'] as String,
      speciesType: $enumDecode(_$SpeciesEnumMap, json['speciesType']),
      content: json['content'] as String,
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'boardId': instance.boardId,
      'postId': instance.postId,
      'authorId': instance.authorId,
      'nickname': instance.nickname,
      'speciesType': _$SpeciesEnumMap[instance.speciesType],
      'content': instance.content,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };

const _$SpeciesEnumMap = {
  Species.cat: 'cat',
  Species.dog: 'dog',
  Species.all: 'all',
};
