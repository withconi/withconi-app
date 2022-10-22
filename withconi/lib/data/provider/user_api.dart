import 'package:withconi/configs/constants/auth_variables.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import '../../configs/constants/api_url.dart';

class UserAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getUserInfo({required String uid}) async {
    Map<String, dynamic> userData = await _dio.apiCall(
        header: {'requiresToken': true},
        url: HttpUrl.USER_GET,
        queryParameters: null,
        body: null,
        requestType: RequestType.GET);

    return userData;
  }

  Future<Map<String, dynamic>> updateUser(
      {required String uid, required Map<String, dynamic> updateData}) async {
    print(updateData);
    Map<String, dynamic> data = await _dio.apiCall(
      header: {'requiresToken': true},
      url: HttpUrl.USER_UPDATE,
      queryParameters: null,
      body: {...updateData},
      requestType: RequestType.POST,
    );
    return data;
  }
}
