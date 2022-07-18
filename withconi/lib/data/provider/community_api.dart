import 'package:withconi/controller/ui_helper/infinite_scroll.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import '../../configs/constants/api_url.dart';

class CommunityAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getPosts(
      {required PaginationFilter paginationFilter,
      required String boardId}) async {
    Map<String, dynamic> postsData = await _dio.apiCall(
      url: HttpUrl.GET_POST,
      queryParameters: {
        "page": paginationFilter.page,
        "listSize": paginationFilter.limit,
        "boardId": boardId
      },
      body: null,
      requestType: RequestType.GET,
    );
    return postsData;
  }

  Future<Map<String, dynamic>> searchPosts(
      {required PaginationFilter paginationFilter,
      required String keyword,
      String? speciesType,
      String? searchType}) async {
    Map<String, dynamic> postsData = await _dio.apiCall(
      url: HttpUrl.CREATE_CONIMAL,
      queryParameters: {
        "page": paginationFilter.page,
        "listSize": paginationFilter.limit,
        "speciesType": speciesType,
        "searchType": searchType,
      },
      body: null,
      requestType: RequestType.GET,
    );
    return postsData;
  }
}
