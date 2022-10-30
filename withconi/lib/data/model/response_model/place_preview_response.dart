import '../../../module/ui_model/location.dart';
import '../abstract_class/place_preview.dart';
import '../hospital_preview.dart';
import '../pharmacy_preview.dart';

class PlacePreviewResponse {
  List<PlacePreview> placeList;
  int totalDocuments = 0;

  PlacePreviewResponse({required this.placeList, required this.totalDocuments});

  factory PlacePreviewResponse.fromJson(
      Map<String, dynamic> json, LatLngClass baseLatLng) {
    List<PlacePreview> list = [];
    int totalDocs = 0;
    totalDocs = json['totalSearchDocuments'];
    if (json['list'] != null) {
      list = <PlacePreview>[];
      json['list'].forEach((v) {
        if (v['locType'] == 'hospital') {
          list.add(HospitalPreview.fromJson(v, baseLatLng));
        } else if (v['locType'] == 'pharmacy') {
          list.add(PharmacyPreview.fromJson(v, baseLatLng));
        }
      });
    }

    return PlacePreviewResponse(placeList: list, totalDocuments: totalDocs);
  }
}
