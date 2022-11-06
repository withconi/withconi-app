import 'dart:html';
import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/module/ui_model/edit_post_ui_model.dart';
import '../../../../../global_widgets/photo_gallary/image_item.dart';
import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';
import '../abstract_request/request_info_abstract.dart';

class UpdateMyPostRequestDTO
    extends RequestConverter<UpdateMyPostRequestDTO, EditPostUIModel>
    implements RequestDTO {
  final String content;
  final PostType postType;
  final List<ImageItem> images;
  String postId;
  String boardId;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.POST_UPDATE_MY_POST;

  UpdateMyPostRequestDTO.fromData({required EditPostUIModel data})
      : postId = data.postId,
        boardId = data.boardId,
        content = data.content,
        images = data.images,
        postType = data.postType,
        super.fromData(data);

//Tuple의 순서는 postId, commentId, isLike 순임
  // @override
  // factory UpdateMyPostRequestDTO.fromData(EditPostUIModel data) {
  //   return UpdateMyPostRequestDTO._(
  //       postId: data.postId,
  //       boardId: data.boardId,
  //       content: data.content,
  //       images: data.images,
  //       postType: data.postType);
  // }

  @override
  Map<String, dynamic> get dataMap {
    List<String> imagesRefList = images.map((e) => e.resource).toList();
    return {
      "postId": postId,
      "boardId": boardId,
      "content": content,
      "images": imagesRefList,
      "postType": postType.code,
    };
  }
}
