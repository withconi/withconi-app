import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_abstract_dto/place_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/post_response_dto.dart';

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
