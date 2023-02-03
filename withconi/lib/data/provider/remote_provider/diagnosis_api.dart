import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/disease_request/get_disease_request_dto.dart';
import '../../../core/network_handling/network_service.dart';

class DiagnosisAPI {
  final Api _dio = Api();



  // Future<Map<String, dynamic>> getDiseaseList(ApiCallDTO apiCallDTO) async {
  //   Map<String, dynamic> diseaseListData = await _dio.apiCall(apiCallDTO);

  //   return diseaseListData;
  // }

  Future<Map<String, dynamic>> getSymptomList(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> symptomData = await _dio.apiCall(apiCallDTO);

    return symptomData;
  }
}
