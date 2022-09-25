// import 'package:kakao_flutter_sdk/kakao_flutter_sdk_navi.dart';

// import '../../ui/entities/location.dart';
// import 'abstract_class/place_type.dart';

// class PharmacyPreview implements PlacePreviewType {
//   @override
//   String locId = "";

//   @override
//   String address = "";

//   @override
//   int totalVisitingConimal = 0;

//   @override
//   int totalRecommend = 0;

//   @override
//   String phoneNumber = "";

//   @override
//   String unselectedMarkerImage = "assets/icons/pharmacy_unclicked.png";

//   @override
//   String selectedMarkerImage = "assets/icons/pharmacy_clicked.png";

//   @override
//   String name = "";

//   @override
//   LatLngClass location = LatLngClass(latitude: 0.0, longitude: 0.0);

//   @override
//   String openingStatus = "";

//   @override
//   String thumbnail = "";

//   PharmacyPreview({
//     required this.locId,
//     required this.name,
//     required this.location,
//     required this.address,
//     required this.totalVisitingConimal,
//     required this.phoneNumber,
//     required this.totalRecommend,
//     required this.openingStatus,
//     required this.thumbnail,
//   });

//   PharmacyPreview.fromJson(Map<String, dynamic> json) {
//     locId = json['_id'];
//     name = json['title'];
//     openingStatus = json['openingStatus'];
//     address = json['address'];
//     location = LatLngClass.fromJson(json['coordinate']);
//     totalVisitingConimal = json['totalVisitingConimal'];
//     totalRecommend = json['totalRecommend'];
//     thumbnail = json['thumbnail'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = locId;
//     data['title'] = name;
//     data['openingStatus'] = openingStatus;
//     data['address'] = address;
//     data['coordinate'] = location.toJson();
//     data['totalVisitingConimal'] = totalVisitingConimal;
//     data['totalRecommend'] = totalRecommend;
//     data['thumbnail'] = thumbnail;
//     return data;
//   }
// }

import 'package:geolocator/geolocator.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_navi.dart';

import '../../configs/constants/enum.dart';
import '../../ui/entities/location.dart';
import 'abstract_class/place_type.dart';

class PharmacyPreview implements PlacePreview {
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

  @override
  double distanceByMeter = 0.0;

  @override
  PlaceType placeType = PlaceType.pharmacy;

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
    required this.distanceByMeter,
    this.placeType = PlaceType.hospital,
  });

  PharmacyPreview.fromJson(Map<String, dynamic> json, LatLngClass baseLatLng) {
    locId = json['_id'] ?? '';
    name = json['title'] ?? '';
    openingStatus = json['openingStatus'] ?? '';
    address = json['address'] ?? '';
    location = LatLngClass.fromJson(json['coordinate']);
    totalVisitingConimal = json['totalVisitingConimal'] ?? 0;
    totalRecommend = json['totalRecommend'] ?? 0;
    thumbnail = json['thumbnail'] ?? '';
    distanceByMeter = _getMeterDistanceBetween(
        baseLocation: baseLatLng,
        placeLocation: LatLngClass.fromJson(json['coordinate']));
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

  double _getMeterDistanceBetween(
      {required LatLngClass baseLocation, required LatLngClass placeLocation}) {
    double distanceMeters = GeolocatorPlatform.instance.distanceBetween(
      baseLocation.latitude,
      baseLocation.longitude,
      placeLocation.latitude,
      placeLocation.longitude,
    );

    return distanceMeters;
  }
}
