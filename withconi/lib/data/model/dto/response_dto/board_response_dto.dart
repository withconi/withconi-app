import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_abstract_dto/place_response_dto.dart';
import '../../json_converter/datetime_converter.dart';
import 'abstract_dto/response_dto.dart';
part 'board_response_dto.freezed.dart';
part 'board_response_dto.g.dart';

@freezed
class BoardResponseDTO with _$BoardResponseDTO implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory BoardResponseDTO({
    required int boardId,
    required String title,
    @DateTimeConverter() required DateTime createdAt,
  }) = _BoardResponseDTO;

  factory BoardResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$BoardResponseDTOFromJson(json);
}
