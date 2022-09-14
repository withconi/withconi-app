import 'package:kakao_flutter_sdk/kakao_flutter_sdk_navi.dart';

import '../../ui/entities/location.dart';
import 'abstract_class/place_type.dart';

class PharmacyPreview implements PlacePreviewType {
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
  String unselectedMarkerImage = "assets/icons/pharmacy_unclicked.png";

  @override
  String selectedMarkerImage = "assets/icons/pharmacy_clicked.png";

  @override
  String name = "";

  @override
  LatLngClass location = LatLngClass(latitude: 0.0, longitude: 0.0);

  @override
  String openingStatus = "";

  @override
  String thumbnail = "";

  PharmacyPreview({
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

  PharmacyPreview.fromJson(Map<String, dynamic> json) {
    locId = json['_id'];
    name = json['title'];
    openingStatus = json['openingStatus'];
    address = json['address'];
    location = LatLngClass.fromJson(json['coordinate']);
    totalVisitingConimal = json['totalVisitingConimal'];
    totalRecommend = json['totalRecommend'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = locId;
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
