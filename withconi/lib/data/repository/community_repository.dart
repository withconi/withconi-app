// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:withconi/controller/ui_helper/infinite_scroll.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/data/provider/community_api.dart';
import 'package:withconi/data/provider/disease_api.dart';
import '../../configs/constants/enum.dart';
import '../../core/error_handling/failures.dart';
import '../../core/network_handling/response_model.dart';
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
      required PostType postType}) async {
    try {
      Map<String, dynamic> data = await _api.getPosts(
          paginationFilter: paginationFilter,
          boardId: boardId,
          postType: postTypeToValue(postType));
      List<Post> postList = PostResponse.fromJson(data).results;
      return Right(postList);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<Post>>> getUserPostList(
      {required PaginationFilter paginationFilter,
      required String userId}) async {
    try {
      Map<String, dynamic> data = await _api.getMyPosts(
          paginationFilter: paginationFilter, userId: userId);
      List<Post> postList = PostResponse.fromJson(data).results;
      return Right(postList);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<Post>>> getLikedPostList(
      {required String uid}) async {
    try {
      Map<String, dynamic> data = await _api.getLikedPosts(uid: uid);
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
      Map<String, dynamic> likePostsData =
          await _api.updateLikePost(uid: uid, postId: postId, isLiked: isLiked);

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

  Future<Either<Failure, Post>> newPost({required Post newPost}) async {
    try {
      Map<String, dynamic> postJson = newPost.toJson();
      postJson.remove('postId');
      Map<String, dynamic> data = await _api.newPost(newPostJson: postJson);
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
}
