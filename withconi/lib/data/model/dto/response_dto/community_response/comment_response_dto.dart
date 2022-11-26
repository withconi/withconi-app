import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../json_converter/datetime_converter.dart';
import '../abstract_dto/response_dto.dart';

part 'comment_response_dto.freezed.dart';
part 'comment_response_dto.g.dart';

@freezed
class CommentResponseDTO with _$CommentResponseDTO implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory CommentResponseDTO({
    required String postId,
    required String boardId,
    @JsonKey(name: '_id') required String commentId,
    @Default('') String authorId,
    @Default('') String userId,
    @Default('닉네임 없음') String nickname,
    required String content,
    @DateTimeConverter() required DateTime createdAt,
    @Default(false) bool isLike,
    @JsonKey(name: 'totalLike') @Default(0) int likeNum,
  }) = _CommentResponseDTO;

  factory CommentResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseDTOFromJson(json);
}

//TODO 테스트를 위해 isLiked, likeNum,  default 값 넣어놓음
