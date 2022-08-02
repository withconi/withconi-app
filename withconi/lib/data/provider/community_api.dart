import 'package:withconi/controller/auth_controller.dart';
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
        "postType": postType,
      },
      body: null,
      requestType: RequestType.GET,
    );
    return postsData;
  }

  Future<Map<String, dynamic>> getMyPosts({
    required PaginationFilter paginationFilter,
    required String userId,
  }) async {
    Map<String, dynamic> postsData = await _dio.apiCall(
      url: HttpUrl.POST_MY_GET,
      queryParameters: {
        "page": paginationFilter.page,
        "listSize": paginationFilter.limit,
        "userId": userId,
      },
      body: null,
      requestType: RequestType.GET,
    );
    return postsData;
  }

  Future<Map<String, dynamic>> getLikedPosts({required String uid}) async {
    Map<String, dynamic> postsData = await _dio.apiCall(
      url: HttpUrl.POST_LIKED_GET,
      queryParameters: {"userId": uid},
      body: null,
      requestType: RequestType.GET,
    );
    return postsData;
  }

  Future<Map<String, dynamic>> updateLikePost(
      {required String uid,
      required String postId,
      required bool isLiked}) async {
    Map<String, dynamic> likedPostList = await _dio.apiCall(
      url: HttpUrl.POST_LIKED_UPDATE,
      queryParameters: null,
      body: {"userId": uid, "postId": postId, "isLike": isLiked},
      requestType: RequestType.POST,
    );
    return likedPostList;
  }

  Future<Map<String, dynamic>> searchPosts(
      {required PaginationFilter paginationFilter,
      required String keyword,
      String? postType,
      String? searchType}) async {
    Map<String, dynamic> postsData = await _dio.apiCall(
      url: HttpUrl.POST_GET,
      queryParameters: {
        "page": paginationFilter.page,
        "listSize": paginationFilter.limit,
        "postType": postType,
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
