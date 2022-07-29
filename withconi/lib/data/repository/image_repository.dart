// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/provider/image_api.dart';
import '../../core/error_handling/failures.dart';

class ImageRepository {
  final ImageAPI _api = ImageAPI();

  Future<Either<Failure, String>> uploadImageFile(
      {required File imageFile}) async {
    try {
      Map<String, dynamic> data =
          await _api.uploadImageFile(imageFile: imageFile);
      String imageFileId = data["imageFileRef"] as String;
      return Right(imageFileId);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, List<String>>> uploadImageFileList(
      {required List<File> imageFiles}) async {
    try {
      List<String> imageFileRefs = [];
      for (File imageFile in imageFiles) {
        Map<String, dynamic> data =
            await _api.uploadImageFile(imageFile: imageFile);
        String imageFileId = data["imageFileRef"] as String;
        imageFileRefs.add(imageFileId);
      }

      return Right(imageFileRefs);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    }
  }
}
