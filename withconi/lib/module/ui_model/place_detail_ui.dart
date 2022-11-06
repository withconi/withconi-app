import 'package:geolocator/geolocator.dart';
import 'package:withconi/data/model/disease_history.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';
import 'package:withconi/data/model/disease_history_group.dart';

import '../../core/tools/helpers/calculator.dart';
import '../../data/enums/enum.dart';
import '../../data/enums/enum_color.dart';
import '../../data/model/abstract_class/place_detail.dart';
import '../../data/model/abstract_class/place_preview.dart';
import '../../data/model/latlng.dart';
import '../../data/model/dto/response_dto/post_response_dto.dart';
import 'chart_data_ui_model.dart';

class PlaceDetailUIModel {
  final String placeId;
  final String address;
  final ImageItem thumbnailImage;
  final LatLngClass placeLocation;
  final String name;
  bool isBookmarked;
  String phone;
  List<ChartData> conimalChartData;
  List<ChartData> diseaseChartData;
  List<DiseaseHistory> diseaseHistoryList;

  PlaceDetailUIModel(
      {required this.address,
      // required this.baseLocation,
      required this.phone,
      required this.conimalChartData,
      required this.diseaseChartData,
      required this.diseaseHistoryList,
      required this.isBookmarked,
      required this.name,
      required this.placeId,
      required this.placeLocation,
      required this.thumbnailImage});

  factory PlaceDetailUIModel.fromDTO(PlaceDetailImpl placeDTO) {
    List<ChartData> conimalChartList = makeSpeciesChartData(
        placeDTO.totalVisitingDogs, placeDTO.totalVisitingCats);
    List<ChartData> diseaseChartList =
        makeDiseaseChartData(placeDTO.diseaseHistoryGroup);
    return PlaceDetailUIModel(
        phone: placeDTO.phone,
        address: placeDTO.address,
        isBookmarked: placeDTO.isBookmarked,
        name: placeDTO.name,
        placeId: placeDTO.locId,
        placeLocation: placeDTO.location,
        thumbnailImage: ImageItem(
            id: placeDTO.locId,
            resource: placeDTO.thumbnail,
            imageType: ImageType.network),
        conimalChartData: conimalChartList,
        diseaseChartData: diseaseChartList,
        diseaseHistoryList: placeDTO.diseaseHistoryGroup.historyList);
  }
}

List<ChartData> makeSpeciesChartData(int totalDogs, int totalCats) {
  ChartData dogChartData = ChartData(
      value: totalDogs,
      percent: calculatePercent(
          totalNum: totalCats + totalDogs, valueNum: totalDogs),
      color: colorBySpecies(Species.dog),
      title: '강아지');
  ChartData catChartData = ChartData(
      value: totalCats,
      percent: calculatePercent(
          totalNum: totalCats + totalDogs, valueNum: totalCats),
      color: colorBySpecies(Species.cat),
      title: '고양이');
  return [dogChartData, catChartData];
}

List<ChartData> makeDiseaseChartData(DiseaseHistoryGroup diseaseHistoryGroup) {
  List<ChartData> diseaseData = [];
  int totalDiseaseNum = diseaseHistoryGroup.totalHistory;

  if (totalDiseaseNum != 0) {
    diseaseHistoryGroup.diseaseMap.forEach((diseaseType, value) {
      ChartData chartData = ChartData(
          value: value,
          percent: calculatePercent(totalNum: totalDiseaseNum, valueNum: value),
          color: colorByDisease(diseaseType),
          title: diseaseType.displayName);
      if (value != 0) {
        diseaseData.add(chartData);
      }
    });
  }
  return diseaseData;
}

calculatePercent({required int totalNum, required int valueNum}) {
  double percentDouble = (valueNum / totalNum) * 100;
  int percentInt = (percentDouble.isNaN || percentDouble.isInfinite)
      ? 0
      : percentDouble.toInt();
  return percentInt;
}
