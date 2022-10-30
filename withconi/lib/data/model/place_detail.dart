import 'package:kakao_flutter_sdk/kakao_flutter_sdk_navi.dart';
import 'package:withconi/data/model/disease_history.dart';
import 'package:withconi/module/ui_model/disease_history_group.dart';
import 'package:withconi/data/enums/enum.dart';

import '../../module/ui_model/location.dart';

class PlaceDetail {
  String locId = '';

  String address = '';

  late DiseaseHistoryGroup diseaseHistoryGroup;

  LatLngClass location = LatLngClass(latitude: 0.0, longitude: 0.0);

  PlaceType placeType = PlaceType.hospital;

  String thumbnail = '';

  String name = '';

  int totalRecommend = 0;

  int totalReviews = 0;

  int totalVisiting = 0;

  int totalVisitingCats = 0;

  int totalVisitingDogs = 0;

  String phone = '';
  bool isBookmarked = false;

  PlaceDetail({
    required this.locId,
    required this.name,
    required this.address,
    required this.location,
    required this.placeType,
    required this.diseaseHistoryGroup,
    required this.thumbnail,
    required this.totalRecommend,
    required this.totalReviews,
    required this.totalVisiting,
    required this.totalVisitingDogs,
    required this.totalVisitingCats,
    required this.phone,
    required this.isBookmarked,
  });

  PlaceDetail.fromJson(Map<String, dynamic> json) {
    locId = json['_id'] ?? '';
    name = json['name'] ?? '다움동물병원';
    address = json['address'] ?? '';
    location = LatLngClass.fromJson(json['coordinate']);
    totalRecommend = json['totalRecommend'] ?? 0;
    thumbnail = json['thumbnail'] ?? '';
    totalReviews = json['totalReviews'] ?? 0;
    totalVisiting = json['totalVisiting'] ?? 0;
    totalVisitingDogs = json['totalVisitingDogs'] ?? 0;
    totalVisitingCats = json['totalVisitingCats'] ?? 0;
    diseaseHistoryGroup = DiseaseHistoryGroup.fromJson(json);
    placeType = PlaceType.hospital;
    phone = json['phone'] ?? '';
    isBookmarked = json['isBookmarked'] ?? false;
  }
}
