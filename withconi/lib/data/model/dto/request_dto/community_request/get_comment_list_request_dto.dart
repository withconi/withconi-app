import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../abstract_request/request_dto_abstract.dart';

typedef BoardId = String;
typedef PostId = String;

class GetCommentListRequestDTO
    extends RequestConverter<GetCommentListRequestDTO, Tuple2<BoardId, PostId>>
    implements RequestDTO {
  BoardId boardId;
  PostId postId;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.COMMUNITY_COMMENT_LIST;

  GetCommentListRequestDTO.fromData(
      {required this.boardId, required this.postId})
      : super.fromData(Tuple2(boardId, postId));

  @override
  Map<String, dynamic> get dataMap => {
        'boardId': boardId,
        'postId': postId,
      };
}
