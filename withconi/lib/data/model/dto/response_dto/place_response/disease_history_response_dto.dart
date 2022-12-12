import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../enums/enum.dart';
import '../abstract_dto/response_dto.dart';
import 'disease_history_item_response_dto.dart';
part 'disease_history_response_dto.freezed.dart';
part 'disease_history_response_dto.g.dart';

@freezed
class DiseaseHistoryResponseDTO
    with _$DiseaseHistoryResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory DiseaseHistoryResponseDTO({
    @Default(DiseaseType.undefined) DiseaseType diseaseType,
    @Default(0) int totalDiseaseType,
    @Default([]) List<DiseaseHistoryItemResponseDTO> diseaseTypeItemList,
  }) = _DiseaseHistoryResponseDTO;

  factory DiseaseHistoryResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DiseaseHistoryResponseDTOFromJson(json);
}
