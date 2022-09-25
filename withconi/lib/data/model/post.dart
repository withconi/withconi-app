import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/data/model/conimal.dart';

import '../../ui/widgets/photo_gallary/image_item.dart';
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
    required PostType postType,
    required String content,
    @DateTimeConverter() required DateTime createdAt,
    @Default(false) bool? isLiked,
    // @ImageItemConverter() @Default([]) required List<ImageItem> images,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

// class ImageItemConverter implements JsonConverter<DateTime, int> {
//   const ImageItemConverter();

//   @override
//   DateTime fromJson(int milliseconds) {
//     return DateTime.fromMillisecondsSinceEpoch(milliseconds);
//   }

//   @override
//   int toJson(DateTime date) => date.millisecondsSinceEpoch;
// }
