import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/core/tools/helpers/infinite_scroll.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import 'latlng_ui_model.dart';

class MapFilterUIModel implements UIModel {
  MapFilterUIModel({
    this.keyword,
    required this.placeType,
    required this.openingStatus,
    this.diseaseType,
    this.speciesType,
    required this.sortType,
    required this.locationType,
    required this.searchArea,
  });
  String? keyword;
  PlaceType placeType;
  Species? speciesType;
  SortType sortType;
  OpeningStatus openingStatus;
  DiseaseType? diseaseType;
  LocationSearchType locationType;
  int searchArea;
}
