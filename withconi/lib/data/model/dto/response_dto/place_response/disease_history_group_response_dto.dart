import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/disease_history_response_dto.dart';

import '../abstract_dto/response_dto.dart';

part 'disease_history_group_response_dto.freezed.dart';
part 'disease_history_group_response_dto.g.dart';

@freezed
class DiseaseHistoryListResponseDTO
    with _$DiseaseHistoryListResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory DiseaseHistoryListResponseDTO({
    required List<DiseaseHistoryResponseDTO> diseaseHistoryList,
    @JsonKey(name: 'totalDiseases') required int totalDiseaseHistoryCount,
  }) = _DiseaseHistoryListResponseDTO;

  factory DiseaseHistoryListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DiseaseHistoryListResponseDTOFromJson(json);
}
