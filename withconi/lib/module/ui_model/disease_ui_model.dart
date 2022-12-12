import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import '../../data/enums/enum.dart';
import '../../data/model/dto/joined_dto/symptom.dart';
import '../../data/model/dto/response_dto/disease_response/disease_response_dto.dart';
part 'disease_ui_model.freezed.dart';

@freezed
class DiseaseUIModel extends Equatable with _$DiseaseUIModel {
  const DiseaseUIModel._();

  factory DiseaseUIModel({
    required String diseaseCode,
    required String diseaseId,
    required String name,
    required String definition,
    required String diagnosisTechnique,
    required String treatment,
    required String advice,
    required List<SymptomGroup> symptomGroup,
    required DiseaseType diseaseType,
    required String boardId,
  }) = _DiseaseUIModel;

  factory DiseaseUIModel.fromDTO(DiseaseResponseDTO responseDTO) {
    return DiseaseUIModel(
        diseaseId: responseDTO.diseaseId,
        boardId: responseDTO.boardId.toString(),
        advice: responseDTO.advice,
        diseaseCode: responseDTO.code,
        definition: responseDTO.definition,
        diagnosisTechnique: responseDTO.diagnosisTechnique,
        diseaseType: responseDTO.diseaseType,
        name: responseDTO.name,
        symptomGroup: responseDTO.symptomGroupList,
        treatment: responseDTO.treatment);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [diseaseId, diseaseCode];
}

// class DiseaseUIModel extends Equatable implements UIModel {
//   final String code;
//   final String name;
//   final String definition;
//   final String diagnosisTechnique;
//   final String treatment;
//   final String advice;
//   final List<SymptomGroup> symptomGroup;
//   final DiseaseType diseaseType;

//   DiseaseUIModel(
//       {required this.advice,
//       required this.code,
//       required this.definition,
//       required this.diagnosisTechnique,
//       required this.diseaseType,
//       required this.name,
//       required this.symptomGroup,
//       required this.treatment});

//   factory DiseaseUIModel.fromDTO(DiseaseResponseDTO responseDTO) {
//     return DiseaseUIModel(
//         advice: responseDTO.advice,
//         code: responseDTO.code,
//         definition: responseDTO.definition,
//         diagnosisTechnique: responseDTO.diagnosisTechnique,
//         diseaseType: responseDTO.diseaseType,
//         name: responseDTO.name,
//         symptomGroup: responseDTO.symptomGroupList,
//         treatment: responseDTO.treatment);
//   }

//   @override
//   List<Object?> get props => [code, name, diseaseType];
// }
