import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';

class GetPlaceDetailRequestDTO
    extends RequestConverter<GetPlaceDetailRequestDTO, String>
    implements RequestDTO {
  final String _placeId;
  final PlaceType _placeType;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.MAP_GET_LOCATION_DETAIL;

  GetPlaceDetailRequestDTO.fromData(
      {required String placeId, required PlaceType placeType})
      : _placeId = placeId,
        _placeType = placeType,
        super.fromData(placeId);

  @override
  Map<String, dynamic> get dataMap =>
      {'locId': _placeId, 'locType': _placeType.code};
}
