import 'package:withconi/configs/constants/auth_variables.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/data/model/request_model/request_model.dart';
import '../../configs/constants/api_url.dart';

class MapAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getPlacePreviewListByFilter(
      {required Map<String, dynamic> requestData}) async {
    Map<String, dynamic> mapListData = await _dio.apiCall(
        url: HttpUrl.MAP_GET_LIST,
        queryParameters: requestData,
        body: null,
        requestType: RequestType.GET);

    return mapListData;
  }

  Future<Map<String, dynamic>> getPlaceDetailById(
      {required String locId}) async {
    Map<String, dynamic> placeDetailData = await _dio.apiCall(
        url: HttpUrl.MAP_GET_LOCATION_DETAIL,
        queryParameters: {'locId': locId},
        body: null,
        requestType: RequestType.GET);

    return placeDetailData;
  }

  Future<Map<String, dynamic>> getPlaceReviews(
      {required String locId, required bool onlyVerified}) async {
    Map<String, dynamic> placeDetailData = await _dio.apiCall(
        url: HttpUrl.MAP_GET_PLACE_REVIEW_LIST,
        queryParameters: {'locId': locId, 'onlyVisitVerified': onlyVerified},
        body: null,
        requestType: RequestType.GET);

    return placeDetailData;
  }

  Future<Map<String, dynamic>> getVerificationThumbnails(
      {required String locId, required String placeType}) async {
    Map<String, dynamic> verficationData = await _dio.apiCall(
        url: HttpUrl.MAP_VERIFY_THUMBNAIL,
        queryParameters: {'locId': locId, 'locType': placeType},
        body: null,
        requestType: RequestType.GET);

    return verficationData;
  }

  Future<Map<String, dynamic>> createPlaceReview(
      {required Map<String, dynamic> requestData}) async {
    Map<String, dynamic> reviewData = await _dio.apiCall(
        url: HttpUrl.MAP_PLACE_REVIEW_CREATE,
        queryParameters: null,
        body: requestData,
        requestType: RequestType.POST);

    return reviewData;
  }
}
