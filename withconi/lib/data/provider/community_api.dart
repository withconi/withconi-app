import 'package:withconi/controller/ui_helper/infinite_scroll.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import '../../configs/constants/api_url.dart';
import '../model/post.dart';

class CommunityAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getBoards() async {
    Map<String, dynamic> boardsData = await _dio.apiCall(
      url: HttpUrl.BOARD_GET,
      queryParameters: null,
      body: null,
      requestType: RequestType.GET,
    );
    return boardsData;
  }

  Future<Map<String, dynamic>> getPosts({
    required PaginationFilter paginationFilter,
    required String boardId,
    required String postType,
  }) async {
    Map<String, dynamic> postsData = await _dio.apiCall(
      url: HttpUrl.POST_GET,
      queryParameters: {
        "page": paginationFilter.page,
        "listSize": paginationFilter.limit,
        "boardId": boardId,
        "speciesType": postType,
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
      url: HttpUrl.CONIMAL_CREATE,
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

  Future<Map<String, dynamic>> newPost(
      {required Map<String, dynamic> newPostJson}) async {
    Map<String, dynamic> postedData = await _dio.apiCall(
      url: HttpUrl.POST_CREATE,
      queryParameters: null,
      body: newPostJson,
      requestType: RequestType.POST,
    );
    return postedData;
  }
}
