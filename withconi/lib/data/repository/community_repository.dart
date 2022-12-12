// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:withconi/core/tools/helpers/infinite_scroll.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/block_comment_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/block_post_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/create_post_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/create_comment_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/create_report_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/delete_comment_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/delete_post_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/get_board_list_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/get_comment_list_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/get_hot_post_list_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/get_liked_post_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/get_my_post_list_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/get_post_detail_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/get_post_list_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/update_comment_like_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/update_my_post_request_dto.dart';
import 'package:withconi/data/provider/remote_provider/community_api.dart';
import 'package:withconi/module/ui_model/comment_ui_model.dart';
import 'package:withconi/module/ui_model/new_post_ui_model.dart';
import 'package:withconi/module/ui_model/post_list_filter_ui_model.dart';
import 'package:withconi/module/ui_model/post_ui_model.dart';
import '../../module/ui_model/board_ui_model.dart';
import '../../module/ui_model/edit_post_ui_model.dart';
import '../../module/ui_model/report_ui_model.dart';
import '../../core/error_handling/failures.dart';
import '../model/dto/request_dto/community_request/update_post_like_request_dto.dart';
import '../model/dto/response_dto/community_response/board_list_response_dto.dart';
import '../model/dto/response_dto/community_response/board_response_dto.dart';
import '../model/dto/response_dto/community_response/comment_list_response_dto.dart';
import '../model/dto/response_dto/community_response/comment_response_dto.dart';
import '../model/dto/response_dto/community_response/post_list_response_dto.dart';
import '../model/dto/response_dto/community_response/post_response_dto.dart';

class CommunityRepository extends GetxService {
  CommunityRepository(this._api);
  final CommunityAPI _api;

  final RxList<BoardUIModel> boardList = RxList<BoardUIModel>();

