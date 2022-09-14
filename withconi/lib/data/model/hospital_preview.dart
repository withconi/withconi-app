import 'package:kakao_flutter_sdk/kakao_flutter_sdk_navi.dart';

import '../../ui/entities/location.dart';
import 'abstract_class/place_type.dart';

class HospitalPreview implements PlacePreviewType {
  @override
  String locId = "";

  @override
  String address = "";

  @override
  int totalVisitingConimal = 0;

  @override
  int totalRecommend = 0;

  @override
  String phoneNumber = "";

  @override
  String unselectedMarkerImage = "assets/icons/hospital_unclicked.png";

  @override
  String selectedMarkerImage = "assets/icons/hospital_clicked.png";

  @override
  String name = "";

  @override
  LatLngClass location = LatLngClass(latitude: 0.0, longitude: 0.0);

  @override
  String openingStatus = "";

  @override
  String thumbnail = "";

  HospitalPreview({
    required this.locId,
    required this.name,
    required this.location,
    required this.address,
    required this.totalVisitingConimal,
    required this.phoneNumber,
    required this.totalRecommend,
    required this.openingStatus,
    required this.thumbnail,
  });

  HospitalPreview.fromJson(Map<String, dynamic> json) {
    locId = json['_id'] ?? '';
    name = json['title'] ?? '';
    openingStatus = json['openingStatus'] ?? '';
    address = json['address'] ?? '';
    location = LatLngClass.fromJson(json['coordinate']);
    totalVisitingConimal = json['totalVisitingConimal'] ?? 0;
    totalRecommend = json['totalRecommend'] ?? 0;
    thumbnail = json['thumbnail'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locId'] = locId;
    data['title'] = name;
    data['openingStatus'] = openingStatus;
    data['address'] = address;
    data['coordinate'] = location.toJson();
    data['totalVisitingConimal'] = totalVisitingConimal;
    data['totalRecommend'] = totalRecommend;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
