import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/enum.dart';
part 'diagnosis_result_response_dto.freezed.dart';
part 'diagnosis_result_response_dto.g.dart';

@freezed
class DiagnosisResultResponseDTO with _$DiagnosisResultResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory DiagnosisResultResponseDTO({
    @JsonKey(name: '_id') @Default('') String diseaseId,
    @JsonKey(name: 'name') required String diseaseName,
    @JsonKey(name: 'status') required DiseasePosibility posibility,
  }) = _DiagnosisResultResponseDTO;

  factory DiagnosisResultResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DiagnosisResultResponseDTOFromJson(json);
}
