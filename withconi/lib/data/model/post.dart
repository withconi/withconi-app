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
    required String authorId,
    required String nickname,
    required PostType postType,
    required String content,
    @ImageItemConverter() required List<ImageItem> images,
    @DateTimeConverter() required DateTime createdAt,
    @Default(false) bool isLike,
    @Default(12) int likeNum,
    @Default(3) int commentNum,
    // @ImageItemConverter() @Default([]) required List<ImageItem> images,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

class ImageItemConverter
    implements JsonConverter<List<ImageItem>, List<String>?> {
  const ImageItemConverter();

  @override
  List<ImageItem> fromJson(List<String>? imageRef) {
    // return imageRef
    //     .map((e) => ImageItem(
    //         id: e.codeUnits.toString(),
    //         resource: e,
    //         imageType: ImageType.network))
    //     .toList();

    return [
      ImageItem(
          id: 'tag3',
          resource:
              'https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20210917_199%2F1631861436249TX26u_JPEG%2F32997264078967613_1334183573.jpg&type=sc960_832',
          imageType: ImageType.network),
    ];
  }

  @override
  List<String>? toJson(List<ImageItem> imageItem) {
    return imageItem.map((e) => e.resource).toList();
  }
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
