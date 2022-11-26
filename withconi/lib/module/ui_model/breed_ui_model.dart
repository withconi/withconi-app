import 'package:withconi/data/model/dto/response_dto/community_response/breed_response_dto.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import '../../data/enums/enum.dart';
import '../../data/model/dto/response_dto/community_response/board_response_dto.dart';

class BreedUIModel extends UIModel<BreedUIModel, BreedResponseDTO> {
  final String category;
  final String name;

  BreedUIModel.fromDto(BreedResponseDTO _dto)
      : category = _dto.category,
        name = _dto.name,
        super.fromDto(_dto);
}
