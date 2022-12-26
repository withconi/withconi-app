// Review placeReview = Review(
//   userId: userId,
//   placeId: place.placeId,
//   visitVerified: place.visitVerified,
//   conimals: conimals,
//   diseaseTypes: diseaseTypes,
//   reviewEntity: reviewEntity,
//   placeType: place.placeType,
//   name: place.name,
//   address: place.address,

// );

import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';

import 'package:withconi/module/ui_model/review_detail_ui_model.dart';

import '../../../../enums/enum.dart';

import '../abstract_request/request_dto_abstract.dart';

class CreateReviewRequestDTO
    extends RequestConverter<CreateReviewRequestDTO, ReviewDetailUIModel>
    implements RequestDTO {
  final String _placeId;
  final List<String> _conimalIdList;
  final List<DiseaseType> _diseaseTypeList;
  final List<DiseaseUIModel> _diseaseIdList;
  final ReviewRate _reviewRate;
  final List<ReviewItem> _reviewItems;
  final int _totalVisitingDogs;
  final int _totalVisitingCats;
  final List<String> _reviewImageRefs;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.MAP_CREATE_REVIEW;

  CreateReviewRequestDTO.fromData(
      {required ReviewDetailUIModel data, required List<String> imageRefs})
      : _placeId = data.placeId,
        _conimalIdList = data.conimals.map((e) => e.conimalId).toList(),
        _diseaseIdList = data.diseaseList.toList(),
        _diseaseTypeList = data.diseaseTypes,
        _reviewRate = data.reviewRate!,
        _reviewItems = data.reviewItems,
        _totalVisitingDogs = data.conimals
            .where((element) => element.species == Species.dog)
            .toList()
            .length,
        _totalVisitingCats = data.conimals
            .where((element) => element.species == Species.cat)
            .toList()
            .length,
        _reviewImageRefs = imageRefs,
        super.fromData(data);

  @override
  Map<String, dynamic> get dataMap {
    List<String> _diseases = List.empty(growable: true);
    if (_diseaseIdList.isEmpty) {
      _diseases = _diseaseTypeList.map((e) => e.code).toList();
    } else {
      List<DiseaseType> diseaseIdTypeList =
          _diseaseIdList.map((e) => e.diseaseType).toList();

      List<DiseaseType> notIncludedType = _diseaseTypeList
          .where((element) => !diseaseIdTypeList.contains(element))
          .toList();

      _diseases.addAll(_diseaseIdList
          .map((e) => "${e.diseaseType.code}_${e.diseaseId}")
          .toList());

      if (notIncludedType.isNotEmpty) {
        _diseases.addAll(notIncludedType.map((e) => e.code).toList());
      }

      print(_diseases);
    }
    return {
      'locId': _placeId,
      'conimals': _conimalIdList,
      'diseases': _diseases,
      'status': _reviewRate.code,
      'reviewItems': _reviewItems.map((e) => e.itemCode).toList(),
      'totalVisitingDogs': _totalVisitingDogs,
      'totalVisitingCats': _totalVisitingCats,
      'reviewImageRefs': _reviewImageRefs,
    };
  }
}
