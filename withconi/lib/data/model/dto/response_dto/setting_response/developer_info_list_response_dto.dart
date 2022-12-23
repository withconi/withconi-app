import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/setting_response/developer_info_response_dto.dart';

import '../abstract_dto/response_dto.dart';
part 'developer_info_list_response_dto.freezed.dart';
part 'developer_info_list_response_dto.g.dart';

@freezed
class DeveloperInfoListResponseDTO
    with _$DeveloperInfoListResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory DeveloperInfoListResponseDTO({
    required DeveloperInfoResponseDTO frontend,
    required DeveloperInfoResponseDTO backend,
  }) = _DeveloperInfoListResponseDTO;

  factory DeveloperInfoListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DeveloperInfoListResponseDTOFromJson(json);
}
