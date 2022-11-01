import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_navi.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/ui_model/disease_history_group.dart';

import '../../module/ui_model/location.dart';
import 'abstract_class/place_detail_impl.dart';
import 'abstract_class/place_preview_impl.dart';

class HospitalDetail implements PlaceDetailImpl {
  @override
  String locId = "";

  @override
  String address = "";
  @override
  bool visitVerified = false;
  @override
  bool isBookmarked = false;
  @override
  late DiseaseHistoryGroup diseaseHistoryGroup;

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
  late String thumbnail;

  @override
  late PlaceType placeType;

  @override
  int totalVisitingDogs;

  @override
  int totalVisitingCats;

  HospitalDetail({
    required this.locId,
    required this.name,
    required this.location,
    required this.address,
    required this.phone,
    required this.openingStatus,
    required this.thumbnail,
    required this.visitVerified,
    required this.isBookmarked,
    required this.diseaseHistoryGroup,
    required this.totalVisitingCats,
    required this.totalVisitingDogs,
    this.placeType = PlaceType.pharmacy,
  });

  factory HospitalDetail.fromJson(Map<String, dynamic> json) {
    return HospitalDetail(
      locId: json['_id'] ?? '',
      name: json['name'] ?? '',
      location: LatLngClass.fromJson(json['coordinate']),
      address: json['address'] ?? '',
      phone: json['[phone'] ?? '',
      openingStatus: OpeningStatus.getByCode(json['openingStatus'] ?? ''),
      thumbnail: json['thumbnail'] ?? '',
      visitVerified: json['visitVerified'] ?? '',
      isBookmarked: json['isBookmarked'] ?? '',
      diseaseHistoryGroup: DiseaseHistoryGroup.fromJson(json),
      totalVisitingCats: json['totalVisitingCats'] ?? 0,
      totalVisitingDogs: json['totalVisitingDogs'] ?? 0,
    );
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

  // distanceByMeter = _getMeterDistanceBetween(
  //     baseLocation: baseLatLng ?? LatLngClass(latitude: 0, longitude: 0),
  //     placeLocation: LatLngClass.fromJson(json['coordinate']));

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

}

// @freezed
// abstract classHospitalDetail with _HospitalDetail implements PlacePreview {
//   const factoryHospitalDetail({
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

  // factoryHospitalDetail.empty() =>HospitalDetail(
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

// classHospitalDetail extends PlacePreview {
//  HospitalDetail({
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
