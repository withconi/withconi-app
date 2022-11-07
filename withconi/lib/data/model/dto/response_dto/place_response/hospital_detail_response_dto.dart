import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/disease_history_group_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/lat_lng_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_abstract_dto/place_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/review_history_group_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/review_history_response_dto.dart';
import '../../../../enums/enum.dart';
import '../abstract_dto/response_dto.dart';
import 'disease_history_response_dto.dart';
part 'hospital_detail_response_dto.freezed.dart';
part 'hospital_detail_response_dto.g.dart';

@freezed
class HospitalDetailResponseDTO
    with _$HospitalDetailResponseDTO
    implements PlaceDetailResponseDTO {
  @JsonSerializable(explicitToJson: true)
  factory HospitalDetailResponseDTO({
    required String locId,
    required String address,
    required bool visitVerified,
    required bool isBookmarked,
    required DiseaseHistoryGroupResponseDTO diseaseHistoryGroup,
    required ReviewHistoryGroupResponseDTO reviewHistoryGroup,
    required LatLngResponseDTO coordinate,
    required String phone,
    required String name,
    required OpeningStatus openingStatus,
    required String thumbnail,
    required PlaceType placeType,
    required int totalVisitingCats,
    required int totalVisitingDogs,
  }) = _HospitalDetailResponseDTO;

  factory HospitalDetailResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$HospitalDetailResponseDTOFromJson(json);
}
