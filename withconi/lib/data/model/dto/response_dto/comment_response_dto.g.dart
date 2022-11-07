// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentResponseDTO _$$_CommentResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_CommentResponseDTO(
      postId: json['postId'] as String,
      boardId: json['boardId'] as String,
      commentId: json['commentId'] as String?,
      authorId: json['authorId'] as String,
      nickname: json['nickname'] as String,
      content: json['content'] as String,
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
      isLike: json['isLike'] as bool,
      likeNum: json['likeNum'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CommentResponseDTOToJson(
        _$_CommentResponseDTO instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'boardId': instance.boardId,
      'commentId': instance.commentId,
      'authorId': instance.authorId,
      'nickname': instance.nickname,
      'content': instance.content,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'isLike': instance.isLike,
      'likeNum': instance.likeNum,
    };
