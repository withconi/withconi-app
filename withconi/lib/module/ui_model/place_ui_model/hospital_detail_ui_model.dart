import 'package:withconi/data/model/dto/response_dto/place_response/disease_history_item_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/disease_history_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/lat_lng_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_detail_response_dto.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';
import '../../../data/enums/enum.dart';
import '../../../data/model/dto/response_dto/place_response/review_history_item_response_dto.dart';
import '../latlng_ui_model.dart';
import '../chart_data_ui_model.dart';
import 'abstract_class/place_detail_ui.dart';

class HospitalDetailUIModel implements PlaceDetailUiModel {
  @override
  PlaceType get placeType => PlaceType.hospital;

  @override
  final String placeId;

  @override
  final String address;

  @override
  late final ImageItem thumbnailImage;

  @override
  late final LatLngUIModel placeLocation;

  @override
  final String name;

  @override
  bool isBookmarked;

  @override
  int totalDogs;

  @override
  int totalCats;

  @override
  String phone;

  @override
  int totalDiseaseCount;

  @override
  int totalReviewCount;

  @override
  List<DiseaseHistoryResponseDTO> diseaseHistoryList;

  @override
  Map<ReviewRate, ReviewItemResponseDTO> reviewHistoryMap;

  @override
  List<ChartData> get speciesChartData => _makeSpeciesChartData();

  @override
  List<ChartData> get diseaseChartData => _makeDiseaseChartData();

  @override
  List<ChartData> get reviewChartData => _makeReviewChartData();

  HospitalDetailUIModel(
      {required this.address,
      required this.phone,
      required this.totalDiseaseCount,
      required this.totalDogs,
      required this.totalCats,
      required this.diseaseHistoryList,
      required this.reviewHistoryMap,
      required this.isBookmarked,
      required this.name,
      required this.placeId,
      required this.placeLocation,
      required this.thumbnailImage,
      required this.totalReviewCount});

  factory HospitalDetailUIModel.fromDTO(
      HospitalPlaceDetailResponseDTO placeDTO) {
    // int totalHistoryCount = placeDTO.diseaseHistoryGroup.totalHistory;

    return HospitalDetailUIModel(
        // totalCats: placeDTO.totalVisitingCats,
        // totalDogs: placeDTO.totalVisitingDogs,
        totalCats: 10,
        totalDogs: 3,
        phone: placeDTO.phone,
        address: placeDTO.address,
        isBookmarked: placeDTO.isBookmarked,
        name: placeDTO.name,
        placeId: placeDTO.placeId,
        placeLocation: LatLngUIModel.fromDto(
            placeDTO.coordinate ?? LatLngResponseDTO(lat: 0.0, lng: 0.0)),
        thumbnailImage: (placeDTO.thumbnail.isEmpty)
            ? _detailDefaultThumbnailImage
            : ImageItem(
                id: placeDTO.placeId,
                resource: placeDTO.thumbnail,
                imageType: ImageType.network),
        // diseaseHistoryList: placeDTO.diseaseHistory.diseaseHistoryList,
        // reviewHistoryMap: placeDTO.reviewHistory.reviewHistoryMap,
        // totalDiseaseCount: placeDTO.diseaseHistory.totalDiseaseHistoryCount,
        // totalReviewCount: placeDTO.reviewHistory.totalReviewCount,
        diseaseHistoryList: [
          DiseaseHistoryResponseDTO(diseaseHistoryItems: [
            DiseaseHistoryItemResponseDTO(
                diseaseName: '갑상선 기능 항진증(Hyperthyroidism)', diseasePercent: 88),
            DiseaseHistoryItemResponseDTO(
                diseaseName: '갑상선 기능 저하증(Hypothyroidism)', diseasePercent: 12)
          ], diseaseType: DiseaseType.endocrinology, totalDiseaseType: 4),
          DiseaseHistoryResponseDTO(diseaseHistoryItems: [
            DiseaseHistoryItemResponseDTO(
                diseaseName: '만성설사, 고양이(Fline chronic diarrhear)',
                diseasePercent: 34),
            DiseaseHistoryItemResponseDTO(
                diseaseName: '방광염(Cystitis in dogs and cats)',
                diseasePercent: 23)
          ], diseaseType: DiseaseType.urinary, totalDiseaseType: 2),
          DiseaseHistoryResponseDTO(diseaseHistoryItems: [
            DiseaseHistoryItemResponseDTO(
                diseaseName: '편평세포암/ 편평상피암 - 귀', diseasePercent: 64),
            DiseaseHistoryItemResponseDTO(
                diseaseName: '간세포 암종(HCCA)', diseasePercent: 38)
          ], diseaseType: DiseaseType.oncology, totalDiseaseType: 2)
        ],
        reviewHistoryMap: {
          ReviewRate.low: ReviewItemResponseDTO(
            reviewHistoryMap: {
              ReviewItem.explanation: 1,
              ReviewItem.kindness: 0,
              ReviewItem.price: 1,
              ReviewItem.adequateExamination: 1,
              ReviewItem.effectiveness: 1,
              ReviewItem.waitingExperience: 0,
            },
            totalReviewRateCount: 1,
          ),
          ReviewRate.middle: ReviewItemResponseDTO(
            reviewHistoryMap: {
              ReviewItem.explanation: 1,
              ReviewItem.kindness: 0,
              ReviewItem.price: 2,
              ReviewItem.adequateExamination: 1,
              ReviewItem.effectiveness: 3,
              ReviewItem.waitingExperience: 1,
            },
            totalReviewRateCount: 2,
          ),
          ReviewRate.high: ReviewItemResponseDTO(
            reviewHistoryMap: {
              ReviewItem.explanation: 1,
              ReviewItem.kindness: 2,
              ReviewItem.adequateExamination: 1,
              ReviewItem.effectiveness: 4,
              ReviewItem.price: 5,
              ReviewItem.waitingExperience: 5,
            },
            totalReviewRateCount: 5,
          ),
        },
        totalDiseaseCount: 20,
        totalReviewCount: 9);
  }

