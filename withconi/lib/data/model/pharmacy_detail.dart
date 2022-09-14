// import 'package:kakao_flutter_sdk/kakao_flutter_sdk_navi.dart';
// import 'package:withconi/ui/entities/disease_percents.dart';
// import 'package:withconi/configs/constants/enum.dart';

// import '../../ui/entities/location.dart';
// import 'abstract_class/place_type.dart';

// class PharmacyDetail implements PlaceDetailType {
//   @override
//   String locId = '';

//   @override
//   String address = '';

//   @override
//   late DiseasePercents diseasePercents;

//   @override
//   LatLngClass location = LatLngClass(latitude: 0.0, longitude: 0.0);

//   @override
//   PlaceType placeType = PlaceType.pharmacy;

//   @override
//   String thumbnail = '';

//   @override
//   String name = '';

//   @override
//   int totalRecommend = 0;

//   @override
//   int totalReviews = 0;

//   @override
//   int totalVisiting = 0;

//   @override
//   int totalVisitingCats = 0;

//   @override
//   int totalVisitingDogs = 0;

//   PharmacyDetail(
//       {required this.locId,
//       required this.name,
//       required this.address,
//       required this.location,
//       required this.placeType,
//       required this.diseasePercents,
//       required this.thumbnail,
//       required this.totalRecommend,
//       required this.totalReviews,
//       required this.totalVisiting,
//       required this.totalVisitingDogs,
//       required this.totalVisitingCats});

//   PharmacyDetail.fromJson(Map<String, dynamic> json) {
//     locId = json['_id'] ?? '';
//     name = json['title'] ?? '';
//     address = json['address'] ?? '';
//     location = LatLngClass.fromJson(json['coordinate']);
//     totalRecommend = json['totalRecommend'] ?? 0;
//     thumbnail = json['thumbnail'] ?? '';
//     totalReviews = json['totalReviews'] ?? 0;
//     totalVisiting = json['totalVisiting'] ?? 0;
//     totalVisitingDogs = json['totalVisitingDogs'] ?? 0;
//     totalVisitingCats = json['totalVisitingCats'] ?? 0;
//     diseasePercents = DiseasePercents.fromJson(json);
//     placeType = PlaceType.pharmacy;
//   }
// }
