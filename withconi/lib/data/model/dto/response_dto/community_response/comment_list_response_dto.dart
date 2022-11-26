import 'package:freezed_annotation/freezed_annotation.dart';

import '../abstract_dto/response_dto.dart';

import 'comment_response_dto.dart';
part 'comment_list_response_dto.freezed.dart';
part 'comment_list_response_dto.g.dart';

@freezed
class CommentListResponseDTO
    with _$CommentListResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory CommentListResponseDTO({
    required List<CommentResponseDTO> list,
    required int totalDocuments,
  }) = _CommentListResponseDTO;

  factory CommentListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentListResponseDTOFromJson(json);
}
