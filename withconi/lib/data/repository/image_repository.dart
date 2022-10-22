// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/provider/image_api.dart';
import '../../core/error_handling/failures.dart';
import '../../ui/widgets/photo_gallary/image_item.dart';

class ImageRepository {
  final ImageAPI _api = ImageAPI();

  Future<Either<Failure, String>> uploadImageFile(
      {required File imageFile}) async {
    try {
      Map<String, dynamic> data =
          await _api.uploadImageFile(imageFile: imageFile);
      String imageFileId = data["field"] as String;
      return Right(imageFileId);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<ImageItem>>> uploadImageFileList(
      {required List<ImageItem> imageFileItems}) async {
    try {
      List<ImageItem> imageFileRefs = [];
      for (ImageItem imageFile in imageFileItems) {
        Map<String, dynamic> data =
            await _api.uploadImageFile(imageFile: File(imageFile.resource));
        String imageFileId = data["field"] as String;
        imageFileRefs.add(ImageItem(
            id: imageFileId, resource: imageFileId, imageType: ImageType.file));
      }

      return Right(imageFileRefs);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }
}
