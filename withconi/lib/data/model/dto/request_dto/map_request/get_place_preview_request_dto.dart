import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';

import '../abstract_request/request_dto_abstract.dart';

class GetPlacePreviewRequestDTO
    extends RequestConverter<GetPlacePreviewRequestDTO, String>
    implements RequestDTO {
  final String _placeId;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.MAP_GET_LOCATION_DETAIL;

  GetPlacePreviewRequestDTO.fromData({required String placeId})
      : _placeId = placeId,
        super.fromData(placeId);

  @override
  Map<String, dynamic> get dataMap => {'locId': _placeId};
}
