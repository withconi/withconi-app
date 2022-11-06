import 'package:withconi/global_widgets/photo_gallary/image_item.dart';

import '../../core/tools/helpers/calculator.dart';
import '../../data/enums/enum.dart';
import '../../data/model/dto/response_dto/post_response_dto.dart';

class PostUIModel {
  final String nickname;
  final DateTime uploadAt;
  final String content;
  final PostType postType;
  final List<ImageItem> images;
  int likeNum;
  int commentNum;
  bool isLikeOn;
  String postId;
  String authorId;
  String boardId;

  String get uploadAtStr => TimeCalculator().calculateUploadAt(uploadAt);

  PostUIModel(
      {required this.nickname,
      required this.uploadAt,
      required this.content,
      required this.likeNum,
      required this.commentNum,
      required this.isLikeOn,
      required this.postType,
      required this.images,
      required this.postId,
      required this.authorId,
      required this.boardId});

  factory PostUIModel.fromDTO(Post postDTO) {
    return PostUIModel(
        nickname: postDTO.nickname,
        uploadAt: postDTO.createdAt,
        content: postDTO.content,
        likeNum: postDTO.likeNum,
        commentNum: postDTO.commentNum,
        isLikeOn: postDTO.isLike,
        postType: postDTO.postType,
        images: postDTO.images,
        postId: postDTO.postId!,
        authorId: postDTO.authorId,
        boardId: postDTO.boardId);
  }
}
