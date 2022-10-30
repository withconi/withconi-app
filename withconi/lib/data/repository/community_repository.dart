// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:withconi/controller/ui_helper/infinite_scroll.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/data/model/request_model/request_model.dart';
import 'package:withconi/data/provider/community_api.dart';
import 'package:withconi/data/provider/disease_api.dart';
import '../enums/enum.dart';
import '../../core/error_handling/failures.dart';
import '../model/comment.dart';
import '../model/report.dart';
import '../model/response_model/response_model.dart';
import '../model/board.dart';
import '../model/post.dart';

class CommunityRepository {
  final CommunityAPI _api = CommunityAPI();

  Future<Either<Failure, List<Board>>> getBoardList() async {
    try {
      Map<String, dynamic> data = await _api.getBoards();
      List<Board> boardList = BoardResponse.fromJson(data).results;
      return Right(boardList);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<Post>>> getPostList(
      {required PaginationFilter paginationFilter,
      required String boardId,
      required PostType postType,
      // required String userId,
      String? keyword}) async {
    try {
      Map<String, dynamic> data = await _api.getPostList({
        "page": paginationFilter.page,
        "listSize": paginationFilter.limit,
        "boardId": boardId,
        "postType": postType.code,
        "keyword": keyword
      }, true);
      List<Post> postList = PostResponse.fromJson(data).results;
      return Right(postList);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, Post>> getPost({
    required String postId,
    required String boardId,
  }) async {
    try {
      Map<String, dynamic> data = await _api.getPost({
        "boardId": boardId,
        "postId": postId,
        // "userId": userId,
      }, true);
      Post post = Post.fromJson(data['boardItem']);
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

  Future<Either<Failure, bool>> deletePost(
      {required String postId, required String boardId}) async {
    try {
      Map<String, dynamic> data = await _api.deletePost(
          boardId: boardId, postId: postId, requiresToken: true);
      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> createReport(
      {required Report newReport}) async {
    try {
      Map<String, dynamic> data =
          await _api.createReport(reportJson: newReport.toJson());
      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, CommentResponse>> getCommentList({
    required String boardId,
    required String postId,
  }) async {
    try {
      Map<String, dynamic> data = await _api.getCommentList({
        "boardId": boardId,
        "postId": postId,
        // "userId": userId,
      }, true);
      CommentResponse commentResponse = CommentResponse.fromJson(data);
      return Right(commentResponse);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<Post>>> getMyPostList({
    required PaginationFilter paginationFilter,
  }) async {
    try {
      Map<String, dynamic> data = await _api.getMyPosts(
          paginationFilter: paginationFilter, requiresToken: true);
      List<Post> postList = PostResponse.fromJson(data).results;
      return Right(postList);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<Post>>> getLikedPostList() async {
    try {
      Map<String, dynamic> data = await _api.getLikedPosts(requiresToken: true);
      List<Post> postList = PostResponse.fromJson(data).results;
      return Right(postList);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<String>>> updateLikePost(
      {required String uid,
      required String postId,
      required bool isLiked}) async {
    try {
      Map<String, dynamic> likePostsData = await _api.updateLikePost(
          requiresToken: true, postId: postId, isLiked: isLiked);

      List<String> likedPostIdList =
          (likePostsData['likePosts'] as List<dynamic>)
              .map((e) => e as String)
              .toList();

      print("Liked Post Number => ${likedPostIdList.length}");
      return Right(likedPostIdList);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<String>>> updateLikeComment(
      {required String uid,
      required String postId,
      required String commentId,
      required bool isLiked}) async {
    try {
      Map<String, dynamic> likeCommentData = await _api.updateLikeComment(
          postId: postId,
          isLiked: isLiked,
          commentId: commentId,
          requiresToken: true);

      List<String> likeCommentIdList =
          (likeCommentData['likePostLineReplies'] as List<dynamic>)
              .map((e) => e as String)
              .toList();

      print("Liked Comment Number => ${likeCommentIdList.length}");
      return Right(likeCommentIdList);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, Post>> newPost({required Post newPost}) async {
    try {
      Map<String, dynamic> postJson = newPost.toJson();
      postJson.remove('postId');
      Map<String, dynamic> data =
          await _api.newPost(newPostJson: postJson, requiresToken: true);
      if (data['board'] != null) {
        Post addedPost = Post.fromJson(data['board']);
        return Right(addedPost);
      } else {
        return Left(DataParsingFailure());
      }
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> updateMyPost({required Post editPost}) async {
    try {
      Map<String, dynamic> postJson = editPost.toJson();
      //TODO 에러 확인하기 위해서 이미지 파라미터 잠시 없앰
      // postJson.remove('images');
      Map<String, dynamic> data = await _api.updateMyPost(
          updateDataJson: postJson, requiresToken: true);

      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> newComment(
      {required Comment newComment}) async {
    try {
      Map<String, dynamic> newCommentJson =
          CommentCreateRequest(comment: newComment).toJson();
      await _api.newComment(
          newCommentJson: newCommentJson, requiresToken: true);

      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }
}
