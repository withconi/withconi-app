import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/create_comment_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/create_post_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/delete_post_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/update_my_post_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/get_comment_list_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/get_liked_post_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/get_my_post_list_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/update_comment_like_request_dto.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import '../../model/dto/request_dto/community_request/create_report_request_dto.dart';
import '../../model/dto/request_dto/community_request/get_board_list_request_dto.dart';
import '../../model/dto/request_dto/community_request/get_post_detail_request_dto.dart';
import '../../model/dto/request_dto/community_request/get_post_list_request_dto.dart';
import '../../model/dto/request_dto/community_request/update_post_like_request_dto.dart';

class CommunityAPI extends GetxService {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getBoards(
      GetBoardListRequestDTO requestDto) async {
    ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDto);
    Map<String, dynamic> boardsData = await _dio.apiCall(apiCallDTO);
    return boardsData;
  }

  Future<Map<String, dynamic>> getPostList(
      GetPostListRequestDTO requestDto) async {
    ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDto);
    Map<String, dynamic> postsData = await _dio.apiCall(apiCallDTO);
    return postsData;
  }

  Future<Map<String, dynamic>> getPost(
      GetPostDetailRequestDTO requestDto) async {
    ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDto);

    Map<String, dynamic> postData = await _dio.apiCall(apiCallDTO);
    return postData;
  }

  Future<Map<String, dynamic>> deletePost(
      DeletePostRequestDTO requestDto) async {
    ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDto);

    Map<String, dynamic> postData = await _dio.apiCall(apiCallDTO);
    return postData;
  }

  Future<Map<String, dynamic>> createReport(
      CreateRepostRequestDTO requestDto) async {
    ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDto);
    Map<String, dynamic> postData = await _dio.apiCall(apiCallDTO);
    return postData;
  }

  Future<Map<String, dynamic>> getMyPosts(
      GetMyPostListRequestDTO requestDto) async {
    ApiCallDTO apiCallDto = ApiCallDTO.fromDTO(requestDto);
    Map<String, dynamic> postsData = await _dio.apiCall(apiCallDto);
    return postsData;
  }

  Future<Map<String, dynamic>> getCommentList(
      GetCommentListRequestDTO requestDto) async {
    ApiCallDTO apiCallDto = ApiCallDTO.fromDTO(requestDto);
    Map<String, dynamic> commentsData = await _dio.apiCall(apiCallDto);

    return commentsData;
  }

  Future<Map<String, dynamic>> getLikedPosts(
      GetLikedPostListRequestDTO requestDto) async {
    ApiCallDTO apiCallDto = ApiCallDTO.fromDTO(requestDto);
    Map<String, dynamic> postsData = await _dio.apiCall(apiCallDto);
    return postsData;
  }

  Future<Map<String, dynamic>> updateLikePost(
      UpdatePostLikeRequestDTO requestDto) async {
    ApiCallDTO apiCallDto = ApiCallDTO.fromDTO(requestDto);
    Map<String, dynamic> likedPostList = await _dio.apiCall(apiCallDto);
    return likedPostList;
  }

  Future<Map<String, dynamic>> updateLikeComment(
    UpdateCommentLikeRequestDTO requestDto,
  ) async {
    ApiCallDTO apiCallDto = ApiCallDTO.fromDTO(requestDto);
    Map<String, dynamic> likeCommentListData = await _dio.apiCall(apiCallDto);
    return likeCommentListData;
  }

  Future<Map<String, dynamic>> searchPostList(
      GetPostListRequestDTO requestDto) async {
    ApiCallDTO apiCallDto = ApiCallDTO.fromDTO(requestDto);
    Map<String, dynamic> postsData = await _dio.apiCall(apiCallDto);
    return postsData;
  }

  Future<Map<String, dynamic>> newPost(CreatePostRequestDTO requestDto) async {
    ApiCallDTO apiCallDto = ApiCallDTO.fromDTO(requestDto);
    Map<String, dynamic> postedData = await _dio.apiCall(apiCallDto);
    return postedData;
  }

  Future<Map<String, dynamic>> updateMyPost(
      UpdateMyPostRequestDTO requestDto) async {
    ApiCallDTO apiCallDto = ApiCallDTO.fromDTO(requestDto);
    Map<String, dynamic> postedData = await _dio.apiCall(apiCallDto);
    return postedData;
  }

  Future<Map<String, dynamic>> newComment(
      CreateCommentRequestDTO requestDTO) async {
    ApiCallDTO apiCallDto = ApiCallDTO.fromDTO(requestDTO);
    Map<String, dynamic> commentData = await _dio.apiCall(apiCallDto);
    return commentData;
  }
}
