import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/disease_history_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_abstract_dto/place_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/post_response_dto.dart';

import '../abstract_dto/response_dto.dart';
import '../disease_response_dto.dart';

part 'disease_history_group_response_dto.freezed.dart';
part 'disease_history_group_response_dto.g.dart';

@freezed
class DiseaseHistoryGroupResponseDTO
    with _$DiseaseHistoryGroupResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory DiseaseHistoryGroupResponseDTO({
    required List<DiseaseHistoryResponseDTO> historyList,
    required int totalHistory,
  }) = _DiseaseHistoryGroupResponseDTO;

  factory DiseaseHistoryGroupResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DiseaseHistoryGroupResponseDTOFromJson(json);
}
