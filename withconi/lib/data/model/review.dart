import 'package:withconi/data/model/abstract_class/place_preview.dart';
import 'package:withconi/data/model/hospital_preview.dart';
import 'package:withconi/data/model/pharmacy_preview.dart';
import 'package:withconi/ui/entities/review_entity.dart';
import 'package:withconi/ui/entities/review_rate_entity.dart';

import '../../configs/constants/enum.dart';
import 'conimal.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/data/model/conimal.dart';

class Review {
  Review({
    required this.userId,
    required this.placeId,
    required this.visitVerified,
    required this.conimals,
    required this.diseaseTypes,
    required this.reviewEntity,
    required this.name,
    required this.address,
    required this.placeType,
  });

  String userId;
  String placeId;
  bool visitVerified;
  List<Conimal> conimals;
  List<DiseaseType> diseaseTypes;
  ReviewEntity reviewEntity;
  String name;
  String address;
  PlaceType placeType;

  factory Review.fromJson(Map<String, dynamic> json) {
    List<dynamic> conimalsMap = json['conimals'] ?? [];
    List<Map<String, dynamic>> conimalMapList =
        conimalsMap.map((e) => e as Map<String, dynamic>).toList();

    String reviewItemsListString = json['reviewDesc'] ?? [];
    String reviewRateString = json['status'] ?? '';
    String diseaseTypeString = json['diseaseType'] ?? [];

    // if (json['placePreview']['locType'] == 'hospital') {
    //   placePreview = HospitalPreview.fromJson(
    //       json['placePreview'] as Map<String, dynamic>, null);
    // } else {
    //   placePreview = PharmacyPreview.fromJson(
    //       json['placePreview'] as Map<String, dynamic>, null);
    // }

    ReviewRate reviewRate = reviewRateFromString(reviewRateString);
    late ReviewEntity reviewEntity;
    switch (reviewRate) {
      case ReviewRate.low:
        reviewEntity = LowReviewEntity(selectedReviewItems: []);
        break;
      case ReviewRate.middle:
        reviewEntity = MiddleReviewEntity(selectedReviewItems: []);
        break;
      case ReviewRate.high:
        reviewEntity = HighReviewEntity(selectedReviewItems: []);
        break;
      default:
    }

    reviewEntity.selectedReviewItems =
        reviewItemsListString.split(',').map((reviewRateString) {
      return reviewItemsFromString(reviewRateString);
    }).toList();

    List<DiseaseType> diseaseTypes =
        diseaseTypeString.split(',').map((diseaseTypeString) {
      return diseaseTypeFromString(diseaseTypeString);
    }).toList();

    List<Conimal> conimals =
        conimalMapList.map((e) => Conimal.fromJson(e)).toList();

    return Review(
      userId: json['userId'] ?? '',
      placeId: json['locId'] ?? '',
      placeType: placeTypeFromString(json['locType']),
      name: json['title'],
      address: json['address'],
      visitVerified: json['isVisiting'] ?? false,
      conimals: conimals,
      diseaseTypes: diseaseTypes,
      reviewEntity: reviewEntity,
    );
  }

  Map<String, dynamic> toJson() {
    List<String> conimalIdList = [];
    String diseaseTypeString = '';
    String selectedReviewItemString = '';
    int totalDogs = 0;
    int totalCats = 0;
    String status = reviewRateToValue(reviewEntity.reviewRate);

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

    selectedReviewItemString = reviewEntity.selectedReviewItems
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
