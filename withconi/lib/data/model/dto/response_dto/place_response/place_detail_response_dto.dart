import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/disease_history_group_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/lat_lng_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/review_history_response_dto.dart';
import '../../../../enums/enum.dart';
import '../abstract_dto/response_dto.dart';
part 'place_detail_response_dto.freezed.dart';
part 'place_detail_response_dto.g.dart';

@freezed
class PlaceDetailResponseDTO
    with _$PlaceDetailResponseDTO
    implements ResponseDTO {
  @JsonSerializable(explicitToJson: true)
  const factory PlaceDetailResponseDTO.hospital({
    @JsonKey(name: '_id') required String placeId,
    required String address,
    @Default(false) bool isBookmarked,
    @JsonKey(name: 'diseaseHistory')
        required DiseaseHistoryListResponseDTO diseaseHistory,
    required ReviewHistoryResponseDTO reviewHistory,
    @JsonKey(name: 'coordinate') LatLngResponseDTO? coordinate,
    required String phone,
    required String name,
    required OpeningStatus openingStatus,
    @Default('') String thumbnail,
    @JsonKey(name: 'locType') required PlaceType placeType,
    required int totalVisitingCats,
    required int totalVisitingDogs,
  }) = HospitalPlaceDetailResponseDTO;

  const factory PlaceDetailResponseDTO.pharmacy({
    @JsonKey(name: '_id') required String placeId,
    required String address,
    @Default(false) bool isBookmarked,
    @JsonKey(name: 'diseaseHistory')
        required DiseaseHistoryListResponseDTO diseaseHistory,
    required ReviewHistoryResponseDTO reviewHistory,
    @JsonKey(name: 'coordinate') LatLngResponseDTO? coordinate,
    required String phone,
    required String name,
    required OpeningStatus openingStatus,
    @Default('') String thumbnail,
    @JsonKey(name: 'locType') required PlaceType placeType,
    required int totalVisitingCats,
    required int totalVisitingDogs,
  }) = PharmacyPlaceDetailResponseDTO;

  factory PlaceDetailResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailResponseDTOFromJson(json);
}

// Map<String, dynamic> data = {
//   "success": true,
//   "data": {
//     "_id": "637061e2e650188462062ed2",
//     "locType": "hospital",
//     "name": "일곡동물병원",
//     "address": "광주광역시 북구 일곡동 843-5번지",
//     "newAddress": "광주광역시 북구 양일로305번길 8 (일곡동)",
//     "zipCode": "61040",
//     "coordinate": [126.88283470039661, 35.211179303312065],
//     "phone": "571-9114",
//     "totalReviews": 0,
//     "totalVisitingDogs": 0,
//     "totalVisitingCats": 0,
//     "createdAt": 1668309474768,
//     "thumbnail": "",
//     "images": [],
//     "runtimeType": "hospital",
//     "openingStatus": "open",
//     "diseaseHistory": {
//       "_id": "637061e2e650188462062ed4",
//       "locId": "637061e2e650188462062ed2",
//       "locType": "hospital",
//       "totalDiseases": 0,
//       "diseaseHistoryList": [],
//       "createdAt": 1668309474768
//     },
//     "reviewHistory": {
//       "_id": "637061e2e650188462062ed3",
//       "locId": "637061e2e650188462062ed2",
//       "locType": "hospital",
//       "totalReviews": 0,
//       "reviewHistoryMap": {
//         "high": {
//           "totalReviews": 0,
//           "reviewHistoryMap": {
//             "explanation": 0,
//             "kindness": 0,
//             "adequateExamination": 0,
//             "effectiveness": 0,
//             "waitingExperience": 0
//           }
//         },
//         "middle": {
//           "totalReviews": 0,
//           "reviewHistoryMap": {
//             "explanation": 0,
//             "kindness": 0,
//             "adequateExamination": 0,
//             "effectiveness": 0,
//             "waitingExperience": 0
//           }
//         },
//         "low": {
//           "totalReviews": 0,
//           "reviewHistoryMap": {
//             "explanation": 0,
//             "kindness": 0,
//             "adequateExamination": 0,
//             "effectiveness": 0,
//             "waitingExperience": 0
//           }
//         }
//       },
//       "createdAt": 1668309474768
//     }
//   },
// };
