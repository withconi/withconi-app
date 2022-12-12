import 'package:withconi/data/model/dto/response_dto/community_response/breed_response_dto.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import '../../data/enums/enum.dart';
import '../../data/model/dto/response_dto/community_response/board_response_dto.dart';

class BreedUIModel extends UIModel<BreedUIModel, BreedResponseDTO> {
  final String category;
  final String name;
  final Species species;

  factory BreedUIModel(String category, String name, Species species) {
    return BreedUIModel(category, name, species);
  }

  BreedUIModel.fromDto(BreedResponseDTO _dto, Species _species)
      : category = _dto.category,
        name = _dto.name,
        species = _species,
        super.fromDto(_dto);
}
