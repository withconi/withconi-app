import 'package:dio/dio.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';

import '../../../core/network_handling/network_service.dart';
import '../../../core/values/constants/app_info.dart';

final Map<String, dynamic> defaultHeader = {
  'Content-type': 'application/json',
  'application': AppInfo().os + '_' + AppInfo.version,
};

class ApiCallDTO {
  String url;
  Map<String, dynamic>? header;
  Map<String, dynamic>? data;
  FormData? formData;
  RequestType requestType;

  ApiCallDTO._(
      {required this.url,
      required this.data,
      this.formData,
      required this.requestType,
      this.header});

  factory ApiCallDTO.fromDTO(RequestDTO requestDTO) {
    Map<String, dynamic> header = Map.from(defaultHeader);

    header['requiresToken'] = requestDTO.requiresToken;

    if (requestDTO.requestType == RequestType.POST_FORM_DATA) {
      header.remove('Content-Type');
      header['Content-Type'] = "multipart/form-data";
    } else {
      header.remove('Content-Type');
      header['Content-Type'] = 'application/json';
    }

    return ApiCallDTO._(
        url: requestDTO.url,
        header: header,
        data: requestDTO.dataMap,
        requestType: requestDTO.requestType);
  }

  factory ApiCallDTO.fromDTOWithPlatformToken(
      RequestDTO requestDTO, String platformToken) {
    Map<String, dynamic> header = Map.from(defaultHeader);

    header['requiresToken'] = requestDTO.requiresToken;
    header['platformToken'] = platformToken;

    if (requestDTO.requestType == RequestType.POST_FORM_DATA) {
      header.remove('Content-Type');
      header['Content-Type'] = "multipart/form-data";
    } else {
      header.remove('Content-Type');
      header['Content-Type'] = 'application/json';
    }

    return ApiCallDTO._(
        url: requestDTO.url,
        header: header,
        data: requestDTO.dataMap,
        requestType: requestDTO.requestType);
  }

  factory ApiCallDTO.fromDataDtoWithFormData(
      RequestDTO requestDTO, FormData formData) {
    Map<String, dynamic> header = defaultHeader;

    header['requiresToken'] = requestDTO.requiresToken;

    // if (requestDTO.requestType == RequestType.POST_FORM_DATA) {
    header.remove('Content-Type');
    header['Content-Type'] = "multipart/form-data";
    // }

    return ApiCallDTO._(
        url: requestDTO.url,
        header: header,
        data: requestDTO.dataMap,
        formData: formData,
        requestType: requestDTO.requestType);
  }
}
