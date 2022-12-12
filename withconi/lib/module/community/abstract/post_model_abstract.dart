import '../../ui_model/comment_ui_model.dart';
import '../../ui_model/post_ui_model.dart';

abstract class AbstractPostUpdate {
  void updateEditedPost(PostUIModel updatedPost) {}
  void updateCommentNum(String postId, int commentNum) {}
  void updatePostLike(String postId, int likeNum, bool isLikeOn) {}
  void updateBlockedPost(String postAuthorId) {}
  void updateDeletedPost(String postId) {}
  void updateReportedPost(String postId) {}
}
