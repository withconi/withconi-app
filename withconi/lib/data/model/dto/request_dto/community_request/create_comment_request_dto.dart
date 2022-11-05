import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/api_dto/api_call_dto.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'dart:html';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_dto_abstract.dart';
import 'package:withconi/module/ui_model/comment_ui_model.dart';

import '../../../../../module/ui_model/ui_model_impl/ui_model_impl.dart';
import '../abstract_request/request_info_abstract.dart';

class CreateCommentRequestDTO
    extends RequestConverter<CreateCommentRequestDTO, CommentUIModel>
    implements RequestDTO {
  String authorId;
  String boardId;
  String postId;
  String content;

  CreateCommentRequestDTO.fromData({required CommentUIModel data})
      : content = data.content,
        authorId = data.authorId,
        boardId = data.boardId,
        postId = data.postId,
        super.fromData(data);

  @override
  FormData? formData;

  @override
  RequestType requestType = RequestType.POST;

  @override
  bool requiresToken = true;

  @override
  String url = HttpUrl.COMMENT_CREATE;

  @override
  Map<String, dynamic> get dataMap => {
        "userId": authorId,
        "boardId": boardId,
        "postId": postId,
        "content": content
      };
}
