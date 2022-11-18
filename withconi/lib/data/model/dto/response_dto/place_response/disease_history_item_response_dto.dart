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
    required String diseaseName,
    required int diseasePercent,
  }) = _DiseaseHistoryResponseDTO;

  factory DiseaseHistoryItemResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DiseaseHistoryItemResponseDTOFromJson(json);
}
