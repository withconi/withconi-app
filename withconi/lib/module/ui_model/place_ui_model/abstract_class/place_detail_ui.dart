import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/review_history_item_response_dto.dart';
import '../../../../../global_widgets/photo_gallary/image_item.dart';
import '../../../../../data/model/dto/response_dto/place_response/disease_history_response_dto.dart';
import '../../../../data/model/dto/response_dto/place_response/review_history_response_dto.dart';
import '../../chart_data_ui_model.dart';
import '../../latlng_ui_model.dart';

abstract class PlaceDetailUiModel {
  final PlaceType placeType = PlaceType.all;
  final String placeId = '';
  final String address = '';
  late final ImageItem thumbnailImage;
  late final LatLngUIModel placeLocation = LatLngUIModel(lat: 0, lng: 0);
  final String name = '';
  bool isBookmarked = false;
  int totalDogs = 0;
  int totalCats = 0;
  String phone = '';
  int totalDiseaseCount = 0;
  int totalReviewCount = 0;
  List<DiseaseHistoryResponseDTO> diseaseHistoryList = [];
  Map<ReviewRate, ReviewItemResponseDTO> reviewHistoryMap = {};

  List<ChartData> get reviewChartData => _makeDiseaseChartData();

  List<ChartData> get speciesChartData => _makeSpeciesChartData();
  List<ChartData> get diseaseChartData => _makeDiseaseChartData();

  List<ChartData> _makeDiseaseChartData() {
    return [];
  }

  List<ChartData> _makeSpeciesChartData();
}
