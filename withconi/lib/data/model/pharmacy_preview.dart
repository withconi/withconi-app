import 'package:withconi/ui/entities/disease_percents.dart';

import '../../configs/constants/enum.dart';
import '../../ui/entities/location.dart';
import 'abstract_class/place_preview.dart';

import 'package:geolocator/geolocator.dart';

class PharmacyPreview implements PlacePreview {
  @override
  String locId = "";

  @override
  String address = "";

  @override
  int totalVisiting = 0;

  @override
  int totalReviews = 0;

  @override
  String phone = "";

  @override
  String unselectedMarkerImage = "assets/icons/pharmacy_unclicked.png";

  @override
  String selectedMarkerImage = "assets/icons/pharmacy_clicked.png";

  @override
  String name = "";

  @override
  LatLngClass location = LatLngClass(latitude: 0.0, longitude: 0.0);

  @override
  OpeningStatus openingStatus = OpeningStatus.closed;

  @override
  String thumbnail = "";

  @override
  double distanceByMeter = 0.0;

  @override
  PlaceType placeType = PlaceType.pharmacy;

  @override
  bool visitVerified = false;

  @override
  DiseasePercentInfo? diseaseInfo;

  PharmacyPreview({
    required this.locId,
    required this.name,
    required this.location,
    required this.address,
    required this.totalVisiting,
    required this.phone,
    required this.totalReviews,
    required this.openingStatus,
    required this.thumbnail,
    required this.distanceByMeter,
    required this.visitVerified,
    this.diseaseInfo,
    this.placeType = PlaceType.hospital,
  });

  PharmacyPreview.fromJson(Map<String, dynamic> json, LatLngClass? baseLatLng) {
    locId = json['_id'] ?? '';
    name = json['name'] ?? '';
    openingStatus = openingStatusFromJson(json['openingStatus'] ?? '');
    address = json['address'] ?? '';
    location = LatLngClass.fromJson(json['coordinate']);
    totalVisiting = json['totalVisiting'] ?? 0;
    totalReviews = json['totalReviews'] ?? 0;
    thumbnail = json['thumbnail'] ?? '';
    distanceByMeter = _getMeterDistanceBetween(
        baseLocation: baseLatLng ?? LatLngClass(latitude: 0, longitude: 0),
        placeLocation: LatLngClass.fromJson(json['coordinate']));
    visitVerified = json['isVisitVerified'] ?? false;
    phone = json['phone'] ?? '';
    diseaseInfo = DiseasePercentInfo.fromJson(json);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['locId'] = locId;
  //   data['title'] = name;
  //   data['openingStatus'] = openingStatus;
  //   data['address'] = address;
  //   data['coordinate'] = location.toJson();
  //   data['totalVisitingConimal'] = totalVisiting;
  //   data['totalRecommend'] = totalReviews;
  //   data['thumbnail'] = thumbnail;
  //   return data;
  // }

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

// import '../../configs/constants/enum.dart';
// import '../../ui/entities/location.dart';
// import 'abstract_class/place_type.dart';

// class PharmacyPreview extends PlacePreview {
//   PharmacyPreview({
//     required String locId,
//     required String name,
//     required LatLngClass location,
//     required String address,
//     required int totalVisitingConimal,
//     required String phoneNumber,
//     required int totalRecommend,
//     required String openingStatus,
//     required String thumbnail,
//     required double distanceByMeter,
//   }) : super(
//           locId: locId,
//           name: name,
//           location: location,
//           address: address,
//           totalRecommend: totalRecommend,
//           totalVisitingConimal: totalVisitingConimal,
//           phoneNumber: phoneNumber,
//           openingStatus: openingStatus,
//           thumbnail: thumbnail,
//           distanceByMeter: distanceByMeter,
//           selectedMarkerImage: "assets/icons/pharmacy_clicked.png",
//           unselectedMarkerImage: "assets/icons/pharmacy_unclicked.png",
//           placeType: PlaceType.pharmacy,
//         );
// }
