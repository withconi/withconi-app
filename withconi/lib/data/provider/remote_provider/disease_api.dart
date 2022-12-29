import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/disease_request/get_disease_request_dto.dart';
import '../../../core/network_handling/network_service.dart';

class DiseaseAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getDiseaseList(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> diseaseListData = await _dio.apiCall(apiCallDTO);

    return diseaseListData;
  }

  Future<Map<String, dynamic>> getDiseaseDetail(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> diseaseDetailData = await _dio.apiCall(apiCallDTO);

    return diseaseDetailData;
  }

  Future<Map<String, dynamic>> getCommonDiseaseList(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> commonDiseaseData = await _dio.apiCall(apiCallDTO);

    return commonDiseaseData;
  }
}
