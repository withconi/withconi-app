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

  // Future<dio.FormData> get formDataMap async {
  //   dio.FormData _formData;
  //   // List<io.File> imageFileList =
  //   //     imageItems.map((e) => io.File(e.resource)).toList();

  //   final List<dio.MultipartFile> _files = imageItems
  //       .map((img) => dio.MultipartFile.fromFileSync(
  //             img.resource,
  //           ))
  //       .toList();
  //   _formData = dio.FormData.fromMap({"file": _files});
  //   // String fileName = imageFile.path.split('/').last;
  //   // dio.FormData dataMap = dio.FormData.fromMap({
  //   //   "field": imageFileList
  //   //       .map(
  //   //         (e) async => await dio.MultipartFile.fromFile(
  //   //           e.path,
  //   //         ),
  //   //       )
  //   //       .toList()
  //   // });

  //   return _formData;
  // }

  Future<List<dio.FormData>> get formDataMapList async {
    List<dio.FormData> _formDataList;
    // List<io.File> imageFileList =
    //     imageItems.map((e) => io.File(e.resource)).toList();

    // final List<dio.MultipartFile> _files = imageItems
    //     .map((img) => dio.MultipartFile.fromFileSync(
    //           img.resource,
    //         ))
    //     .toList();
    // _formDataList = dio.FormData.fromMap({"file": _files});
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

    _formDataList = imageItems.map((imageItem) {
      dio.MultipartFile _file = dio.MultipartFile.fromFileSync(
        imageItem.resource,
      );
      return dio.FormData.fromMap({'file': _file});
    }).toList();

    return _formDataList;
  }

  @override
  Map<String, dynamic> get dataMap => {};
}
