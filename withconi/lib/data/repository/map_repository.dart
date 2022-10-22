import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/ui_helper/infinite_scroll.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/abstract_class/place_preview.dart';
import 'package:withconi/data/model/place_detail.dart';
import 'package:withconi/data/model/request_model/request_model.dart';
import 'package:withconi/data/model/response_model/response_model.dart';
import 'package:withconi/data/provider/map_api.dart';
import 'package:withconi/data/provider/user_api.dart';
import 'package:withconi/ui/entities/location.dart';
import 'package:withconi/ui/entities/place_verfication.dart';
import 'package:withconi/ui/entities/review_rate_entity.dart';
import '../../configs/constants/enum.dart';
import '../../core/error_handling/failures.dart';
import '../model/conimal.dart';
import '../../ui/entities/review_entity.dart';
import '../model/hospital_preview.dart';
import '../model/pharmacy_preview.dart';
import '../model/review.dart';
import '../model/user.dart';

class MapRepository {
  MapRepository._internal();
  static final _singleton = MapRepository._internal();
  factory MapRepository() => _singleton;

  final MapAPI _api = MapAPI();

  Future<Either<Failure, PlacePreviewResponse>> getPlacePreviewList({
    required PaginationFilter paginationFilter,
    required LatLngClass baseLatLng,
    String? keyword,
    PlaceType? locType,
    OpeningStatus? openingStatus,
    DiseaseType? diseaseType,
    Species? conimalType,
    required int distance,
  }) async {
    try {
      MapFilterRequest mapFilterRequest = MapFilterRequest(
          paginationFilter: paginationFilter,
          latLng: baseLatLng,
          locType: locType,
          keyword: keyword,
          openingStatus: openingStatus,
          speciesType: conimalType,
          diseaseType: diseaseType,
          distance: distance);
      Map<String, dynamic> data = await _api.getPlacePreviewListByFilter(
          requestData: mapFilterRequest.toJson(), requiresToken: true);

      try {
        PlacePreviewResponse placeResponse =
            PlacePreviewResponse.fromJson(data, baseLatLng);
        return Right(placeResponse);
      } catch (e) {
        throw DataParsingException();
      }
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, PlaceDetail>> getPlaceDetailById({
    required String locId,
    required String userId,
  }) async {
    try {
      Map<String, dynamic> data =
          await _api.getPlaceDetailById(locId: locId, requiresToken: true);

      try {
        PlaceDetail placeDetail = PlaceDetail.fromJson(data);
        return Right(placeDetail);
      } catch (e) {
        throw DataParsingException();
      }
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, PlacePreview>> getPlacePreviewById({
    required String locId,
    required String userId,
  }) async {
    try {
      Map<String, dynamic> data =
          await _api.getPlaceDetailById(locId: locId, requiresToken: true);

      try {
        late PlacePreview placePreview;
        if (data['locType'] == 'hospital') {
          placePreview = HospitalPreview.fromJson(data, null);
        } else if (data['locType'] == 'pharmacy') {
          placePreview = PharmacyPreview.fromJson(data, null);
        }
        return Right(placePreview);
      } catch (e) {
        throw DataParsingException();
      }
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, TotalReviewDataResponse>> getTotalReviewData({
    required String locId,
    required bool onlyVerfiedReview,
  }) async {
    try {
      Map<String, dynamic> data = await _api.getPlaceReviews(
          locId: locId, onlyVerified: onlyVerfiedReview, requiresToken: true);

      try {
        TotalReviewDataResponse reviewResponse =
            TotalReviewDataResponse.fromJson(data);

        return Right(reviewResponse);
      } catch (e) {
        throw DataParsingException();
      }
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, VerificationGroup>> getPlaceVerification({
    required String locId,
    required PlaceType placeType,
  }) async {
    try {
      Map<String, dynamic> data = await _api.getVerification(
          locId: locId,
          placeType: placeTypeToValue(placeType),
          requiresToken: true);

      try {
        VerificationGroup placeVerification = VerificationGroup.fromJson(data);
        return Right(placeVerification);
      } catch (e) {
        throw DataParsingException();
      }
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, PlaceReviewListResponse>> getMyReviewList({
    required PaginationFilter paginationFilter,
  }) async {
    try {
      Map<String, dynamic> data = await _api.getMyReviewList(requestData: {
        "page": paginationFilter.page,
        "listSize": paginationFilter.limit
      }, requiresToken: true);

      try {
        PlaceReviewListResponse placeReviewResponse =
            PlaceReviewListResponse.fromJson(data);
        return Right(placeReviewResponse);
      } catch (e) {
        throw DataParsingException();
      }
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, Review>> getReviewDetail(
      {required String reviewId, required String userId}) async {
    try {
      Map<String, dynamic> data = await _api.getReviewDetail(
          requestData: {"reviewId": reviewId, "userId": userId});

      try {
        Review placeReview = Review.fromJson(data);
        return Right(placeReview);
      } catch (e) {
        throw DataParsingException();
      }
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, String>> createPlaceReview(
      {required String userId,
      required PlacePreview place,
      required List<Conimal> conimals,
      required List<DiseaseType> diseaseTypes,
      required ReviewEntity reviewEntity}) async {
    try {
      Review placeReview = Review(
        userId: userId,
        placeId: place.locId,
        visitVerified: place.visitVerified,
        conimals: conimals,
        diseaseTypes: diseaseTypes,
        reviewEntity: reviewEntity,
        placeType: place.placeType,
        name: place.name,
        address: place.name,
      );
      try {
        await _api.createPlaceReview(
            requestData: placeReview.toJson(), requiresToken: true);
        return Right('');
      } catch (e) {
        throw DataParsingException();
      }
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, String>> updateBookmark(
      {required String placeId, required bool isBookmarked}) async {
    try {
      Map<String, dynamic> updateResult = await _api.updatePlaceBookmark(
          requiresToken: true,
          requestData: {"placeId": placeId, "isBookmarked": isBookmarked});

      // List<String> likedPostIdList =
      //     (likePostsData['likePosts'] as List<dynamic>)
      //         .map((e) => e as String)
      //         .toList();

      // print("Liked Post Number => ${likedPostIdList.length}");
      return Right('');
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }
}
