import 'package:withconi/configs/constants/auth_variables.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import '../../configs/constants/api_url.dart';

class UserAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getUserInfo({required String uid}) async {
    Map<String, dynamic> requestData = {
      'uid': uid,
    };

    Map<String, dynamic> userData = await _dio.apiCall(
        url: HttpUrl.USER_GET,
        queryParameters: requestData,
        body: null,
        requestType: RequestType.GET);

    return userData;
  }

  Future<Map<String, dynamic>> updateUser(
      {required String uid, required Map<String, dynamic> updateData}) async {
    print(updateData);
    Map<String, dynamic> data = await _dio.apiCall(
      url: HttpUrl.USER_UPDATE,
      queryParameters: null,
      body: {"uid": uid, ...updateData},
      requestType: RequestType.POST,
    );
    return data;
  }
}
