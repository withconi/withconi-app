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
}
