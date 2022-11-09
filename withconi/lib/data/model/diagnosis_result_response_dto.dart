import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enum.dart';
part 'diagnosis_result_response_dto.freezed.dart';
part 'diagnosis_result_response_dto.g.dart';

@freezed
class DiagnosisResultResponseDTO with _$DiagnosisResultResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory DiagnosisResultResponseDTO({
    required String diseaseId,
    required String diseaseName,
    required DiseasePosibility posibility,
  }) = _DiagnosisResultResponseDTO;

  factory DiagnosisResultResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DiagnosisResultResponseDTOFromJson(json);
}
