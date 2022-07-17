// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      postId: json['postId'] as String,
      commentId: json['commentId'] as String,
      authorId: json['authorId'] as String? ?? '',
      nickname: json['nickname'] as String,
      content: json['content'] as String,
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'commentId': instance.commentId,
      'authorId': instance.authorId,
      'nickname': instance.nickname,
      'content': instance.content,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };
