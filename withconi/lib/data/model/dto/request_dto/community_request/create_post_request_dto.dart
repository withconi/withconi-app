import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import 'package:withconi/module/ui_model/new_post_ui_model.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../../../../global_widgets/photo_gallary/image_item.dart';
import '../../../../../module/ui_model/conimal_ui_model.dart';
import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';

class CreatePostRequestDTO
    extends RequestConverter<CreatePostRequestDTO, NewPostUIModel>
    implements RequestDTO {
  final String _content;
  final String _title;
  final List<ConimalUIModel> _conimals;
  final String _boardId;
  final List<String> _imageRefList;
  final PostType _postType;
  final Species _species;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.POST_CREATE;

  CreatePostRequestDTO.fromData(
    NewPostUIModel postUiModel,
    String boardId,
    List<String> imageRefList,
  )   : _content = postUiModel.content,
        _species = postUiModel.species,
        _title = postUiModel.title,
        _conimals = postUiModel.conimals,
        _boardId = boardId,
        _imageRefList = imageRefList,
        _postType = postUiModel.postType!,
        super.fromData(postUiModel);

  @override
  Map<String, dynamic> get dataMap {
    return {
      'content': _content,
      'conimals': _conimals.toList(),
      'title': _title,
      'postType': _postType.code,
      'boardId': _boardId,
      'postImageRefs': _imageRefList,
      'species': _species.code,
    };
  }
}
