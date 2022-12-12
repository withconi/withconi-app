import 'package:freezed_annotation/freezed_annotation.dart';
import '../abstract_dto/response_dto.dart';
part 'disease_history_item_response_dto.freezed.dart';
part 'disease_history_item_response_dto.g.dart';

@freezed
class DiseaseHistoryItemResponseDTO
    with _$DiseaseHistoryItemResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory DiseaseHistoryItemResponseDTO({
    @Default('구체적인 질병 없음') String diseaseName,
    @Default(0) int diseasePercent,
  }) = _DiseaseHistoryResponseDTO;

  factory DiseaseHistoryItemResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DiseaseHistoryItemResponseDTOFromJson(json);
}
