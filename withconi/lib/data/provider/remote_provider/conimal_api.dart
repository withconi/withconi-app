import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/conimal_request/create_conimal_request_dto.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import '../../../core/tools/api_url.dart';

class ConimalAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getBreedList(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> data = await _dio.apiCall(apiCallDTO);
    return data;
  }

  Future<String?> createConimal(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> data = await _dio.apiCall(apiCallDTO);
  }

  Future<String?> updateConimal(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> data = await _dio.apiCall(apiCallDTO);
  }

  Future<String?> updateConimalDisease(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> data = await _dio.apiCall(apiCallDTO);
  }

  Future<void> deleteConimal(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> data = await _dio.apiCall(apiCallDTO);
  }

  Future<Map<String, dynamic>> updateConimalList(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> data = await _dio.apiCall(apiCallDTO);

    //     header: {'requiresToken': true},
    // url: HttpUrl.USER_UPDATE,
    // queryParameters: null,
    // body: {...updateData},
    // requestType: RequestType.POST,
    return data;
  }
}
