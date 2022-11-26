import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';

import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../../../../../core/tools/helpers/infinite_scroll.dart';

import '../abstract_request/request_dto_abstract.dart';

class GetBookmarkedPlaceListRequestDTO
    extends RequestConverter<GetBookmarkedPlaceListRequestDTO, PaginationFilter>
    implements RequestDTO {
  final PaginationFilter _paginationFilter;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.PLACE_PREVIEW_LIST;

  GetBookmarkedPlaceListRequestDTO.fromData(this._paginationFilter)
      : super.fromData(_paginationFilter);

  @override
  Map<String, dynamic> get dataMap =>
      {'page': _paginationFilter.page, 'listSize': _paginationFilter.listSize};
}
