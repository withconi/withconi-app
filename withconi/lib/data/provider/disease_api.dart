import 'package:dio/dio.dart';
import 'package:withconi/configs/constants/api_url.dart';
import '../../core/network_handling/network_response.dart';
import '../../core/network_handling/network_service.dart';
import '../model/disease.dart';

class DiseaseAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getDiseaseList(
      {required String diseaseName,
      required int page,
      required int listSize}) async {
    Map<String, Object> requestData = {
      'page': page,
      'listSize': listSize,
      'keyword': diseaseName,
    };

    Map<String, dynamic> userData = await _dio.apiCall(
        url: HttpUrl.GET_DISEASE,
        queryParameters: requestData,
        body: null,
        requestType: RequestType.GET);

    return userData;
  }
}
