import 'dart:io' as io;

import 'package:dio/dio.dart' as dio;
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../../../../../global_widgets/photo_gallary/image_item.dart';
import '../abstract_request/request_dto_abstract.dart';

class CreateMultipleImagesRequestDTO
    extends RequestConverter<CreateMultipleImagesRequestDTO, List<ImageItem>>
    implements RequestDTO {
  final List<ImageItem> imageItems;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST_FORM_DATA;

  @override
  String get url => HttpUrl.IMAGE_UPLOAD;

  CreateMultipleImagesRequestDTO.fromData(List<ImageItem> images)
      : imageItems = images,
        super.fromData(images);

  Future<dio.FormData> get formDataMap async {
    // io.File imageFile = io.File(imageItems[0].resource);
    // String fileName = imageFile.path.split('/').last;
    dio.FormData dataMap = dio.FormData.fromMap({
      "imageFiles": imageItems.map((imageFile) async {
        return await dio.MultipartFile.fromFile(
          imageFile.resource,
          filename: imageFile.resource.split('/').last,
        );
      }).toList()
    });
    return dataMap;
  }

  @override
  Map<String, dynamic> get dataMap => {};
}
