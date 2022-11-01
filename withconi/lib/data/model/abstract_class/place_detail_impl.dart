import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/ui_model/disease_history_group.dart';
import '../../../module/ui_model/location.dart';

abstract class PlaceDetailImpl {
  PlaceType placeType = PlaceType.hospital;
  String locId = "";
  String name = "";
  String address = "";
  OpeningStatus openingStatus = OpeningStatus.closed;
  String unselectedMarkerImage = "";
  String selectedMarkerImage = "";
  LatLngClass location = LatLngClass(longitude: 0.0, latitude: 0.0);
  String phone = "";
  String thumbnail = "";
  bool visitVerified = false;
  bool isBookmarked = false;
  late DiseaseHistoryGroup diseaseHistoryGroup;
  int totalVisitingDogs = 0;
  int totalVisitingCats = 0;
}
