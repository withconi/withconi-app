import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/diagnosis_result_response_dto.dart';

import '../enums/enum.dart';
part 'diagnosis_result_list_response_dto.freezed.dart';
part 'diagnosis_result_list_response_dto.g.dart';

@freezed
class DiagnosisResultListResponseDTO with _$DiagnosisResultListResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory DiagnosisResultListResponseDTO({
    required List<DiagnosisResultResponseDTO> list,
    required int totalDocuments,
  }) = _DiagnosisResultListResponseDTO;

  factory DiagnosisResultListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DiagnosisResultListResponseDTOFromJson(json);
}
