import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/lat_lng_response_dto.dart';

class LatLngUIModel extends LatLng {
  final double lat;
  final double lng;

  LatLngUIModel({required this.lat, required this.lng}) : super(lat, lng);

  factory LatLngUIModel.fromDto(LatLngResponseDTO responseDTO) {
    return LatLngUIModel(lat: responseDTO.lat, lng: responseDTO.lng);
  }
}
