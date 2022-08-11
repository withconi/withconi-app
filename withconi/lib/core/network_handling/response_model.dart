import '../../data/model/board.dart';
import '../../data/model/conimal.dart';
import '../../data/model/disease.dart';
import '../../data/model/post.dart';
import '../error_handling/exceptions.dart';

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
  DiseaseResponse({required this.totalResults, required this.results});

  int totalResults;
  List<Disease> results;

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
        results: list,
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
