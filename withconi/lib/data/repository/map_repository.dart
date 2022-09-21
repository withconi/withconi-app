import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/ui_helper/infinite_scroll.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/abstract_class/place_type.dart';
import 'package:withconi/data/model/hospital_detail.dart';
import 'package:withconi/data/model/request_model/request_model.dart';
import 'package:withconi/data/model/response_model/response_model.dart';
import 'package:withconi/data/provider/map_api.dart';
import 'package:withconi/data/provider/user_api.dart';
import 'package:withconi/ui/entities/location.dart';
import 'package:withconi/ui/entities/place_verfication.dart';
import 'package:withconi/ui/entities/review_entity.dart';
import '../../configs/constants/enum.dart';
import '../../core/error_handling/failures.dart';
import '../model/conimal.dart';
import '../model/user.dart';

class MapRepository {
  MapRepository._internal();
  static final _singleton = MapRepository._internal();
  factory MapRepository() => _singleton;

  final MapAPI _api = MapAPI();

  Future<Either<Failure, List<PlacePreview>>> getPlacePreviewList({
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
          requestData: mapFilterRequest.toJson());

      try {
        PlacePreviewResponse placeResponse =
            PlacePreviewResponse.fromJson(data, baseLatLng);
        return Right(placeResponse.placeList);
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
  }) async {
    try {
      Map<String, dynamic> data = await _api.getPlaceDetailById(locId: locId);

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

  Future<Either<Failure, PlaceVerificationEntity>> getPlaceVerification({
    required String locId,
    required PlaceType placeType,
  }) async {
    try {
      Map<String, dynamic> data = await _api.getVerificationThumbnails(
          locId: locId, placeType: placeTypeToValue(placeType));

      try {
        PlaceVerificationEntity placeVerification =
            PlaceVerificationEntity.fromJson(data);
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

  Future<Either<Failure, String>> createReview({
    required String userId,
    required String placeId,
    required bool visitVerified,
    required List<Conimal> conimals,
    required List<DiseaseType> diseaseTypes,
    required ReviewRate reviewRate,
    required List<ReviewItems> selectedReviewItems,
  }) async {
    try {
      PlaceReviewRequest placeReviewRequest = PlaceReviewRequest(
          userId: userId,
          placeId: placeId,
          visitVerified: visitVerified,
          conimals: conimals,
          diseaseTypes: diseaseTypes,
          reviewRate: reviewRate,
          selectedReviewItems: selectedReviewItems);
      try {
        await _api.createPlaceReview(requestData: placeReviewRequest.toJson());
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
}
