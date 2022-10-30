import 'package:withconi/core/tools/api_url.dart';
import '../../core/network_handling/network_service.dart';

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
        url: HttpUrl.DISEASE_GET,
        queryParameters: requestData,
        body: null,
        requestType: RequestType.GET);

    return userData;
  }
}
