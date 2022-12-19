import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../enums/enum.dart';
import '../abstract_dto/response_dto.dart';
part 'symptom_response_dto.freezed.dart';
part 'symptom_response_dto.g.dart';

@freezed
class SymptomResponseDTO with _$SymptomResponseDTO implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory SymptomResponseDTO({
    required Symptom categoryName,
    @JsonKey(name: 'list') required List<String> symptomList,
  }) = _SymptomResponseDTO;

  factory SymptomResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SymptomResponseDTOFromJson(json);
}
