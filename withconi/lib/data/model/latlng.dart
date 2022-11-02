import 'package:flutter_naver_map/flutter_naver_map.dart';

class LatLngClass extends LatLng {
  double latitude;
  double longitude;

  LatLngClass({required this.latitude, required this.longitude})
      : super(latitude, longitude);

  factory LatLngClass.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      LatLng latLng = LatLng(json['lat'] as double, json['lng'] as double);
      return LatLngClass(
          latitude: latLng.latitude, longitude: latLng.longitude);
    } else {
      return LatLngClass(latitude: 0.0, longitude: 0.0);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = latitude;
    data['lng'] = longitude;
    return data;
  }
}
