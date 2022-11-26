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

import 'package:withconi/module/ui_model/review_detail_ui_model.dart';

import '../../../../enums/enum.dart';

import '../abstract_request/request_dto_abstract.dart';

class CreateReviewRequestDTO
    extends RequestConverter<CreateReviewRequestDTO, ReviewDetailUIModel>
    implements RequestDTO {
  final String _placeId;
  final bool _visitVerified;
  final List<String> _conimalIdList;
  final List<DiseaseType> _diseaseTypeList;
  final List<String> _diseaseIdList;
  final ReviewRate _reviewRate;
  final List<ReviewItem> _reviewItems;
  final String _reviewDesc;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST;

  @override
  String get url => HttpUrl.MAP_CREATE_REVIEW;

  CreateReviewRequestDTO.fromData({required ReviewDetailUIModel data})
      : _placeId = data.placePreview!.placeId,
        _visitVerified = data.placePreview!.visitVerified,
        _conimalIdList = data.conimals.map((e) => e.conimalId).toList(),
        _diseaseIdList = data.diseaseList.map((e) => e.code).toList(),
        _diseaseTypeList = data.diseaseTypes,
        _reviewRate = data.reviewRate!,
        _reviewItems = data.reviewItems,
        _reviewDesc = data.reviewDesc,
        super.fromData(data);

  @override
  Map<String, dynamic> get dataMap {
    return {
      'locId': _placeId,
      'isVisiting': _visitVerified,
      'conimals': _conimalIdList,
      'diseaseType': _diseaseTypeList.map((e) => e.code).toList().join(','),
      'status': _reviewRate.code,
      'diseaseList': _diseaseIdList,
      'reviewDesc': _reviewItems.map((e) => e.itemCode).toList().join(','),
      // 'reviewItems': _reviewItems.map((e) => e.itemCode).toList().join(','),
    };
  }
}
