import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/core/tools/helpers/infinite_scroll.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import '../../data/model/latlng.dart';

class MapFilterUIModel implements UIModel<MapFilterUIModel> {
  MapFilterUIModel({
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
}
