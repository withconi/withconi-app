import 'dart:io' as io;

import 'package:dio/dio.dart' as dio;
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/core/tools/api_url.dart';
import 'package:withconi/data/model/dto/request_dto/abstract_request/request_info_abstract.dart';
import '../../../../../global_widgets/photo_gallary/image_item.dart';
import '../abstract_request/request_dto_abstract.dart';

class CreateImageRequestDTO
    extends RequestConverter<CreateImageRequestDTO, ImageItem>
    implements RequestDTO {
  final ImageItem imageItem;

  @override
  bool get requiresToken => true;

  @override
  RequestType get requestType => RequestType.POST_FORM_DATA;

  @override
  String get url => HttpUrl.IMAGE_UPLOAD;

  CreateImageRequestDTO.fromData(ImageItem image)
      : imageItem = image,
        super.fromData(image);

  Future<dio.FormData> get formDataMap async {
    // io.File imageFile = io.File(imageItem.resource);
    // String fileName = imageFile.path.split('/').last;
    // dio.FormData dataMap = dio.FormData.fromMap({
    //   "field": await dio.MultipartFile.fromFile(
    //     imageFile.path,
    //     filename: fileName,
    //   ),
    // });
    // print(imageFile.path);
    // print(imageFile);
    // return dataMap;

    dio.FormData _formData;
    // List<io.File> imageFileList =
    //     imageItems.map((e) => io.File(e.resource)).toList();

    final dio.MultipartFile _file = dio.MultipartFile.fromFileSync(
      imageItem.imageUrl,
    );

    _formData = dio.FormData.fromMap({"file": _file});
    // String fileName = imageFile.path.split('/').last;
    // dio.FormData dataMap = dio.FormData.fromMap({
    //   "field": imageFileList
    //       .map(
    //         (e) async => await dio.MultipartFile.fromFile(
    //           e.path,
    //         ),
    //       )
    //       .toList()
    // });

    return _formData;
  }

  @override
  Map<String, dynamic> get dataMap => {};
}
