import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import '../../configs/constants/api_url.dart';

class ConimalAPI {
  final Api _dio = Api();

  Future<String?> createConimal({required Map<String, dynamic> conimal}) async {
    Map<String, dynamic> data = await _dio.apiCall(
      url: HttpUrl.CONIMAL_CREATE,
      queryParameters: null,
      body: conimal,
      requestType: RequestType.POST,
    );
  }

  Future<String?> updateConimal({required Map<String, dynamic> conimal}) async {
    print({...conimal});
    Map<String, dynamic> data = await _dio.apiCall(
      url: HttpUrl.CONIMAL_UPDATE,
      queryParameters: null,
      body: conimal,
      requestType: RequestType.POST,
    );
  }

  Future<String?> deleteConimal(
      {required String uid, required String conimalId}) async {
    Map<String, dynamic> data = await _dio.apiCall(
      url: HttpUrl.CONIMAL_DELETE,
      queryParameters: null,
      body: {"uid": uid, "conimalId": conimalId},
      requestType: RequestType.POST,
    );
  }
}
