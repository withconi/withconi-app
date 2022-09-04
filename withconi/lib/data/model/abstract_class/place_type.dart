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

abstract class PlaceDetailType {
  final String uid = "";
  final String storeName = "";
  final String address = "";
  final String markerImage = "";
  final LatLngClass location = LatLngClass(longitude: 0.0, latitude: 0.0);
  final String detailInfo = "";
  final String phoneNumber = "";
  final String snsLink = "";
}
