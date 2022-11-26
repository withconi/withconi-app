import 'package:equatable/equatable.dart';
import 'package:withconi/data/model/dto/response_dto/community_response/comment_response_dto.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../core/tools/helpers/calculator.dart';

class CommentUIModel extends Equatable implements UIModel {
  final String nickname;
  final DateTime _uploadAt;
  String content;
  int likeNum;
  bool isLikeOn;

  String get uploadAtStr => TimeCalculator().calculateUploadAt(_uploadAt);

  final String authorId;
  final String commentId;
  final String boardId;
  final String postId;

  CommentUIModel(
    this._uploadAt, {
    required this.nickname,
    required this.content,
    required this.likeNum,
    required this.isLikeOn,
    required this.authorId,
    required this.boardId,
    required this.commentId,
    required this.postId,
  });

  factory CommentUIModel.fromDTO(CommentResponseDTO responseDTO) {
    return CommentUIModel(responseDTO.createdAt,
        nickname: responseDTO.nickname,
        content: responseDTO.content,
        likeNum: responseDTO.likeNum,
        isLikeOn: responseDTO.isLike,
        authorId: (responseDTO.userId.isEmpty)
            ? responseDTO.authorId
            : responseDTO.userId,
        boardId: responseDTO.boardId,
        commentId: responseDTO.commentId,
        postId: responseDTO.postId);
  }

  @override
  List<Object?> get props => [commentId, authorId, postId, boardId];
}
