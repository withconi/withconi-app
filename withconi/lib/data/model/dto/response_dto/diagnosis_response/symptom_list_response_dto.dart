import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/joined_dto/symptom.dart';
import 'package:withconi/data/model/dto/response_dto/diagnosis_response/symptom_response_dto.dart';
import '../../../../enums/enum.dart';
import '../abstract_dto/response_dto.dart';
part 'symptom_list_response_dto.freezed.dart';
part 'symptom_list_response_dto.g.dart';

@freezed
class SymptomListResponseDTO
    with _$SymptomListResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory SymptomListResponseDTO({
    @JsonKey(name: 'list') required List<SymptomGroup> symptomGroupList,
    required int totalDocuments,
    @JsonKey(name: 'categoryList') required List<Symptom> symptomList,
  }) = _SymptomListResponseDTO;

  factory SymptomListResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SymptomListResponseDTOFromJson(json);
}
