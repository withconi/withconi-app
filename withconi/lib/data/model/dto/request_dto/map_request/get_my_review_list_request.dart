import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../../../../../core/tools/helpers/infinite_scroll.dart';
import '../abstract_request/request_dto_abstract.dart';

class GetMyReviewListRequestDTO
    extends RequestConverter<GetMyReviewListRequestDTO, PaginationFilter>
    implements RequestDTO {
  final PaginationFilter paginationFilter;
  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.MAP_GET_MY_REVIEW_LIST;

  GetMyReviewListRequestDTO.fromData(this.paginationFilter)
      : super.fromData(paginationFilter);

  @override
  Map<String, dynamic> get dataMap =>
      {'page': paginationFilter.page, 'listSize': paginationFilter.listSize};
}
