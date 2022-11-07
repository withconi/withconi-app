import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_abstract_dto/place_response_dto.dart';

import '../../json_converter/datetime_converter.dart';
import 'abstract_dto/response_dto.dart';

part 'comment_response_dto.freezed.dart';
part 'comment_response_dto.g.dart';

@freezed
class CommentResponseDTO with _$CommentResponseDTO implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory CommentResponseDTO({
    required String postId,
    required String boardId,
    required String? commentId,
    required String authorId,
    required String nickname,
    required String content,
    @DateTimeConverter() required DateTime createdAt,
    required bool isLike,
    @Default(0) int likeNum,
  }) = _CommentResponseDTO;

  factory CommentResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseDTOFromJson(json);
}

//TODO 테스트를 위해 isLiked, likeNum,  default 값 넣어놓음
