import 'package:withconi/configs/constants/auth_variables.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/data/model/request_model/request_model.dart';
import '../../configs/constants/api_url.dart';

class MapAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> getPlacePreviewListByFilter(
      {required MapFilterRequest mapFilterRequest}) async {
    Map<String, dynamic> requestData = mapFilterRequest.toJson();

    Map<String, dynamic> mapListData = await _dio.apiCall(
        url: HttpUrl.MAP_GET_LIST,
        queryParameters: requestData,
        body: null,
        requestType: RequestType.GET);

    return mapListData;
  }
}
