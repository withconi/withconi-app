import 'package:withconi/data/model/dto/response_dto/board_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/response_dto_impl.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../core/tools/helpers/calculator.dart';
import '../../data/enums/enum.dart';
import '../../data/model/dto/response_dto/post_response_dto.dart';

class BoardUIModel extends UIModel<BoardUIModel, BoardResponseDTO> {
  final int boardId;
  final String title;

  BoardUIModel.fromDto(BoardResponseDTO _dto)
      : boardId = _dto.boardId,
        title = _dto.title,
        super.fromDto(_dto);
}
