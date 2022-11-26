import 'package:freezed_annotation/freezed_annotation.dart';

import '../abstract_dto/response_dto.dart';
import 'board_response_dto.dart';
part 'breed_response_dto.freezed.dart';
part 'breed_response_dto.g.dart';

@freezed
class BreedResponseDTO with _$BreedResponseDTO implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory BreedResponseDTO({
    required String category,
    required String name,
  }) = _BreedResponseDTO;

  factory BreedResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$BreedResponseDTOFromJson(json);
}
