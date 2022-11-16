import 'package:freezed_annotation/freezed_annotation.dart';

import '../abstract_dto/response_dto.dart';
import 'board_response_dto.dart';
part 'board_list_response_dto.freezed.dart';
part 'board_list_response_dto.g.dart';

@freezed
class BoardListResponseDTO with _$BoardListResponseDTO implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory BoardListResponseDTO({
    required List<BoardResponseDTO> list,
    required int totalDocuments,
  }) = _BoardListResponseDTO;

  factory BoardListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$BoardListResponseDTOFromJson(json);
}
