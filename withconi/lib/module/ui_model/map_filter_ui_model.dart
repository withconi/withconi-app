import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/core/tools/helpers/infinite_scroll.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import 'latlng_ui_model.dart';

class MapFilterUIModel implements UIModel {
  MapFilterUIModel({
    // this.keyword,
    required this.placeType,
    required this.openingStatus,
    required this.diseaseType,
    required this.speciesType,
    required this.sortType,
    required this.distanceBaseType,
    required this.searchArea,
  });
  // String? keyword;
  PlaceType placeType;
  Species? speciesType;
  Sorting sortType;
  OpeningStatus openingStatus;
  DiseaseType? diseaseType;
  DistanceBaseType distanceBaseType;
  double searchArea;
}
