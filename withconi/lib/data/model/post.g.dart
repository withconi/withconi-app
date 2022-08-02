// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      boardId: json['boardId'] as String,
      postId: json['postId'] as String? ?? '',
      authorId: json['authorId'] as String? ?? '',
      nickname: json['nickname'] as String,
      postType: $enumDecode(_$PostTypeEnumMap, json['postType']),
      content: json['content'] as String,
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
      isLiked: json['isLiked'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'boardId': instance.boardId,
      'postId': instance.postId,
      'authorId': instance.authorId,
      'nickname': instance.nickname,
      'postType': _$PostTypeEnumMap[instance.postType],
      'content': instance.content,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'isLiked': instance.isLiked,
    };

const _$PostTypeEnumMap = {
  PostType.cat: 'cat',
  PostType.dog: 'dog',
  PostType.all: 'all',
};
