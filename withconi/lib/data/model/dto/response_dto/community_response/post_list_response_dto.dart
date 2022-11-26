import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/community_response/post_response_dto.dart';

import '../abstract_dto/response_dto.dart';

part 'post_list_response_dto.freezed.dart';
part 'post_list_response_dto.g.dart';

@freezed
class PostListResponseDTO with _$PostListResponseDTO implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory PostListResponseDTO({
    required List<PostResponseDTO> list,
    required int totalDocuments,
  }) = _PostListResponseDTO;

  factory PostListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PostListResponseDTOFromJson(json);
}