  Future<Either<Failure, List<BoardResponseDTO>>> getBoardList() async {
    try {
      GetBoardListRequestDTO requestDTO = GetBoardListRequestDTO.fromData();
      Map<String, dynamic> data = await _api.getBoards(requestDTO);
      List<BoardResponseDTO> newBoardList =
          BoardListResponseDTO.fromJson(data).list;
      boardList
          .assignAll(newBoardList.map((e) => BoardUIModel.fromDto(e)).toList());
      boardList.refresh();
      return Right(newBoardList.toList());
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<PostResponseDTO>>> getHotPostList(
      int listSize) async {
    try {
      GetHotPostListRequestDTO requestDTO =
          GetHotPostListRequestDTO.fromData(listSize: listSize);
      Map<String, dynamic> data = await _api.getHotPostList(requestDTO);
      List<PostResponseDTO> hotPostList =
          PostListResponseDTO.fromJson(data).list;
      return Right(hotPostList);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

// TODO : isolate 구현한 것 되는지 테스트해보기
  Future<Either<Failure, List<PostResponseDTO>>> getPostList(
      {required PostListFilterUIModel postListFilterUiModel,
      required PaginationFilter paginationFilter,
      required String boardId}) async {
    try {
      GetPostListRequestDTO requestDTO = GetPostListRequestDTO.fromData(
          postListFilterUiModel, paginationFilter, boardId);
      Map<String, dynamic> data = await _api.getPostList(requestDTO);

      List<PostResponseDTO> postList = PostListResponseDTO.fromJson(data).list;
      return Right(postList);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, PostResponseDTO>> getPost({
    required String postId,
    required String boardId,
  }) async {
    try {
      GetPostDetailRequestDTO requestDTO =
          GetPostDetailRequestDTO.fromData(boardId: boardId, postId: postId);
      Map<String, dynamic> data = await _api.getPost(requestDTO);
      PostResponseDTO post = PostResponseDTO.fromJson(data);
      return Right(post);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } on NotFoundException {
      return Left(NotFoundPostFailure());
    } catch (e) {
      return Left(Failure.userInfoUpdateFailure());
    }
  }

  Future<Either<Failure, bool>> blockUserPost(
      {required String authorId}) async {
    try {
      BlockPostRequestDTO requestDTO =
          BlockPostRequestDTO.fromData(authorId: authorId);
      Map<String, dynamic> data = await _api.blockPost(requestDTO);

      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> blockUserComment(
      {required String authorId}) async {
    try {
      BlockCommentRequestDTO requestDTO =
          BlockCommentRequestDTO.fromData(authorId: authorId);
      Map<String, dynamic> data = await _api.blockComment(requestDTO);

      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> deletePost({
    required String boardId,
    required String postId,
  }) async {
    try {
      DeletePostRequestDTO requestDTO =
          DeletePostRequestDTO.fromData(boardId: boardId, postId: postId);
      Map<String, dynamic> data = await _api.deletePost(requestDTO);

      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> deleteComment({
    required String boardId,
    required String postId,
    required String commentId,
  }) async {
    try {
      DeleteCommentRequestDTO requestDTO = DeleteCommentRequestDTO.fromData(
          boardId: boardId, postId: postId, commentId: commentId);
      Map<String, dynamic> data = await _api.deleteComment(requestDTO);

      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> createReport(
      {required ReportUIModel reportUiModel}) async {
    try {
      CreateReportRequestDTO requestDTO =
          CreateReportRequestDTO.fromData(reportUiModel);

      Map<String, dynamic> data = await _api.createReport(requestDTO);
      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<CommentResponseDTO>>> getCommentList({
    required String boardId,
    required String postId,
  }) async {
    try {
      GetCommentListRequestDTO requestDTO =
          GetCommentListRequestDTO.fromData(boardId: boardId, postId: postId);
      Map<String, dynamic> data = await _api.getCommentList(requestDTO);
      List<CommentResponseDTO> commentResponse =
          CommentListResponseDTO.fromJson(data).list;
      return Right(commentResponse);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<PostResponseDTO>>> getMyPostList({
    required PaginationFilter paginationFilter,
  }) async {
    try {
      GetMyPostListRequestDTO requestDTO =
          GetMyPostListRequestDTO.fromData(paginationFilter: paginationFilter);
      Map<String, dynamic> data = await _api.getMyPosts(requestDTO);
      List<PostResponseDTO> postList = PostListResponseDTO.fromJson(data).list;
      return Right(postList);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<PostResponseDTO>>> getLikedPostList() async {
    try {
      GetLikedPostListRequestDTO requestDTO =
          GetLikedPostListRequestDTO.fromData();
      Map<String, dynamic> data = await _api.getLikedPosts(requestDTO);
      List<PostResponseDTO> postList = PostListResponseDTO.fromJson(data).list;
      return Right(postList);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> updateLikePost(
      {required String postId, required bool isLiked}) async {
    try {
      UpdatePostLikeRequestDTO requestDTO =
          UpdatePostLikeRequestDTO.fromData(postId: postId, isLike: isLiked);
      Map<String, dynamic> likePostsData =
          await _api.updateLikePost(requestDTO);

      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    }
  }

  Future<Either<Failure, bool>> updateLikeComment(
      {required String postId,
      required String commentId,
      required bool isLiked}) async {
    try {
      UpdateCommentLikeRequestDTO requestDTO =
          UpdateCommentLikeRequestDTO.fromData(
              postId: postId, commentId: commentId, isLike: isLiked);
      Map<String, dynamic> likeCommentData =
          await _api.updateLikeComment(requestDTO);

      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, PostResponseDTO>> newPost(
      {required NewPostUIModel newPost,
      required String boardId,
      required List<String> imageRefList}) async {
    try {
      CreatePostRequestDTO requestDTO =
          CreatePostRequestDTO.fromData(newPost, boardId, imageRefList);
      Map<String, dynamic> data = await _api.newPost(requestDTO);

      PostResponseDTO addedPost = PostResponseDTO.fromJson(data);
      return Right(addedPost);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } catch (e) {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> updateMyPost(
      {required PostUIModel editPost,
      required List<String> imageRefList}) async {
    try {
      UpdateMyPostRequestDTO requestDTO = UpdateMyPostRequestDTO.fromData(
          data: editPost, imageRefList: imageRefList);
      // Map<String, dynamic> postJson = editPost.toJson();
      //TODO 에러 확인하기 위해서 이미지 파라미터 잠시 없앰
      // postJson.remove('images');
      Map<String, dynamic> data = await _api.updateMyPost(requestDTO);

      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, CommentResponseDTO>> newComment(
      {required CommentUIModel newComment}) async {
    try {
      CreateCommentRequestDTO requestDTO =
          CreateCommentRequestDTO.fromData(data: newComment);
      // Map<String, dynamic> newCommentJson =
      //     CreateCommentRequestDTO(comment: newComment.toDTO()).toJson();
      Map<String, dynamic> commentResultData =
          await _api.newComment(requestDTO);

      CommentResponseDTO responseDTO =
          CommentResponseDTO.fromJson(commentResultData);

      return Right(responseDTO);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }
}
