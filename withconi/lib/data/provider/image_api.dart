import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import '../../configs/constants/api_url.dart';

class ImageAPI {
  final Api _dio = Api();

  Future<Map<String, dynamic>> uploadImageFile(
      {required File imageFile}) async {
    String fileName = imageFile.path.split('/').last;
    var formData = FormData.fromMap({
      "imageFile": await MultipartFile.fromFile(
        imageFile.path,
        filename: fileName,
        // contentType: MediaType("image", "jpeg"), //important
      ),
    });

    Map<String, dynamic> imageFileId = await _dio.apiCall(
        url: HttpUrl.IMAGE_UPLOAD,
        queryParameters: null,
        body: null,
        formData: formData,
        requestType: RequestType.POST_FORM_DATA,
        header: {
          "Content-Type": "multipart/form-data",
        });
    return imageFileId;
  }
}
