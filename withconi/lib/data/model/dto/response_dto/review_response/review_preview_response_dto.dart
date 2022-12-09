import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_preview_response_dto.dart';

import '../../../json_converter/datetime_converter.dart';
import '../abstract_dto/response_dto.dart';
part 'review_preview_response_dto.freezed.dart';
part 'review_preview_response_dto.g.dart';

@freezed
class ReviewPreviewResponseDTO
    with _$ReviewPreviewResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory ReviewPreviewResponseDTO({
    @DateTimeConverter() required DateTime createdAt,
    @Default([])
    @JsonKey(name: 'diseaseTypes')
        List<DiseaseType> diseaseTypeList,
    @JsonKey(name: 'name') @Default('장소 이름 없음') String placeName,
    @JsonKey(name: 'status') required ReviewRate reviewRate,
    @JsonKey(name: '_id') required String reviewId,
    @JsonKey(name: 'userId') required String userId,
    @JsonKey(name: 'locId') required String placeId,
    @JsonKey(name: 'locType') required PlaceType placeType,
    @JsonKey(name: 'address') required String placeAddress,
    @Default([]) List<String> reviewImageList,
    required List<ReviewItem> reviewItems,
    @Default('') String reviewDesc,
    // @Default(false) bool isPhotoReview,
  }) = _ReviewPreviewResponseDTO;

  factory ReviewPreviewResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewPreviewResponseDTOFromJson(json);
}
