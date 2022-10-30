import 'package:withconi/data/model/abstract_class/place_preview.dart';
import 'package:withconi/data/model/hospital_preview.dart';
import 'package:withconi/data/model/pharmacy_preview.dart';
import 'package:withconi/module/ui_model/review_group_ui_class.dart';
import 'package:withconi/module/ui_model/review_ui_class.dart';

import '../enums/enum.dart';
import 'conimal.dart';
import 'package:withconi/data/enums/enum.dart';
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
  ReviewUIClassImpl reviewEntity;
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

    ReviewRate reviewRate = ReviewRate.getByCode(reviewRateString);
    late ReviewUIClassImpl reviewEntity;
    switch (reviewRate) {
      case ReviewRate.low:
        reviewEntity = LowReviewUIClass(selectedReviewItems: []);
        break;
      case ReviewRate.middle:
        reviewEntity = MiddleReviewUIClass(selectedReviewItems: []);
        break;
      case ReviewRate.high:
        reviewEntity = HighReviewUIClass(selectedReviewItems: []);
        break;
      default:
    }

    reviewEntity.selectedReviewItems =
        reviewItemsListString.split(',').map((reviewItemString) {
      return ReviewItems.getByCode(reviewItemString);
    }).toList();

    List<DiseaseType> diseaseTypes =
        diseaseTypeString.split(',').map((diseaseTypeString) {
      return DiseaseType.getByCode(diseaseTypeString);
    }).toList();

    List<Conimal> conimals =
        conimalMapList.map((e) => Conimal.fromJson(e)).toList();

    return Review(
      userId: json['userId'] ?? '',
      placeId: json['locId'] ?? '',
      placeType: PlaceType.getByCode(json['locType'] ?? ''),
      name: json['name'] ?? '',
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
    String status = reviewEntity.reviewRate.code;

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
          return disease.code;
        })
        .toList()
        .join(',');

    selectedReviewItemString = reviewEntity.selectedReviewItems
        .map((reviewItem) {
          return reviewItem.code;
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
