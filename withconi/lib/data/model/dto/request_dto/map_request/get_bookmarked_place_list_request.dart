import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';

import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../../../../../core/tools/helpers/infinite_scroll.dart';

import '../abstract_request/request_dto_abstract.dart';

class GetBookmarkedPlaceListRequestDTO
    extends RequestConverter<GetBookmarkedPlaceListRequestDTO, Null>
    implements RequestDTO {
  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.PLACE_BOOKMARK_LIST;

  GetBookmarkedPlaceListRequestDTO.fromData() : super.fromData(null);

  @override
  Map<String, dynamic> get dataMap => {};
}
