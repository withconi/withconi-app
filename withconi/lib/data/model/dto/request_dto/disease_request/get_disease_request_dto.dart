import 'package:dartz/dartz.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';

import '../../../../../core/tools/helpers/infinite_scroll.dart';
import '../abstract_request/request_dto_abstract.dart';
import '../abstract_request/request_info_abstract.dart';

class GetDiseaseListRequestDTO extends RequestConverter<
    GetDiseaseListRequestDTO,
    Tuple2<PaginationFilter, String?>> implements RequestDTO {
  PaginationFilter paginationFilter;
  String? keyword;

  @override
  String get url => HttpUrl.DISEASE_LIST_GET;

  @override
  Map<String, dynamic> get dataMap => {
        "page": paginationFilter.page,
        "listSize": paginationFilter.listSize,
        "keyword": keyword
      };

  @override
  RequestType get requestType => RequestType.GET;

  @override
  bool get requiresToken => false;

  GetDiseaseListRequestDTO.fromData(
      {required this.paginationFilter, required this.keyword})
      : super.fromData(Tuple2(paginationFilter, keyword));

  // @override
  // factory GetPostListRequestDTO.fromData(PostListFilterUIModel data) {
  //   final postlist = GetPostListRequestDTO._(
  //       paginationFilter: data.paginationFilter,
  //       boardId: data.boardId,
  //       postType: data.postType,
  //       keyword: data.keyword);
  //   return postlist;
  // }

}
