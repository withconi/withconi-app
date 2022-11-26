import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:withconi/data/model/dto/request_dto/place_request/create_review_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/place_request/get_my_review_detail_request.dart';
import 'package:withconi/data/model/dto/request_dto/place_request/get_my_review_list_request.dart';
import 'package:withconi/data/model/dto/request_dto/place_request/get_place_detail_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/place_request/get_place_verification_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/place_request/get_review_history_request.dart';
import 'package:withconi/data/model/dto/request_dto/place_request/update_place_bookmark_request_dto.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_detail_response_dto.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/core/tools/helpers/infinite_scroll.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/review_history_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/review_response/review_detail_response_dto.dart';
import 'package:withconi/data/model/dto/response_dto/review_response/review_list_response_dto.dart';
import 'package:withconi/data/provider/remote_provider/map_api.dart';
import 'package:withconi/data/model/place_verfication.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';
import 'package:withconi/module/ui_model/review_detail_ui_model.dart';
import '../../module/ui_model/map_filter_ui_model.dart';
import '../enums/enum.dart';
import '../../core/error_handling/failures.dart';
import '../model/dto/request_dto/place_request/get_bookmarked_place_list_request.dart';
import '../model/dto/request_dto/place_request/get_place_list_request_dto.dart';
import '../model/dto/response_dto/place_response/place_preview_list_response_dto.dart';
import '../model/dto/response_dto/place_response/place_preview_response_dto.dart';

class MapRepository extends GetxService {
  // MapRepository._internal();
  // static final _singleton = MapRepository._internal();
  // factory MapRepository() => _singleton;
  MapRepository(this._api);
  final MapAPI _api;

