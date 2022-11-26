import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';

import '../../core/tools/helpers/calculator.dart';
import '../../data/enums/enum.dart';
import '../../data/model/dto/response_dto/community_response/post_response_dto.dart';
part 'post_ui_model.freezed.dart';

@unfreezed
class PostUIModel with _$PostUIModel {
  const PostUIModel._();

  factory PostUIModel({
    required final String postId,
    required DateTime uploadAt,
    required final String nickname,
    required String content,
    PostType? postType,
    required List<ImageItem> images,
    required int likeNum,
    required int commentNum,
    required bool isLikeOn,
    required final String authorId,
    required final String boardId,
    required final DateTime createdAt,
    required final DiseaseType diseaseType,
  }) = _PostUIModel;
  String get uploadAtStr => TimeCalculator().calculateUploadAt(uploadAt);

  factory PostUIModel.fromDTO(PostResponseDTO postDTO) {
    return PostUIModel(
        diseaseType: postDTO.diseaseType,
        uploadAt: postDTO.createdAt,
        nickname: postDTO.nickname,
        content: postDTO.content,
        likeNum: postDTO.likeNum,
        commentNum: postDTO.commentNum,
        isLikeOn: postDTO.isLike,
        postType: postDTO.postType,
        images: postDTO.images,
        //TODO: postId 에 id값 어떤거 사용해야 하는지 물어보기
        postId: postDTO.postId,
        authorId: postDTO.authorId,
        boardId: postDTO.boardId,
        createdAt: postDTO.createdAt);
  }
}

// cla
// class PostUIModel {
//   final String nickname;
//   DateTime _uploadAt;
//   String content;
//   PostType? postType;
//   List<ImageItem> images;
//   int likeNum;
//   int commentNum;
//   bool isLikeOn;
//   final String postId;
//   final String authorId;
//   final String boardId;

//   String get uploadAtStr => TimeCalculator().calculateUploadAt(_uploadAt);

//   PostUIModel(
//     this._uploadAt, {
//     required this.nickname,
//     required this.content,
//     required this.likeNum,
//     required this.commentNum,
//     required this.isLikeOn,
//     required this.postType,
//     required this.images,
//     required this.postId,
//     required this.authorId,
//     required this.boardId,
//     required DateTime createdAt,
//   });

//   factory PostUIModel.fromDTO(PostResponseDTO postDTO) {
//     return PostUIModel(postDTO.createdAt,
//         nickname: postDTO.nickname,
//         content: postDTO.content,
//         likeNum: postDTO.likeNum,
//         commentNum: postDTO.commentNum,
//         isLikeOn: postDTO.isLike,
//         postType: postDTO.postType,
//         images: postDTO.images,
//         postId: postDTO.postId!,
//         authorId: postDTO.authorId,
//         boardId: postDTO.boardId,
//         createdAt: postDTO.createdAt);
//   }
// }
