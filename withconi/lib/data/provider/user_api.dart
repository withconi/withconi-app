import 'package:withconi/core/network_handling/network_service.dart';
import '../../configs/constants/api_url.dart';

class UserAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getUserInfo({required String uid}) async {
    Map<String, Object> requestData = {
      'uid': uid,
    };

    Map<String, dynamic> userData = await _dio.apiCall(
        url: HttpUrl.GET_USER,
        queryParameters: requestData,
        body: null,
        requestType: RequestType.GET);

    return userData;
  }

  Future<String?> updateUser({required Map<String, dynamic> updateData}) async {
    print(updateData);
    Map<String, dynamic> data = await _dio.apiCall(
      url: HttpUrl.UPDATE_USER,
      queryParameters: null,
      body: updateData,
      requestType: RequestType.POST,
    );
  }
}
