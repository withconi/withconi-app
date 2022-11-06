import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../core/tools/helpers/calculator.dart';
import '../../data/enums/enum.dart';

import '../../data/model/disease.dart';

class ConimalUIModel implements UIModel {
  Gender? gender;
  Species? species;
  String name = '';
  bool isNutralized;
  DateTime? birthDate;
  DateTime? adoptedDate;
  String breed = '';
  List<Disease> diseases = [];
  String conimalId = '';

  factory ConimalUIModel.fromDTO(Conimal conimalDTO) {
    return ConimalUIModel(
        gender: conimalDTO.gender,
        species: conimalDTO.species,
        name: conimalDTO.name,
        birthDate: conimalDTO.birthDate,
        adoptedDate: conimalDTO.adoptedDate,
        diseases: conimalDTO.diseases,
        breed: '포메라리안',
        isNutralized: false);
  }

  Conimal toDTO() {
    return Conimal(
        conimalId: '',
        name: name,
        species: species!,
        gender: gender!,
        birthDate: birthDate!,
        diseases: diseases,
        adoptedDate: adoptedDate!);
  }

  ConimalUIModel({
    this.name = '',
    this.breed = '',
    this.gender,
    this.species,
    this.birthDate,
    this.adoptedDate,
    this.isNutralized = false,
    this.conimalId = '',
    required this.diseases,
  });
}
