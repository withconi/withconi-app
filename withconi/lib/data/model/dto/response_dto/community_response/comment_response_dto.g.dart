// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentResponseDTO _$$_CommentResponseDTOFromJson(
        Map<String, dynamic> json) =>
    _$_CommentResponseDTO(
      profileImageUrl: json['profileImageUrl'] as String? ?? '',
      postId: json['postId'] as String,
      boardId: json['boardId'] as String,
      commentId: json['_id'] as String,
      authorId: json['authorId'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '사용자 없음',
      content: json['content'] as String,
      createdAt: const DateTimeConverter().fromJson(json['createdAt'] as int),
      isLike: json['isLike'] as bool? ?? false,
      likeNum: json['totalLike'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CommentResponseDTOToJson(
        _$_CommentResponseDTO instance) =>
    <String, dynamic>{
      'profileImageUrl': instance.profileImageUrl,
      'postId': instance.postId,
      'boardId': instance.boardId,
      '_id': instance.commentId,
      'authorId': instance.authorId,
      'userId': instance.userId,
      'nickname': instance.nickname,
      'content': instance.content,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'isLike': instance.isLike,
      'totalLike': instance.likeNum,
    };
