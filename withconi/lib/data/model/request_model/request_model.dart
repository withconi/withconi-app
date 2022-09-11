import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/ui_helper/infinite_scroll.dart';
import 'package:withconi/ui/entities/location.dart';

class MapFilterRequest {
  MapFilterRequest({
    required this.paginationFilter,
    required this.latLng,
    this.keyword,
    this.locType,
    this.openingStatus,
    this.diseaseType,
    this.speciesType,
    required this.distance,
  });

  PaginationFilter paginationFilter;
  String? keyword;
  PlaceType? locType;
  Species? speciesType;
  OpeningStatus? openingStatus;
  LatLngClass latLng;
  DiseaseType? diseaseType;
  int distance;

  Map<String, dynamic> toJson() => {
        'page': paginationFilter.page,
        'listSize': paginationFilter.limit,
        'keyword': keyword,
        'locType': placeTypeToValue(locType),
        'sortByDisease': diseaseTypeToValue(diseaseType),
        'sortBySpecies': speciesToValue(speciesType),
        'openingStatus': openingStatusToValue(openingStatus),
        'lat': latLng.latitude,
        'lng': latLng.longitude,
        'distance': distance,
      };
}
