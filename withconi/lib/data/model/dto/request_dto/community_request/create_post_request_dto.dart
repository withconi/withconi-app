import 'dart:html';

import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/api_dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../../../../global_widgets/photo_gallary/image_item.dart';
import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';

class CreatePostRequestDTO
    extends RequestConverter<CreatePostRequestDTO, PostUIModel>
    implements RequestDTO {
  final String nickname;
  String content;
  final String authorId;
  final String boardId;
  final List<ImageItem> images;
  final PostType postType;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.POST_CREATE;

  CreatePostRequestDTO.fromData(PostUIModel postUiModel)
      : nickname = postUiModel.nickname,
        content = postUiModel.content,
        authorId = postUiModel.authorId,
        boardId = postUiModel.boardId,
        images = postUiModel.images,
        postType = postUiModel.postType,
        super.fromData(postUiModel);

  @override
  Map<String, dynamic> get dataMap {
    List<String> imageRefList = images.map((e) => e.resource).toList();
    return {
      'nickname': nickname,
      'content': content,
      'authorId': authorId,
      'postType': postType.code,
      'boardId': boardId,
      'images': imageRefList,
    };
  }
}
