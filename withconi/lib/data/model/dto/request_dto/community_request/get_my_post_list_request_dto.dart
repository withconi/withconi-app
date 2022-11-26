import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/core/tools/helpers/infinite_scroll.dart';
import '../abstract_request/request_dto_abstract.dart';
import '../abstract_request/request_info_abstract.dart';

class GetMyPostListRequestDTO
    extends RequestConverter<GetMyPostListRequestDTO, PaginationFilter>
    implements RequestDTO {
  PaginationFilter paginationFilter;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.COMMUNITY_GET_MY_POST_LIST;

  GetMyPostListRequestDTO.fromData({required this.paginationFilter})
      : super.fromData(paginationFilter);

  @override
  Map<String, dynamic> get dataMap => {
        "page": paginationFilter.page,
        "listSize": paginationFilter.listSize,
        // "userId": userId,
      };
}
