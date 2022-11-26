import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/community_response/breed_response_dto.dart';

import '../../../../enums/enum.dart';
import '../abstract_dto/response_dto.dart';
import 'board_response_dto.dart';
part 'breed_list_response_dto.freezed.dart';
part 'breed_list_response_dto.g.dart';

@freezed
class BreedListResponseDTO with _$BreedListResponseDTO implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory BreedListResponseDTO({
    required List<BreedResponseDTO> list,
    required Species species,
  }) = _BreedListResponseDTO;

  factory BreedListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$BreedListResponseDTOFromJson(json);
}
