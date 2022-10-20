import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/data/model/conimal.dart';
part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  @JsonSerializable(explicitToJson: true)
  factory Comment({
    required String postId,
    required String boardId,
    required String? commentId,
    required String authorId,
    required String nickname,
    required String content,
    @DateTimeConverter() required DateTime createdAt,
    required bool isLike,
    @Default(0) int likeNum,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

//TODO 테스트를 위해 isLiked, likeNum,  default 값 넣어놓음