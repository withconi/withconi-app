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
    @JsonKey(name: 'profileImageUrl') @Default('') String profileImageUrl,
    required String boardId,
    @JsonKey(name: '_id') required String postId,
    required String authorId,
    @Default('알수없음') String nickname,
    @Default(PostType.cat) PostType postType,
    @Default(DiseaseType.dentistry) DiseaseType diseaseType,
    required String content,
    @DateTimeConverter() required DateTime createdAt,
    @Default(false) bool isLike,
    @JsonKey(name: 'totalLike') @Default(0) int likeNum,
    @JsonKey(name: 'totalComment') @Default(0) int commentNum,
    @ImageItemConverter()
    @JsonKey(name: 'postImageUrls')
    @Default([])
        List<ImageItem> images,
  }) = _PostResponseDTO;

  factory PostResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PostResponseDTOFromJson(json);
}

class ImageItemConverter
    implements JsonConverter<List<ImageItem>, List<dynamic>> {
  const ImageItemConverter();

  @override
  List<ImageItem> fromJson(List<dynamic> imageUrl) {
    if (imageUrl.isEmpty) return [];

    return imageUrl
        .map((e) => ImageItem(
            id: e.codeUnits.toString(),
            imageUrl: e,
            imageType: ImageType.network))
        .toList();
  }

  @override
  List<dynamic> toJson(List<ImageItem> object) {
    return [];
  }
}
