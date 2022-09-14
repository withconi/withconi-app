import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/ui/entities/disease_percents.dart';

import '../../../ui/entities/location.dart';

abstract class PlacePreviewType {
  final String locId = "";
  final String name = "";
  final String address = "";
  final String openingStatus = "";
  final String unselectedMarkerImage = "";
  final String selectedMarkerImage = "";
  final LatLngClass location = LatLngClass(longitude: 0.0, latitude: 0.0);
  final int totalVisitingConimal = 0;
  final int totalRecommend = 0;
  final String phoneNumber = "";
  final String thumbnail = "";
}

// abstract class PlaceDetailType {
//   final String locId = "";
//   final String name = "";
//   final String address = "";
//   final String thumbnail = "";
//   final LatLngClass location = LatLngClass(longitude: 0.0, latitude: 0.0);
//   final int totalRecommend = 0;
//   final int totalReviews = 0;
//   final int totalVisiting = 0;
//   final int totalVisitingCats = 0;
//   final int totalVisitingDogs = 0;
//   final PlaceType placeType = PlaceType.hospital;
//   final DiseasePercents diseasePercents = DiseasePercents(
//       totalCardiovascular: 0,
//       totalDigestive: 0,
//       totalMusculoskeletal: 0,
//       totalOphthalmology: 0,
//       totalRespiratory: 0,
//       totalUrinary: 0);
// }
