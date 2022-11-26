import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';

import '../abstract_request/request_dto_abstract.dart';

class GetReviewHistoryRequestDTO
    extends RequestConverter<GetReviewHistoryRequestDTO, String>
    implements RequestDTO {
  final String _placeId;
  final bool _onlyVerified;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.MAP_GET_REVIEW_HISTORY;

  GetReviewHistoryRequestDTO.fromData(
      {required String placeId, required bool onlyVerified})
      : _placeId = placeId,
        _onlyVerified = onlyVerified,
        super.fromData(placeId);

  @override
  Map<String, dynamic> get dataMap =>
      {'locId': _placeId, 'onlyVerified': _onlyVerified};
}
