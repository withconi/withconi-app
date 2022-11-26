import 'package:withconi/global_widgets/photo_gallary/image_item.dart';

import '../../core/tools/helpers/calculator.dart';
import '../../data/enums/enum.dart';
import '../../data/model/dto/response_dto/community_response/post_response_dto.dart';

class EditPostUIModel {
  final String nickname;
  String content;
  PostType postType;
  List<ImageItem> images;
  String postId;
  String boardId;

  EditPostUIModel(
      {required this.nickname,
      required this.content,
      required this.postType,
      required this.images,
      required this.postId,
      required this.boardId});

  factory EditPostUIModel.fromDTO(PostResponseDTO postDTO) {
    return EditPostUIModel(
        nickname: postDTO.nickname,
        content: postDTO.content,
        postType: postDTO.postType,
        images: postDTO.images,
        postId: postDTO.postId!,
        boardId: postDTO.boardId);
  }
}
