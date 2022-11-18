import 'dart:ffi';
import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../abstract_request/request_dto_abstract.dart';

class DeleteCommentRequestDTO
    extends RequestConverter<DeleteCommentRequestDTO, Null>
    implements RequestDTO {
  final String _boardId;
  final String _postId;
  final String _commentId;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.DELETE;

  @override
  String get url => HttpUrl.COMMUNITY_DELETE_COMMENT;

  DeleteCommentRequestDTO.fromData(
      {required String boardId,
      required String postId,
      required String commentId})
      : _boardId = boardId,
        _postId = postId,
        _commentId = commentId,
        super.fromData(null);

  @override
  Map<String, dynamic> get dataMap => {
        "boardId": _boardId,
        "postId": _postId,
        "lineReplyId": _commentId,
      };
}
