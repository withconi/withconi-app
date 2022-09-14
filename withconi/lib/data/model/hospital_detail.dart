import 'package:kakao_flutter_sdk/kakao_flutter_sdk_navi.dart';
import 'package:withconi/ui/entities/disease_percents.dart';
import 'package:withconi/configs/constants/enum.dart';

import '../../ui/entities/location.dart';
import 'abstract_class/place_type.dart';

class PlaceDetail {
  String locId = '';

  String address = '';

  late DiseasePercents diseasePercentInfo;

  LatLngClass location = LatLngClass(latitude: 0.0, longitude: 0.0);

  PlaceType placeType = PlaceType.hospital;

  String thumbnail = '';

  String name = '';

  int totalRecommend = 0;

  int totalReviews = 0;

  int totalVisiting = 0;

  int totalVisitingCats = 0;

  int totalVisitingDogs = 0;

  PlaceDetail(
      {required this.locId,
      required this.name,
      required this.address,
      required this.location,
      required this.placeType,
      required this.diseasePercentInfo,
      required this.thumbnail,
      required this.totalRecommend,
      required this.totalReviews,
      required this.totalVisiting,
      required this.totalVisitingDogs,
      required this.totalVisitingCats});

  PlaceDetail.fromJson(Map<String, dynamic> json) {
    locId = json['_id'] ?? '';
    name = json['title'] ?? '';
    address = json['address'] ?? '';
    location = LatLngClass.fromJson(json['coordinate']);
    totalRecommend = json['totalRecommend'] ?? 0;
    thumbnail = json['thumbnail'] ?? '';
    totalReviews = json['totalReviews'] ?? 0;
    totalVisiting = json['totalVisiting'] ?? 0;
    totalVisitingDogs = json['totalVisitingDogs'] ?? 0;
    totalVisitingCats = json['totalVisitingCats'] ?? 0;
    diseasePercentInfo = DiseasePercents.fromJson(json);
    placeType = PlaceType.hospital;
  }
}
