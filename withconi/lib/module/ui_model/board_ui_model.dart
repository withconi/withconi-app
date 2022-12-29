import 'package:equatable/equatable.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import '../../data/enums/enum.dart';
import '../../data/model/dto/response_dto/community_response/board_response_dto.dart';

class BoardUIModel extends Equatable {
  final String boardId;
  final String title;
  final DiseaseType diseaseType;

  factory BoardUIModel.fromDto(BoardResponseDTO _dto) {
    String boardTitle = '';

    if (_dto.name.contains('질환')) {
      boardTitle = '${_dto.name} ';
    } else {
      boardTitle = _dto.name;
    }
    return BoardUIModel(
        boardId: _dto.id, title: boardTitle, diseaseType: _dto.diseaseType);
  }

  const BoardUIModel(
      {required this.boardId, required this.title, required this.diseaseType});

  @override
  List<Object?> get props => [boardId, diseaseType];
}
