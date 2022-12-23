import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../enums/enum.dart';
import '../abstract_dto/response_dto.dart';
part 'developer_info_response_dto.freezed.dart';
part 'developer_info_response_dto.g.dart';

@freezed
class DeveloperInfoResponseDTO
    with _$DeveloperInfoResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory DeveloperInfoResponseDTO({
    @Default('') String buymeacoffee,
    @Default('') String github,
    @Default('') String mail,
  }) = _DeveloperInfoResponseDTO;

  factory DeveloperInfoResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DeveloperInfoResponseDTOFromJson(json);
}
