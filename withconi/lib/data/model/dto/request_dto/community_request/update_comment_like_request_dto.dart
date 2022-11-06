import 'dart:html';
import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../abstract_request/request_dto_abstract.dart';

class UpdateCommentLikeRequestDTO extends RequestConverter<
    UpdateCommentLikeRequestDTO,
    Tuple3<String, String, bool>> implements RequestDTO {
  String postId;
  String commentId;
  bool isLike;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.COMMENT_LIKE_UPDATE;

  UpdateCommentLikeRequestDTO.fromData(
      {required this.postId, required this.commentId, required this.isLike})
      : super.fromData(Tuple3(postId, commentId, isLike));

//Tuple의 순서는 postId, commentId, isLike 순임
  // @override
  // factory UpdateCommentLikeRequestDTO.fromData(
  //     Tuple3<String, String, bool> data) {
  //   return UpdateCommentLikeRequestDTO._(
  //     postId: data.value1,
  //     commentId: data.value2,
  //     isLike: data.value3,
  //   );
  // }

  @override
  Map<String, dynamic> get dataMap => {"postId": postId, "isLike": isLike};
}
