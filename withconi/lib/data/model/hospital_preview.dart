import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_navi.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/ui/entities/disease_percents.dart';

import '../../ui/entities/location.dart';
import 'abstract_class/place_preview.dart';

class HospitalPreview implements PlacePreview {
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
  String unselectedMarkerImage = "assets/icons/hospital_unclicked.png";

  @override
  String selectedMarkerImage = "assets/icons/hospital_clicked.png";

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
  PlaceType placeType = PlaceType.hospital;

  @override
  bool visitVerified = false;

  @override
  DiseasePercentInfo? diseaseInfo;

  HospitalPreview({
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

  HospitalPreview.fromJson(Map<String, dynamic> json, LatLngClass? baseLatLng) {
    locId = json['_id'] ?? '';
    name = json['name'] ?? '';
    openingStatus = openingStatusFromJson(json['openingStatus'] as String);
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
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['locId'] = locId;
  //   data['title'] = name;
  //   data['openingStatus'] = openingStatusToValue(openingStatus);
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

// @freezed
// abstract class HospitalPreview with _$HospitalPreview implements PlacePreview {
//   const factory HospitalPreview({
//     required String locId,
//     required String name,
//     required LatLngClass location,
//     required String address,
//     required int totalVisitingConimal,
//     required String phone,
//     required int totalRecommend,
//     required OpeningStatus openingStatus,
//     required String thumbnail,
//     required double distanceByMeter,
//     required bool visitVerified,
//     @Default(PlaceType.hospital) PlaceType? placeType,
//     @Default("assets/icons/hospital_unclicked.png")
//         String? unselectedMarkerImage,
//     @Default("assets/icons/hospital_clicked.png") String? selectedMarkerImage,
//   }) = _HospitalPreview;

  // factory HospitalPreview.empty() => HospitalPreview(
  //       id: UniqueId(),
  //       createdAt: 1234,
  //       name: TodoName(''),
  //       done: false,
  //     );
// }



// import 'package:geolocator/geolocator.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk_navi.dart';
// import 'package:withconi/configs/constants/enum.dart';

// import '../../ui/entities/location.dart';
// import 'abstract_class/place_type.dart';

// class HospitalPreview extends PlacePreview {
//   HospitalPreview({
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
//           selectedMarkerImage: "assets/icons/hospital_clicked.png",
//           unselectedMarkerImage: "assets/icons/hospital_unclicked.png",
//           placeType: PlaceType.hospital,
//         );
// }
