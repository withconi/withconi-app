import 'dart:html';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/api_dto/api_call_dto.dart';
import 'package:withconi/module/ui_model/ui_model_abstract/ui_model.dart';
import '../../../../../core/tools/helpers/infinite_scroll.dart';
import '../../../../../module/ui_model/post_list_filter_ui_model.dart';
import '../../../../enums/enum.dart';
import '../abstract_request/request_dto_abstract.dart';
import '../abstract_request/request_info_abstract.dart';

class GetPostListRequestDTO
    extends RequestConverter<GetPostListRequestDTO, PostListFilterUIModel>
    implements RequestDTO {
  PaginationFilter paginationFilter;
  String boardId;
  PostType postType;
  String? keyword;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.GET;

  @override
  String get url => HttpUrl.COMMUNITY_GET_POST_LIST;

  // GetPostListRequestDTO.fromData(PostListFilterUIModel data)
  //     : paginationFilter = data.paginationFilter,
  //       boardId = data.boardId,
  //       postType = data.postType,
  //       keyword = data.keyword,
  //       super.fromData(data);

  GetPostListRequestDTO.fromData(PostListFilterUIModel data)
      : paginationFilter = data.paginationFilter,
        boardId = data.boardId,
        postType = data.postType,
        keyword = data.keyword,
        super.fromData(data);

  // @override
  // factory GetPostListRequestDTO.fromData(PostListFilterUIModel data) {
  //   final postlist = GetPostListRequestDTO._(
  //       paginationFilter: data.paginationFilter,
  //       boardId: data.boardId,
  //       postType: data.postType,
  //       keyword: data.keyword);
  //   return postlist;
  // }

  @override
  Map<String, dynamic> get dataMap => {
        "page": paginationFilter.page,
        "listSize": paginationFilter.limit,
        "boardId": boardId,
        "postType": postType.code,
        "keyword": keyword
      };
}