  List<ChartData> _makeSpeciesChartData() {
    ChartData dogChartData = ChartData(
        value: totalDogs,
        percent: _calculatePercent(
            totalNum: totalCats + totalDogs, valueNum: totalDogs),
        color: Species.dog.graphColor,
        title: '강아지');
    ChartData catChartData = ChartData(
        value: totalCats,
        percent: _calculatePercent(
            totalNum: totalCats + totalDogs, valueNum: totalCats),
        color: Species.cat.mainColor,
        title: '고양이');
    return [dogChartData, catChartData];
  }

  List<ChartData> _makeDiseaseChartData() {
    List<ChartData> diseaseData = [];
    int totalDiseaseNum = 0;
    for (var diseaseHistory in diseaseHistoryList) {
      totalDiseaseNum += diseaseHistory.totalDiseaseType;
    }

    if (totalDiseaseNum != 0) {
      for (var diseaseHistory in diseaseHistoryList) {
        if (diseaseHistory.totalDiseaseType != 0) {
          diseaseData.add(ChartData(
            percent: _calculatePercent(
                totalNum: totalDiseaseNum,
                valueNum: diseaseHistory.totalDiseaseType),
            color: diseaseHistory.diseaseType.color,
            title: diseaseHistory.diseaseType.displayName,
            value: diseaseHistory.totalDiseaseType,
          ));
        }
      }
    }
    return diseaseData;
  }

  List<ChartData> _makeReviewChartData() {
    int totalReview = totalReviewCount;

    var chartList = reviewHistoryMap.keys
        .map((key) => ChartData(
            percent: _calculatePercent(
                totalNum: totalReview,
                valueNum: reviewHistoryMap[key]!.totalReviewRateCount),
            color: key.mainColor,
            title: key.displayName,
            value: reviewHistoryMap[key]!.totalReviewRateCount))
        .toList();
    return chartList;
  }

  int _calculatePercent({required int totalNum, required int valueNum}) {
    double percentDouble = (valueNum / totalNum) * 100;
    int percentInt = (percentDouble.isNaN || percentDouble.isInfinite)
        ? 0
        : percentDouble.toInt();
    return percentInt;
  }
}

ImageItem get _detailDefaultThumbnailImage => ImageItem(
    id: DateTime.now().microsecondsSinceEpoch.toString(),
    resource: 'assets/images/place_detail_default_thumbnail.png',
    imageType: ImageType.asset);
