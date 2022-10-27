import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/data/model/abstract_class/place_preview.dart';
import 'package:withconi/data/model/comment.dart';
import 'package:withconi/data/model/hospital_preview.dart';
import 'package:withconi/data/model/pharmacy_preview.dart';
import 'package:withconi/ui/entities/location.dart';
import 'package:withconi/ui/entities/review_rate_entity.dart';
import '../board.dart';
import '../conimal.dart';
import '../disease.dart';
import '../post.dart';
import '../../../core/error_handling/exceptions.dart';
import '../../../ui/entities/review_entity.dart';
import '../review.dart';

class UserStateResponse {
  bool? isUserInAuth;
  bool? isUserInDB;
  UserStateResponse.fromJson(Map<String, dynamic> json) {
    isUserInAuth = json['inAuth'];
    isUserInDB = json['inDB'];
  }
}

class ConimalResponse {
  int totalResults;
  List<Conimal> results;

  ConimalResponse({required this.totalResults, required this.results});

  factory ConimalResponse.fromJson(Map<String, dynamic> json) {
    try {
      List<Conimal> list = [];
      int totalDocuments = json['totalDocuments'];
      if (json['list'] != null) {
        list = json['list']
            .map<Conimal>((json) => Conimal.fromJson(json))
            .toList();
      }
      return ConimalResponse(
        totalResults: totalDocuments,
        results: list,
      );
    } catch (e) {
      throw DataParsingException();
    }
  }
}

class DiseaseResponse {
  DiseaseResponse({required this.totalResults, required this.list});

  int totalResults;
  List<Disease> list;

  factory DiseaseResponse.fromJson(Map<String, dynamic> json) {
    List<Disease> list = [];

    try {
      int totalDocuments = json['totalDocuments'];
      if (json['list'] != null) {
        list = json['list']
            .map<Disease>((json) => Disease.fromJson(json))
            .toList();
      }
      return DiseaseResponse(
        totalResults: totalDocuments,
        list: list,
      );
    } catch (e) {
      throw DataParsingException();
    }
  }
}

class PostResponse {
  PostResponse({required this.totalResults, required this.results});

  int totalResults;
  List<Post> results;

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    List<Post> list = [];

    try {
      int totalDocuments = json['totalDocuments'];
      if (json['list'] != null) {
        list = json['list'].map<Post>((json) => Post.fromJson(json)).toList();
      }
      return PostResponse(
        totalResults: totalDocuments,
        results: list,
      );
    } catch (e) {
      throw DataParsingException();
    }
  }
}

class CommentResponse {
  CommentResponse({required this.totalResults, required this.list});

  int totalResults;
  List<Comment> list;

  factory CommentResponse.fromJson(Map<String, dynamic> json) {
    List<Comment> list = [];

    try {
      int totalDocuments = json['totalDocuments'];
      if (json['list'] != null) {
        list = json['list']
            .map<Comment>((json) => Comment.fromJson(json))
            .toList();
      }
      return CommentResponse(
        totalResults: totalDocuments,
        list: list,
      );
    } catch (e) {
      throw DataParsingException();
    }
  }
}

class BoardResponse {
  BoardResponse({required this.totalResults, required this.results});

  int totalResults;
  List<Board> results;

  factory BoardResponse.fromJson(Map<String, dynamic> json) {
    List<Board> list = [];

    try {
      int totalDocuments = json['totalDocuments'];
      if (json['list'] != null) {
        list = json['list'].map<Board>((json) => Board.fromJson(json)).toList();
      }
      return BoardResponse(
        totalResults: totalDocuments,
        results: list,
      );
    } catch (e) {
      throw DataParsingException();
    }
  }
}

class PlaceReviewListResponse {
  PlaceReviewListResponse({required this.totalResults, required this.list});

  int totalResults;
  List<Review> list;

  factory PlaceReviewListResponse.fromJson(Map<String, dynamic> json) {
    List<Review> list = [];

    try {
      int totalDocuments = json['totalDocuments'];
      if (json['list'] != null) {
        list =
            json['list'].map<Review>((json) => Review.fromJson(json)).toList();
      }
      return PlaceReviewListResponse(
        totalResults: totalDocuments,
        list: list,
      );
    } catch (e) {
      throw DataParsingException();
    }
  }
}
