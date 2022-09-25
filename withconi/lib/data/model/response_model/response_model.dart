import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/data/model/abstract_class/place_type.dart';
import 'package:withconi/data/model/hospital_preview.dart';
import 'package:withconi/data/model/pharmacy_preview.dart';
import 'package:withconi/ui/entities/location.dart';
import 'package:withconi/ui/entities/review_entity.dart';
import '../board.dart';
import '../conimal.dart';
import '../disease.dart';
import '../post.dart';
import '../../../core/error_handling/exceptions.dart';
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

class PlacePreviewResponse {
  List<PlacePreview> placeList;
  int totalDocuments = 0;

  PlacePreviewResponse({required this.placeList, required this.totalDocuments});

  factory PlacePreviewResponse.fromJson(
      Map<String, dynamic> json, LatLngClass baseLatLng) {
    List<PlacePreview> list = [];
    int totalDocs = 0;
    totalDocs = json['totalSearchDocuments'];
    if (json['list'] != null) {
      list = <PlacePreview>[];
      json['list'].forEach((v) {
        if (v['locType'] == 'hospital') {
          list.add(new HospitalPreview.fromJson(v, baseLatLng));
        } else if (v['locType'] == 'pharmacy') {
          list.add(new PharmacyPreview.fromJson(v, baseLatLng));
        }
      });
    }

    if (json['list'] != null) {
      list = <PlacePreview>[];
      json['list'].forEach((v) {
        list.add(new HospitalPreview.fromJson(v, baseLatLng));
      });
    }

    return PlacePreviewResponse(placeList: list, totalDocuments: totalDocs);
  }
}

class ReviewResponse {
  List<ReviewRateEntity> reviewList;
  int totalReview = 0;

  ReviewResponse({required this.reviewList, required this.totalReview});

  factory ReviewResponse.fromJson(Map<String, dynamic> json) {
    List<ReviewRateEntity> list = [
      HighReviewEntity(),
      MiddleReviewEntity(),
      LowReviewEntity()
    ];
    int totalNum = 0;

    ReviewRate.values.forEach(
      (reviewRate) {
        Map<ReviewItems, int> itemMap = {};
        for (ReviewItems reviewItem in ReviewItems.values) {
          itemMap[reviewItem] = json[reviewRateToValue(reviewRate)]
              [reviewItemsToValue(reviewItem)] as int;
        }
        switch (reviewRate) {
          case ReviewRate.high:
            list[0].reviewItems = itemMap;
            list[0].reviewNum = json['high']['totalReivews'] as int;

            break;
          case ReviewRate.middle:
            list[1].reviewItems = itemMap;
            list[1].reviewNum = json['middle']['totalReivews'] as int;
            break;
          case ReviewRate.low:
            list[2].reviewItems = itemMap;
            list[2].reviewNum = json['low']['totalReivews'] as int;
            break;
          default:
        }
      },
    );

    // ReviewRate.values.forEach((reviewRate) {
    // Review review =
    //       Review.fromJson(json[reviewRateToValue(reviewRate)], reviewRate);
    //   if (reviewRate == ReviewRate.high) {
    //     list.insert(0, review);
    //   } else if (reviewRate == ReviewRate.middle) {
    //     list.insert(1, review);
    //   } else if (reviewRate == ReviewRate.low) {
    //     list.insert(2, review);
    //   }

    //   totalNum += review.reviewNum;
    // });

    return ReviewResponse(reviewList: list, totalReview: totalNum);
  }
}


// class PlaceDetailResponse {
//   List<PlaceDetailType> placeDetailList;

//   PlaceDetailResponse({
//     required this.placeDetailList,
//   });

//   factory PlaceDetailResponse.fromJson(Map<String, dynamic> json) {
//     List<PlaceDetailType> list = [];
//    PlaceDe

//     if (json['list'] != null) {
//       list = <PlaceDetailType>[];
//       json['list'].forEach((v) {
//         list.add(new HospitalPreview.fromJson(v));
//       });
//     }

//     return PlaceDetailResponse(placeDetailList: list);
//   }
// }
