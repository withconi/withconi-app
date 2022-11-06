import 'package:withconi/data/model/dto/response_dto/response_dto_impl.dart';
import 'package:withconi/data/model/dto/response_dto/response_model.dart';

abstract class UIModel<UiModelType, DtoType> {
  UIModel.fromDto(DtoType _dto);
}
