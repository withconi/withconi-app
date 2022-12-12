import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:withconi/data/model/dto/response_dto/place_response/lat_lng_response_dto.dart';
import '../../../../enums/enum.dart';
import '../abstract_dto/response_dto.dart';
part 'place_preview_response_dto.freezed.dart';
part 'place_preview_response_dto.g.dart';

@freezed
class PlacePreviewResponseDTO
    with _$PlacePreviewResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  const factory PlacePreviewResponseDTO.pharmacy({
    @JsonKey(name: '_id') required String placeId,
    required String address,
    @JsonKey(name: 'isPhotoReview') @Default(false) bool isPhotoReview,
    required bool isBookmarked,
    required LatLngResponseDTO coordinate,
    required String phone,
    required String name,
    required OpeningStatus openingStatus,
    @Default('') String thumbnail,
    @JsonKey(name: 'locType') required PlaceType placeType,
    // @JsonKey(name: 'nono')
    @Default(DiseaseType.undefined) DiseaseType mostVisitedDiseaseType,
    required int totalReviews,
  }) = PharmacyPreviewResponseDTO;

  const factory PlacePreviewResponseDTO.hospital({
    @JsonKey(name: '_id') required String placeId,
    required String address,
    @JsonKey(name: 'isPhotoReview') @Default(false) bool isPhotoReview,
    required bool isBookmarked,
    required LatLngResponseDTO coordinate,
    required String phone,
    required String name,
    required OpeningStatus openingStatus,
    @Default('') String thumbnail,
    @JsonKey(name: 'locType') required PlaceType placeType,
    // @JsonKey(name: 'nono')
    @Default(DiseaseType.undefined) DiseaseType mostVisitedDiseaseType,
    required int totalReviews,
  }) = HospitalPreviewResponseDTO;

  factory PlacePreviewResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PlacePreviewResponseDTOFromJson(json);
}
