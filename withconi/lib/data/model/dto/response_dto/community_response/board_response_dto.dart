import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../json_converter/datetime_converter.dart';
import '../abstract_dto/response_dto.dart';

part 'board_response_dto.freezed.dart';
part 'board_response_dto.g.dart';

@freezed
class BoardResponseDTO with _$BoardResponseDTO implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory BoardResponseDTO({
    required String id,
    required String name,
  }) = _BoardResponseDTO;

  factory BoardResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$BoardResponseDTOFromJson(json);
}
