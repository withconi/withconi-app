import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';

import '../abstract_request/request_dto_abstract.dart';

class GetReviewHistoryRequestDTO
    extends RequestConverter<GetReviewHistoryRequestDTO, String>
    implements RequestDTO {
  final String _placeId;
  final bool _onlyPhotoReview;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.MAP_GET_REVIEW_HISTORY;

  GetReviewHistoryRequestDTO.fromData(
      {required String placeId, required bool onlyPhotoReview})
      : _placeId = placeId,
        _onlyPhotoReview = onlyPhotoReview,
        super.fromData(placeId);

  @override
  Map<String, dynamic> get dataMap =>
      {'locId': _placeId, 'onlyPhotoReview': _onlyPhotoReview};
}
