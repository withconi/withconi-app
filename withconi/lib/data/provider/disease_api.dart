import 'package:dio/dio.dart';
import 'package:withconi/configs/constants/api_url.dart';
import '../../core/network_handling/network_response.dart';
import '../../core/network_handling/network_service.dart';
import '../model/disease.dart';

class DiseaseAPI {
  final Dio _dio = Dio();
  List<DiseaseModel> diseaseList = [];

  getDiseaseList(
      {required String diseaseName,
      required int page,
      required int listSize}) async {
    Map<String, Object> requestData = {
      'page': page,
      'listSize': listSize,
      'keyword': diseaseName,
    };

    NetworkResponse? userData = await Api()
        .apiCall(HttpUrl.GET_DISEASE, requestData, null, RequestType.GET);
    print(userData);

    return userData?.maybeWhen(success: (data) {
      List<DiseaseModel> list = parseDisease(data);
      return list;
    }, loading: (message) {
      print("sasa -  $message");
    }, error: (message) {
      print("sasa -  ${message}");
    }, orElse: () {
      print("sasa -  on error");
    });
  }
}
