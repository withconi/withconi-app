import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/ui_helper/infinite_scroll.dart';
import 'package:withconi/ui/entities/location.dart';

import '../conimal.dart';

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
        'filterByDisease': diseaseTypeToValue(diseaseType),
        'filterBySpecies': speciesToValue(speciesType),
        'filterByopeningStatus': openingStatusToValue(openingStatus),
        'lat': latLng.latitude,
        'lng': latLng.longitude,
        'distance': distance,
      };
}

class PlaceReviewRequest {
  PlaceReviewRequest({
    required this.userId,
    required this.placeId,
    required this.visitVerified,
    required this.conimals,
    required this.diseaseTypes,
    required this.reviewRate,
    required this.selectedReviewItems,
  });

  String userId;
  String placeId;
  bool visitVerified;
  List<Conimal> conimals;
  List<DiseaseType> diseaseTypes;
  ReviewRate reviewRate;
  List<ReviewItems> selectedReviewItems;

  Map<String, dynamic> toJson() {
    List<String> conimalIdList = [];
    String diseaseTypeString = '';
    String selectedReviewItemString = '';
    int totalDogs = 0;
    int totalCats = 0;
    String status = reviewRateToValue(reviewRate);
    String reviewItems = '';

    conimalIdList = conimals.map((conimal) {
      if (conimal.species == Species.dog) {
        totalDogs++;
      } else if (conimal.species == Species.cat) {
        totalCats++;
      }
      return conimal.conimalId;
    }).toList();

    diseaseTypeString = diseaseTypes
        .map((disease) {
          return diseaseTypeToValue(disease);
        })
        .toList()
        .join(',');

    selectedReviewItemString = selectedReviewItems
        .map((reviewItem) {
          return reviewItemsToValue(reviewItem);
        })
        .toList()
        .join(',');

    return {
      'userId': userId,
      'locId': placeId,
      'isVisiting': visitVerified,
      'conimals': conimalIdList,
      'totalVisitingDogs': totalDogs,
      'totalVisitingCats': totalCats,
      'diseaseType': diseaseTypeString,
      'status': status,
      'reviewDesc': selectedReviewItemString,
    };
  }
}
