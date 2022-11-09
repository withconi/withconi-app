import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/enums/enum.dart';

import '../../../../../global_widgets/photo_gallary/image_item.dart';
import '../../../json_converter/datetime_converter.dart';

part 'post_response_dto.freezed.dart';
part 'post_response_dto.g.dart';

@freezed
class PostResponseDTO with _$PostResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory PostResponseDTO({
    required String boardId,
    @Default('') String? postId,
    required String authorId,
    required String nickname,
    required PostType postType,
    required DiseaseType diseaseType,
    required String content,
    @ImageItemConverter() required List<ImageItem> images,
    @DateTimeConverter() required DateTime createdAt,
    @Default(false) bool isLike,
    @Default(12) int likeNum,
    @Default(3) int commentNum,
    // @ImageItemConverter() @Default([]) required List<ImageItem> images,
  }) = _PostResponseDTO;

  factory PostResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PostResponseDTOFromJson(json);
}

class ImageItemConverter implements JsonConverter<List<ImageItem>, Null> {
  const ImageItemConverter();

  @override
  List<ImageItem> fromJson(List<String>? imageRef) {
    if (imageRef != null && imageRef.isNotEmpty) {
      return imageRef
          .map((e) => ImageItem(
              id: e.codeUnits.toString(),
              resource: e,
              imageType: ImageType.network))
          .toList();
    }
    return [];
  }

  @override
  toJson(List<ImageItem> object) {
    return null;
  }
}
