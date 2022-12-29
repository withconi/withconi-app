import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/enums/enum.dart';

import '../../../json_converter/datetime_converter.dart';
import '../../joined_dto/symptom.dart';
import '../abstract_dto/response_dto.dart';
part 'disease_response_dto.freezed.dart';
part 'disease_response_dto.g.dart';

@freezed
class DiseaseResponseDTO with _$DiseaseResponseDTO implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory DiseaseResponseDTO({
    @DateTimeConverter() required DateTime createdAt,
    @JsonKey(name: '_id') required String diseaseId,
    @JsonKey(name: 'code') required String code,
    @JsonKey(name: 'boardId') @Default(0) int boardId,
    //TODO: 여기 수정 후에 바꾸어야 해요~~~~ speciesList
    @JsonKey(name: 'species')
    @Default([Species.cat, Species.dog])
        List<Species> speciesList,
    required String name,
    @Default('') String definition,
    @JsonKey(name: 'detailDiagnosis') @Default('') String diagnosisTechnique,
    @JsonKey(name: 'detailCure') @Default('') String treatment,
    @JsonKey(name: 'detailAdvice') @Default('') String advice,
    @JsonKey(name: 'detailSymptoms')
    @Default([])
        List<SymptomGroup> symptomGroupList,
    @Default(DiseaseType.undefined) DiseaseType diseaseType,
  }) = _DiseaseResponseDTO;

  factory DiseaseResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DiseaseResponseDTOFromJson(json);
}
