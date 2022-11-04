import 'dart:html';
import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import '../abstract_request/request_dto_abstract.dart';
import '../abstract_request/request_info_abstract.dart';

typedef BoardId = String;
typedef PostId = String;

class GetPostDetailRequestDTO
    extends RequestDTO<GetPostDetailRequestDTO, Tuple2<BoardId, PostId>>
    implements RequestInfo {
  BoardId boardId;
  PostId postId;

  @override
  bool requiresToken = true;

  @override
  RequestType requestType = RequestType.GET;

  @override
  String url = HttpUrl.COMMUNITY_GET_POST;

  @override
  FormData? formData;

  GetPostDetailRequestDTO.fromData(
      {required this.boardId, required this.postId})
      : super.fromData(Tuple2(boardId, postId));

  @override
  Map<String, dynamic> get dataMap => {
        'boardId': boardId,
        'postId': postId,
      };
}
