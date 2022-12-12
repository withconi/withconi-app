// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/image_request/create_image_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/image_request/create_muptiple_image_request_dto.dart';
import 'package:withconi/data/provider/remote_provider/image_api.dart';
import '../../core/error_handling/failures.dart';
import '../../global_widgets/photo_gallary/image_item.dart';

class ImageRepository extends GetxService {
  ImageRepository(this._api);
  final ImageAPI _api;
  List<String> _imageFileRefList = List.empty(growable: true);

  Future<Either<Failure, String>> uploadImageFile(
      {required ImageItem imageItem}) async {
    try {
      if (imageItem.imageUrl.isEmpty) {
        return Left(DataParsingFailure());
      }
      CreateImageRequestDTO requestDTO =
          CreateImageRequestDTO.fromData(imageItem);
      dio.FormData formData = await requestDTO.formDataMap;
      ApiCallDTO apiCallDTO =
          ApiCallDTO.fromDataDtoWithFormData(requestDTO, formData);
      Map<String, dynamic> data = await _api.uploadImageFile(apiCallDTO);
      String imageFileId = data['ref'] as String;
      return Right(imageFileId);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<String>>> uploadImageFileList(
      List<ImageItem> imageItems) async {
    try {
      _imageFileRefList.clear();
      CreateMultipleImagesRequestDTO requestDTO =
          CreateMultipleImagesRequestDTO.fromData(imageItems
              .where((element) => element.imageUrl.isNotEmpty)
              .toList());
      List<dio.FormData> formData = await requestDTO.formDataMapList;

      List<ApiCallDTO> apiCallDTOList = formData
          .map((e) => ApiCallDTO.fromDataDtoWithFormData(requestDTO, e))
          .toList();
      // ApiCallDTO.fromDataDtoWithFormData(requestDTO, formData);

      for (ApiCallDTO apiCallDTO in apiCallDTOList) {
        Map<String, dynamic> data = await _api.uploadImageFile(apiCallDTO);
        _imageFileRefList.add(data['ref']);
      }

      // Map<String, dynamic> data = await _api.uploadImageFile(apiCallDTO);
      // List<String> imageFileRefList = data['ref'] as List<String>;

      return Right(_imageFileRefList.toList());
    } catch (e) {
      if (_imageFileRefList.isEmpty) {
        return Left(ServerFailure());
      } else {
        return Right(_imageFileRefList);
      }

      // on NoInternetConnectionException {
      //   if
      //   return Left(NoConnectionFailure());
      // } on DataParsingException {
      //   return Left(DataParsingFailure());
      // } on InternalServerErrorException {
      //   return Left(ServerFailure());
      // }
    }
  }
}
