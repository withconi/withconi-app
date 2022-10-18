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

  Future<Map<String, dynamic>> getPostList(
      Map<String, dynamic> data, bool requiresToken) async {
    Map<String, dynamic> postsData = await _dio.apiCall(
      header: {"requiresToken": requiresToken},
      url: HttpUrl.COMMUNITY_GET_POST_LIST,
      queryParameters: data,
      body: null,
      requestType: RequestType.GET,
    );
    return postsData;
  }

  Future<Map<String, dynamic>> getPost(
      Map<String, dynamic> data, bool requiresToken) async {
    Map<String, dynamic> postData = await _dio.apiCall(
      header: {"requiresToken": requiresToken},
      url: HttpUrl.COMMUNITY_GET_POST,
      queryParameters: data,
      body: null,
      requestType: RequestType.GET,
    );
    return postData;
  }

  Future<Map<String, dynamic>> deletePost({
    required String boardId,
    required String postId,
    required bool requiresToken,
  }) async {
    Map<String, dynamic> postData = await _dio.apiCall(
      header: {"requiresToken": requiresToken},
      url: HttpUrl.COMMUNITY_DELETE_POST,
      queryParameters: null,
      body: {
        "boardId": boardId,
        "postId": postId,
      },
      requestType: RequestType.POST,
    );
    return postData;
  }

  Future<Map<String, dynamic>> createReport(
      {required Map<String, dynamic> reportJson}) async {
    Map<String, dynamic> postData = await _dio.apiCall(
      url: HttpUrl.COMMUNITY_CREATE_REPORT,
      queryParameters: null,
      body: reportJson,
      requestType: RequestType.POST,
    );
    return postData;
  }

  Future<Map<String, dynamic>> getMyPosts({
    required PaginationFilter paginationFilter,
    required bool requiresToken,
    // required String userId,
  }) async {
    Map<String, dynamic> postsData = await _dio.apiCall(
      header: {"requiresToken": requiresToken},
      url: HttpUrl.COMMUNITY_GET_MY_POST_LIST,
      queryParameters: {
        "page": paginationFilter.page,
        "listSize": paginationFilter.limit,
        // "userId": userId,
      },
      body: null,
      requestType: RequestType.GET,
    );
    return postsData;
  }

  Future<Map<String, dynamic>> getCommentList(
      Map<String, dynamic> data, bool requiresToken) async {
    Map<String, dynamic> commentsData = await _dio.apiCall(
      header: {"requiresToken": requiresToken},
      url: HttpUrl.COMMUNITY_COMMENT_LIST,
      queryParameters: data,
      body: null,
      requestType: RequestType.GET,
    );
    return commentsData;
  }

  Future<Map<String, dynamic>> getLikedPosts(
      {required bool requiresToken}) async {
    Map<String, dynamic> postsData = await _dio.apiCall(
      header: {"requiresToken": requiresToken},
      url: HttpUrl.COMMUNITY_GET_LIKE_POST_LIST,
      queryParameters: null,
      body: null,
      requestType: RequestType.GET,
    );
    return postsData;
  }

  Future<Map<String, dynamic>> updateLikePost(
      {required String postId,
      required bool isLiked,
      required bool requiresToken}) async {
    Map<String, dynamic> likedPostList = await _dio.apiCall(
      header: {"requiresToken": requiresToken},
      url: HttpUrl.COMMUNITY_UPDATE_POST_LIKE,
      queryParameters: null,
      body: {"postId": postId, "isLike": isLiked},
      requestType: RequestType.POST,
    );
    return likedPostList;
  }

  Future<Map<String, dynamic>> updateLikeComment({
    required String postId,
    required String commentId,
    required bool isLiked,
    required bool requiresToken,
  }) async {
    Map<String, dynamic> likeCommentListData = await _dio.apiCall(
      header: {"requiresToken": requiresToken},
      url: HttpUrl.COMMENT_LIKE_UPDATE,
      queryParameters: null,
      body: {"postId": postId, "lineReplyId": commentId, "isLike": isLiked},
      requestType: RequestType.POST,
    );
    return likeCommentListData;
  }

  Future<Map<String, dynamic>> searchPosts(
      {required PaginationFilter paginationFilter,
      required String keyword,
      String? postType,
      String? searchType}) async {
    Map<String, dynamic> postsData = await _dio.apiCall(
      url: HttpUrl.COMMUNITY_GET_POST_LIST,
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
      {required Map<String, dynamic> newPostJson,
      required bool requiresToken}) async {
    Map<String, dynamic> postedData = await _dio.apiCall(
      header: {"requiresToken": requiresToken},
      url: HttpUrl.POST_CREATE,
      queryParameters: null,
      body: newPostJson,
      requestType: RequestType.POST,
    );
    return postedData;
  }

  Future<Map<String, dynamic>> updateMyPost(
      {required Map<String, dynamic> updateDataJson,
      required bool requiresToken}) async {
    Map<String, dynamic> postedData = await _dio.apiCall(
      header: {"requiresToken": requiresToken},
      url: HttpUrl.POST_UPDATE_MY_POST,
      queryParameters: null,
      body: updateDataJson,
      requestType: RequestType.POST,
    );
    return postedData;
  }

  Future<Map<String, dynamic>> newComment(
      {required Map<String, dynamic> newCommentJson,
      required bool requiresToken}) async {
    Map<String, dynamic> commentData = await _dio.apiCall(
      header: {'requiresToken': requiresToken},
      url: HttpUrl.COMMENT_CREATE,
      queryParameters: null,
      body: newCommentJson,
      requestType: RequestType.POST,
    );
    return commentData;
  }
}
