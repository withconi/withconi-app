import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';

import '../../core/tools/helpers/calculator.dart';
import '../../data/model/comment.dart';

class CommentUIModel implements UIModel {
  final String nickname;
  final DateTime uploadAt;
  String content;
  int likeNum;
  bool isLikeOn;

  final String authorId;
  final String commentId;
  final String boardId;
  final String postId;

  CommentUIModel({
    required this.nickname,
    required this.uploadAt,
    required this.content,
    required this.likeNum,
    required this.isLikeOn,
    required this.authorId,
    required this.boardId,
    required this.commentId,
    required this.postId,
  });
}
