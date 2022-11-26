import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import 'package:withconi/module/ui_model/new_post_ui_model.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../../../../global_widgets/photo_gallary/image_item.dart';
import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';

class CreatePostRequestDTO
    extends RequestConverter<CreatePostRequestDTO, NewPostUIModel>
    implements RequestDTO {
  String content;
  // final String authorId;
  final String boardId;
  final List<String> _imageRefList;
  final PostType postType;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.POST_CREATE;

  CreatePostRequestDTO.fromData(
      NewPostUIModel postUiModel, String _boardId, List<String> imageRefList)
      : content = postUiModel.content,
        // authorId = postUiModel.authorId,
        boardId = _boardId,
        _imageRefList = imageRefList,
        postType = postUiModel.postType!,
        super.fromData(postUiModel);

  @override
  Map<String, dynamic> get dataMap {
    return {
      'content': content,
      // 'authorId': authorId,
      'postType': postType.code,
      'boardId': boardId,
      // 'postImageRef': _imageRefList,
    };
  }
}
