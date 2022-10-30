import 'package:geolocator/geolocator.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/module/ui_model/disease_history_group.dart';
import 'package:withconi/module/pages/map/map_main_page.dart';

import '../../../module/ui_model/location.dart';

abstract class PlacePreview {
  PlaceType placeType = PlaceType.hospital;
  String locId = "";
  String name = "";
  String address = "";
  OpeningStatus openingStatus = OpeningStatus.closed;
  String unselectedMarkerImage = "";
  String selectedMarkerImage = "";
  LatLngClass location = LatLngClass(longitude: 0.0, latitude: 0.0);
  int totalVisiting = 0;
  int totalReviews = 0;
  String phone = "";
  String thumbnail = "";
  double distanceByMeter = 0.0;
  bool visitVerified = false;
  DiseaseHistoryGroup? diseaseInfo;

  // PlacePreview.fromJson(Map<String, dynamic> json, LatLngClass baseLatLng) {
  //   locId = json['_id'] ?? '';
  //   name = json['title'] ?? '';
  //   openingStatus = json['openingStatus'] ?? '';
  //   address = json['address'] ?? '';
  //   location = LatLngClass.fromJson(json['coordinate']);
  //   totalVisitingConimal = json['totalVisitingConimal'] ?? 0;
  //   totalRecommend = json['totalRecommend'] ?? 0;
  //   thumbnail = json['thumbnail'] ?? '';
  //   distanceByMeter = _getMeterDistanceBetween(
  //       baseLocation: baseLatLng,
  //       placeLocation: LatLngClass.fromJson(json['coordinate']));
  //   visitVerified = json['visitVerified'] ?? false;
  // }

  // double _getMeterDistanceBetween(
  //     {required LatLngClass baseLocation, required LatLngClass placeLocation}) {
  //   double distanceMeters = GeolocatorPlatform.instance.distanceBetween(
  //     baseLocation.latitude,
  //     baseLocation.longitude,
  //     placeLocation.latitude,
  //     placeLocation.longitude,
  //   );

  //   return distanceMeters;
  // }
}

// abstract class PlacePreview {
//   PlaceType get placeType;
//   String get locId;
//   String get name;
//   String get address;
//   OpeningStatus get openingStatus;
//   String get unselectedMarkerImage;
//   String get selectedMarkerImage;
//   LatLngClass get location;
//   int get totalVisitingConimal;
//   int get totalRecommend;
//   String get phone;
//   String get thumbnail;
//   double get distanceByMeter;
//   bool get visitVerified;
// }


// import 'package:geolocator/geolocator.dart';
// import 'package:withconi/configs/constants/enum.dart';
// import 'package:withconi/ui/entities/disease_percents.dart';

// import '../../../ui/entities/location.dart';

// class PlacePreview {
//   PlaceType placeType = PlaceType.hospital;
//   String locId = "";
//   String name = "";
//   String address = "";
//   String openingStatus = "";
//   String unselectedMarkerImage = "";
//   String selectedMarkerImage = "";
//   LatLngClass location = LatLngClass(longitude: 0.0, latitude: 0.0);
//   int totalVisitingConimal = 0;
//   int totalRecommend = 0;
//   String phoneNumber = "";
//   String thumbnail = "";
//   double distanceByMeter = 0.0;

//   PlacePreview({
//     required this.placeType,
//     required this.locId,
//     required this.name,
//     required this.address,
//     required this.openingStatus,
//     required this.unselectedMarkerImage,
//     required this.selectedMarkerImage,
//     required this.location,
//     required this.totalVisitingConimal,
//     required this.totalRecommend,
//     required this.phoneNumber,
//     required this.thumbnail,
//     required this.distanceByMeter,
//   });
//   PlacePreview.fromJson(Map<String, dynamic> json, LatLngClass baseLatLng) {
//     locId = json['_id'] ?? '';
//     name = json['title'] ?? '';
//     openingStatus = json['openingStatus'] ?? '';
//     address = json['address'] ?? '';
//     location = LatLngClass.fromJson(json['coordinate']);
//     totalVisitingConimal = json['totalVisitingConimal'] ?? 0;
//     totalRecommend = json['totalRecommend'] ?? 0;
//     thumbnail = json['thumbnail'] ?? '';
//     distanceByMeter = _getMeterDistanceBetween(
//         baseLocation: baseLatLng,
//         placeLocation: LatLngClass.fromJson(json['coordinate']));
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['locId'] = locId;
//     data['title'] = name;
//     data['openingStatus'] = openingStatus;
//     data['address'] = address;
//     data['coordinate'] = location.toJson();
//     data['totalVisitingConimal'] = totalVisitingConimal;
//     data['totalRecommend'] = totalRecommend;
//     data['thumbnail'] = thumbnail;
//     return data;
//   }

//   double _getMeterDistanceBetween(
//       {required LatLngClass baseLocation, required LatLngClass placeLocation}) {
//     double distanceMeters = GeolocatorPlatform.instance.distanceBetween(
//       baseLocation.latitude,
//       baseLocation.longitude,
//       placeLocation.latitude,
//       placeLocation.longitude,
//     );

//     return distanceMeters;
//   }
// }
