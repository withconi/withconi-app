import 'package:geolocator/geolocator.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/module/ui_model/disease_history_group.dart';
import 'package:withconi/module/map/map_main_page.dart';

import '../../../module/ui_model/location.dart';

abstract class PlacePreviewImpl {
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
  late DiseaseType highestDiseaseType;
  bool isVerified = false;
}
