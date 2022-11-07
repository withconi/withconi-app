import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_abstract_dto/place_response_dto.dart';
import 'abstract_dto/response_dto.dart';
import 'board_response_dto.dart';
part 'board_list_response_dto.freezed.dart';
part 'board_list_response_dto.g.dart';

@freezed
class BoardListResponseDTO with _$BoardListResponseDTO implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory BoardListResponseDTO({
    required List<BoardResponseDTO> results,
    required int totalDocuments,
  }) = _BoardListResponseDTO;

  factory BoardListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$BoardListResponseDTOFromJson(json);
}
