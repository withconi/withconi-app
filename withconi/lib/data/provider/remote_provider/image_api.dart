import 'dart:io';

import 'package:dio/dio.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/image_request/create_image_request_dto.dart';
import '../../../core/tools/api_url.dart';

class ImageAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> uploadImageFile(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> imageFileId = await _dio.apiCall(apiCallDTO);
    return imageFileId;
  }

  Future<Map<String, dynamic>> uploadImageFileList(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> imageFileIdList = await _dio.apiCall(apiCallDTO);
    return imageFileIdList;
  }
}
