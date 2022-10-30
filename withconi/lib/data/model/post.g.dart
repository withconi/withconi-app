// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      boardId: json['boardId'] as String,
      postId: json['postId'] as String? ?? '',
      authorId: json['authorId'] as String,
      nickname: json['nickname'] as String,
      postType: $enumDecode(_$PostTypeEnumMap, json['postType']),
      content: json['content'] as String,
      images:
          const ImageItemConverter().fromJson(json['images'] as List<String>?),
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
      isLike: json['isLike'] as bool? ?? false,
      likeNum: json['likeNum'] as int? ?? 12,
      commentNum: json['commentNum'] as int? ?? 3,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'boardId': instance.boardId,
      'postId': instance.postId,
      'authorId': instance.authorId,
      'nickname': instance.nickname,
      'postType': _$PostTypeEnumMap[instance.postType]!,
      'content': instance.content,
      'images': const ImageItemConverter().toJson(instance.images),
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'isLike': instance.isLike,
      'likeNum': instance.likeNum,
      'commentNum': instance.commentNum,
    };

const _$PostTypeEnumMap = {
  PostType.cat: 'cat',
  PostType.dog: 'dog',
  PostType.all: 'all',
  PostType.undefined: 'undefined',
};
