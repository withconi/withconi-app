import 'package:withconi/core/values/constants/auth_variables.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/create_comment_request_dto.dart';
import '../../../core/tools/api_url.dart';
import '../../../module/ui_model/review_detail_ui_model.dart';

class MapAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getPlacePreviewListByFilter(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> mapListData = await _dio.apiCall(apiCallDTO);

    return mapListData;
  }

  Future<Map<String, dynamic>> deleteMyPlaceReview(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> deleteResult = await _dio.apiCall(apiCallDTO);

    return deleteResult;
  }

  Future<Map<String, dynamic>> getHospitalDetailById(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> placeDetailData = await _dio.apiCall(apiCallDTO);

    return placeDetailData;
  }

  Future<Map<String, dynamic>> getPharmacyDetailById(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> placeDetailData = await _dio.apiCall(apiCallDTO);

    return placeDetailData;
  }

  Future<Map<String, dynamic>> getPlacePreviewById(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> placePreviewData = await _dio.apiCall(apiCallDTO);

    return placePreviewData;
  }

  Future<Map<String, dynamic>> getReviewHistory(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> placeDetailData = await _dio.apiCall(apiCallDTO);

    return placeDetailData;
  }

  Future<Map<String, dynamic>> getVerification(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> verficationData = await _dio.apiCall(apiCallDTO);

    return verficationData;
  }

  Future<Map<String, dynamic>> createPlaceReview(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> reviewData = await _dio.apiCall(apiCallDTO);

    return reviewData;
  }

  Future<Map<String, dynamic>> updatePlaceBookmark(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> updateResult = await _dio.apiCall(apiCallDTO);
    return updateResult;
  }

  Future<Map<String, dynamic>> getMyReviewList(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> myReviewList = await _dio.apiCall(apiCallDTO);
    return myReviewList;
  }

  Future<Map<String, dynamic>> getMyReviewDetail(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> myReviewDetails = await _dio.apiCall(apiCallDTO);

    return myReviewDetails;
  }
}
