import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_abstract_dto/place_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/post_response_dto.dart';

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
    required DiseaseType diseaseType,
    required int totalDiseaseType,
    required List<DiseaseHistoryItemResponseDTO> diseaseHistoryItems,
  }) = _DiseaseHistoryResponseDTO;

  factory DiseaseHistoryResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DiseaseHistoryResponseDTOFromJson(json);
}