  Future<Either<Failure, List<PlacePreviewResponseDTO>>> getPlacePreviewList(
      {required MapFilterUIModel mapFilterUIModel,
      required PaginationFilter paginationFilter,
      required LatLngUIModel baseLatLng}) async {
    try {
      GetPlacePreviewListRequestDTO requestDTO =
          GetPlacePreviewListRequestDTO.fromData(
              data: mapFilterUIModel,
              paginationFilter: paginationFilter,
              latlng: baseLatLng);
      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      Map<String, dynamic> data =
          await _api.getPlacePreviewListByFilter(apiCallDTO);

      try {
        List<PlacePreviewResponseDTO> placePreviewListDto =
            PlacePreviewListResponseDTO.fromJson(data).list;
        return Right(placePreviewListDto);
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

  // Either<Failure, List<PlacePreviewResponseDTO>> _parsePlacePreviewListDTO(
  //     Map<String, dynamic> data) {
  //   List<PlacePreviewResponseDTO> previewList =
  //       PlacePreviewListResponseDTO.fromJson(data).list;
  //   return Right(previewList);
  // }

  Future<Either<Failure, List<PlacePreviewResponseDTO>>> getBookmarkedPlaceList(
      {required PaginationFilter paginationFilter}) async {
    try {
      GetBookmarkedPlaceListRequestDTO requestDTO =
          GetBookmarkedPlaceListRequestDTO.fromData(paginationFilter);
      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      Map<String, dynamic> data =
          await _api.getPlacePreviewListByFilter(apiCallDTO);

      try {
        List<PlacePreviewResponseDTO> placePreviewListDto =
            PlacePreviewListResponseDTO.fromJson(data).list;
        return Right(placePreviewListDto);
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

  Future<Either<Failure, PlaceDetailResponseDTO>> getPlaceDetailById({
    required String placeId,
    required PlaceType placeType,
  }) async {
    try {
      GetPlaceDetailRequestDTO requestDTO = GetPlaceDetailRequestDTO.fromData(
          placeId: placeId, placeType: placeType);
      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      Map<String, dynamic> data = await _api.getHospitalDetailById(apiCallDTO);

      PlaceDetailResponseDTO responseDTO =
          PlaceDetailResponseDTO.fromJson(data);
      //  late PlaceDetailResponseDTO placeDetailUiModel;
      //   switch (placeType) {
      //     case PlaceType.hospital:
      //    data =
      //       await _api.getHospitalDetailById(apiCallDTO);
      //       placeDetailUiModel = HospitalDetailResponseDTO.fromJson(data);
      //       break;
      //    case PlaceType.pharmacy:
      //        data =
      //       await _api.getHospitalDetailById(apiCallDTO);
      //              placeDetailUiModel = PharmacyDetailResponseDTO.fromJson(data);
      //       break;
      //     default:

      //   }

      return Right(responseDTO);
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

  //TODO : placeDetail에다가 reviewData 합쳐서 보내달라하기
  Future<Either<Failure, ReviewHistoryResponseDTO>> getReviewHistory({
    required String locId,
    required bool onlyVerfied,
  }) async {
    try {
      var requestDTO = GetReviewHistoryRequestDTO.fromData(
          placeId: locId, onlyVerified: onlyVerfied);
      var apiCallDto = ApiCallDTO.fromDTO(requestDTO);
      Map<String, dynamic> data = await _api.getReviewHistory(apiCallDto);

      try {
        ReviewHistoryResponseDTO reviewResponse =
            ReviewHistoryResponseDTO.fromJson(data);

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
    required String placeId,
    required PlaceType placeType,
  }) async {
    try {
      var requestDTO = GetPlaceVerificationRequestDTO.fromData(
          placeId: placeId, placeType: placeType);
      var apiCallDTO = ApiCallDTO.fromDTO(requestDTO);

      Map<String, dynamic> data = await _api.getVerification(apiCallDTO);

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

  Future<Either<Failure, ReviewListResponseDTO>> getMyReviewList({
    required PaginationFilter paginationFilter,
  }) async {
    try {
      var requestDTO = GetMyReviewListRequestDTO.fromData(paginationFilter);
      var apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      Map<String, dynamic> data = await _api.getMyReviewList(apiCallDTO);

      try {
        ReviewListResponseDTO placeReviewResponse =
            ReviewListResponseDTO.fromJson(data);
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

  // Future<Either<Failure, ReviewDetailUIModel>> getMyReviewDetail(
  //     {required String reviewId}) async {
  //   try {
  //    var requestDTO= GetMyReviewDetailRequestDTO.fromData(reviewId: reviewId);
  //    var apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
  //     Map<String, dynamic> data = await _api.getMyReviewDetail(
  //        apiCallDTO);

  //     try {
  //       ReviewDetailUIModel reviewDetail = ReviewDetailUIModel(conimals: conimals, diseaseTypes: diseaseTypes, reviewItems: reviewItems, reviewRate: reviewRate, diseaseList: diseaseList, placePreview: placePreview, reviewDesc: reviewDesc)
  //       return Right(placeReview);
  //     } catch (e) {
  //       throw DataParsingException();
  //     }
  //   } on NoInternetConnectionException {
  //     return Left(NoConnectionFailure());
  //   } on DataParsingException {
  //     return Left(DataParsingFailure());
  //   } on NotFoundException {
  //     return Left(NotFoundFailure());
  //   } catch (e) {
  //     return Left(NoUserDataFailure());
  //   }
  // }

  Future<Either<Failure, bool>> createPlaceReview(
      {required ReviewDetailUIModel reviewUIModel}) async {
    try {
      var requestDTO = CreateReviewRequestDTO.fromData(data: reviewUIModel);
      var apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      try {
        await _api.createPlaceReview(apiCallDTO);
        return Right(true);
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

  Future<Either<Failure, bool>> updateBookmark(
      {required String placeId, required bool isBookmarked}) async {
    try {
      var requestDTO = UpdatePlaceBookmarkRequestDTO.fromData(
          placeId: placeId, isBookmarked: isBookmarked);
      var apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      Map<String, dynamic> updateResult =
          await _api.updatePlaceBookmark(apiCallDTO);

      // List<String> likedPostIdList =
      //     (likePostsData['likePosts'] as List<dynamic>)
      //         .map((e) => e as String)
      //         .toList();

      // print("Liked Post Number => ${likedPostIdList.length}");
      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }
}
