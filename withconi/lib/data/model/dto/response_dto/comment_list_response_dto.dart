import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_abstract_dto/place_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/post_response_dto.dart';
import 'abstract_dto/response_dto.dart';
import 'board_response_dto.dart';
import 'comment_response_dto.dart';
part 'comment_list_response_dto.freezed.dart';
part 'comment_list_response_dto.g.dart';

@freezed
class CommentListResponseDTO
    with _$CommentListResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory CommentListResponseDTO({
    required List<CommentResponseDTO> results,
    required int totalDocuments,
  }) = _CommentListResponseDTO;

  factory CommentListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentListResponseDTOFromJson(json);
}
