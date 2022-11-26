import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import '../../data/enums/enum.dart';
import '../../data/model/dto/response_dto/community_response/board_response_dto.dart';

class BoardUIModel extends UIModel<BoardUIModel, BoardResponseDTO> {
  final String boardId;
  final String title;
  final DiseaseType diseaseType;

  BoardUIModel.fromDto(BoardResponseDTO _dto)
      : boardId = _dto.id,
        title = (_dto.diseaseType == DiseaseType.undefined)
            ? _dto.name
            : _dto.diseaseType.displayName,
        diseaseType = _dto.diseaseType,
        super.fromDto(_dto);
}
