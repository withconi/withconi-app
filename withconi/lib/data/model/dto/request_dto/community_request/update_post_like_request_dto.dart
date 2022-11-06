import 'dart:html';
import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/core/tools/helpers/infinite_scroll.dart';
import '../abstract_request/request_dto_abstract.dart';
import '../abstract_request/request_info_abstract.dart';

class UpdatePostLikeRequestDTO
    extends RequestConverter<UpdatePostLikeRequestDTO, Tuple2<String, bool>>
    implements RequestDTO {
  String postId;
  bool isLike;
  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.COMMUNITY_UPDATE_POST_LIKE;

  UpdatePostLikeRequestDTO.fromData(
      {required this.postId, required this.isLike})
      : super.fromData(Tuple2(postId, isLike));

  // @override
  // factory UpdatePostLikeRequestDTO.fromData(Tuple2<String, bool> data) {
  //   return UpdatePostLikeRequestDTO._(
  //     postId: data.value1,
  //     isLike: data.value2,
  //   );
  // }

  @override
  Map<String, dynamic> get dataMap => {"postId": postId, "isLike": isLike};
}
