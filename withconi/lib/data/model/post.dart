import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/data/model/conimal.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  @JsonSerializable(explicitToJson: true)
  factory Post({
    required String boardId,
    @Default('') String? postId,
    @Default('') String? authorId,
    required String nickname,
    required PostType speciesType,
    required String content,
    @DateTimeConverter() required DateTime createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
