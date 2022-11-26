import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../core/tools/helpers/calculator.dart';
import '../../data/enums/enum.dart';
import '../../data/model/dto/response_dto/conimal_response/conimal_response_dto.dart';
part 'conimal_ui_model.freezed.dart';

@unfreezed
class ConimalUIModel with _$ConimalUIModel {
  const ConimalUIModel._();

  factory ConimalUIModel({
    Gender? gender,
    Species? species,
    required String name,
    @Default(false) bool isNeutralized,
    DateTime? birthDate,
    DateTime? adoptedDate,
    @Default('') String breed,
    @Default([]) List<DiseaseUIModel> diseases,
    @Default('') String conimalId,
  }) = _ConimalUIModel;

  int get daysAfterAdoption => daysBetween(adoptedDate!, DateTime.now());
  int get dasAfterBirth => daysBetween(birthDate!, DateTime.now());
  int get age => TimeCalculator().calculateAge(birthDate ?? DateTime.now());

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  factory ConimalUIModel.fromDTO(ConimalResponseDTO conimalDTO) {
    return ConimalUIModel(
        conimalId: conimalDTO.conimalId,
        gender: conimalDTO.gender,
        species: conimalDTO.species,
        name: conimalDTO.name,
        birthDate: conimalDTO.birthDate,
        adoptedDate: conimalDTO.adoptedDate,
        diseases:
            conimalDTO.diseases.map((e) => DiseaseUIModel.fromDTO(e)).toList(),
        breed: conimalDTO.breed,
        isNeutralized: conimalDTO.isNeutralized);
  }
}

// class ConimalUIModel extends Equatable implements UIModel {
//   Gender? gender;
//   Species? species;
//   String name = '';
//   bool isNeutralized;
//   DateTime? birthDate;
//   DateTime? adoptedDate;
//   String breed = '';
//   List<DiseaseUIModel> diseases = [];
//   String conimalId = '';

//   int get daysAfterAdoption => daysBetween(adoptedDate!, DateTime.now());
//   int get dasAfterBirth => daysBetween(birthDate!, DateTime.now());
//   int get age => TimeCalculator().calculateAge(birthDate ?? DateTime.now());

//   factory ConimalUIModel.fromDTO(ConimalResponseDTO conimalDTO) {
//     return ConimalUIModel(
//         gender: conimalDTO.gender,
//         species: conimalDTO.species,
//         name: conimalDTO.name,
//         birthDate: conimalDTO.birthDate,
//         adoptedDate: conimalDTO.adoptedDate,
//         diseases:
//             conimalDTO.diseases.map((e) => DiseaseUIModel.fromDTO(e)).toList(),
//         breed: '포메라리안',
//         isNeutralized: false);
//   }

//   ConimalUIModel({
//     this.name = '',
//     this.breed = '',
//     this.gender,
//     this.species,
//     this.birthDate,
//     this.adoptedDate,
//     this.isNeutralized = false,
//     this.conimalId = '',
//     required this.diseases,
//   });

//   int daysBetween(DateTime from, DateTime to) {
//     from = DateTime(from.year, from.month, from.day);
//     to = DateTime(to.year, to.month, to.day);
//     return (to.difference(from).inHours / 24).round();
//   }

//   @override
//   // TODO: implement props
//   List<Object?> get props => [
//         name,
//         conimalId,
//       ];
// }
