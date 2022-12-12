import 'package:withconi/core/values/constants/auth_variables.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import '../../../core/tools/api_url.dart';

class UserAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getUserInfo(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> userData = await _dio.apiCall(apiCallDTO);

    return userData;
  }

  Future<Map<String, dynamic>> updateUser(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> data = await _dio.apiCall(apiCallDTO);

    return data;
  }

  Future<Map<String, dynamic>> getUserInfoExistence(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> data = await _dio.apiCall(apiCallDTO);

    return data;
  }

  Future<Map<String, dynamic>> sendVerificationEmail(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> data = await _dio.apiCall(apiCallDTO);
    return data;
  }

  Future<Map<String, dynamic>> checkEmailVerificationCode(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> data = await _dio.apiCall(apiCallDTO);

    return data;
  }
}
