import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_preview_response_dto.dart';

import '../../../json_converter/datetime_converter.dart';
import '../../joined_dto/symptom.dart';
import '../abstract_dto/response_dto.dart';
import '../conimal_response/conimal_response_dto.dart';
import '../disease_response/disease_response_dto.dart';
part 'review_detail_response_dto.freezed.dart';
part 'review_detail_response_dto.g.dart';

@freezed
class ReviewDetailResponseDTO
    with _$ReviewDetailResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory ReviewDetailResponseDTO({
    @DateTimeConverter() required DateTime createdAt,
    required List<ConimalResponseDTO> conimals,
    @JsonKey(name: 'diseaseTypeList')
    @Default([])
        List<DiseaseType> diseaseTypeList,
    @JsonKey(name: 'diseaseList')
    @Default([])
        List<DiseaseResponseDTO> diseaseList,
    // required List<DiseaseResponseDTO> diseaseList,
    @JsonKey(name: 'name') @Default('장소 이름 없음') String placeName,
    @JsonKey(name: 'status') required ReviewRate reviewRate,
    @JsonKey(name: '_id') required String reviewId,
    @JsonKey(name: 'userId') required String userId,
    @JsonKey(name: 'placeThumbnail') @Default('') String placeThumbnail,
    @JsonKey(name: 'locId') required String placeId,
    @JsonKey(name: 'locType') required PlaceType placeType,
    @JsonKey(name: 'address') required String placeAddress,
    @JsonKey(name: 'reviewImageList') @Default([]) List<String> reviewImageList,
    required List<ReviewItem> reviewItems,
    @Default('') String reviewDesc,
    // @Default(false) bool isPhotoReview,
  }) = _ReviewDetailResponseDTO;

  factory ReviewDetailResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailResponseDTOFromJson(json);
}
