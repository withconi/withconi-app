import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:withconi/data/model/dto/response_dto/place_response/lat_lng_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_abstract_dto/place_response_dto.dart';
import '../../../../enums/enum.dart';
part 'hospital_preview_response_dto.freezed.dart';
part 'hospital_preview_response_dto.g.dart';

@freezed
class HospitalPreviewResponseDTO
    with _$HospitalPreviewResponseDTO
    implements PlacePreviewResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory HospitalPreviewResponseDTO({
    required String locId,
    required String address,
    required bool visitVerified,
    required bool isBookmarked,
    required LatLngResponseDTO coordinate,
    required String phone,
    required String name,
    required OpeningStatus openingStatus,
    required String thumbnail,
    required PlaceType placeType,
    required DiseaseType mostVisitedDiseaseType,
    required int totalReviews,
  }) = _HospitalPreviewResponseDTO;

  factory HospitalPreviewResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$HospitalPreviewResponseDTOFromJson(json);
}
