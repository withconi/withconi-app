import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/error_handling/failures.dart';

class ImagePickHelper {
  Future<Either<Failure, File?>?> pickSingleImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, imageQuality: 80);

    if (image != null) {
      Map<String, dynamic> pictureSizeMap =
          getFileSizeMap(bytes: File(image.path).lengthSync());

      if (pictureSizeMap['suffix'] == "GB" ||
          pictureSizeMap['suffix'] == "TB") {
        return Left(MaxImageSizeFailure());
      } else if (pictureSizeMap['suffix'] == "MB") {
        if (pictureSizeMap['size'] > 2) {
          return Left(MaxImageSizeFailure());
        }
      } else {
        return Right(File(image.path));
      }
    } else {
      return Right(null);
    }
  }

  Future<Either<Failure, List<File>>?> pickMultipleImages(
      {required int maxImageNum, required int selectedImageNum}) async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? _pickedImages =
        await _picker.pickMultiImage(maxHeight: 500, imageQuality: 80);
    List<File> _filteredImages = [];

    if (_pickedImages != null) {
      if (_pickedImages.length + selectedImageNum > maxImageNum) {
        return Left(MaxImageNumFailure());
      }
      _pickedImages.forEach((image) {
        Map<String, dynamic> pictureSizeMap =
            getFileSizeMap(bytes: File(image.path).lengthSync());

        if (pictureSizeMap['suffix'] == "GB" ||
            pictureSizeMap['suffix'] == "TB") {
        } else if (pictureSizeMap['suffix'] == "MB") {
          if (pictureSizeMap['size'] < 2) {
            _filteredImages.add(File(image.path));
          }
        } else {
          _filteredImages.add(File(image.path));
        }
      });

      if (_filteredImages.isEmpty) {
        return Left(MaxImageSizeFailure());
      } else {
        print(_filteredImages);
        return Right(_filteredImages);
      }
    } else {
      return Right([]);
    }
  }

  // Either<Failure, List<File>> pickMultipleImage() {}

  Map<String, dynamic> getFileSizeMap({required int bytes, int decimals = 0}) {
    if (bytes <= 0) {
      return {"size": 0, "suffix": "Bytes"};
    }
    const suffixes = ["Bytes", "KB", "MB", "GB", "TB"];
    var i = (log(bytes) / log(1024)).floor();
    var strSize = (bytes / pow(1024, i)).toStringAsFixed(decimals);
    int intSize = int.parse(strSize);
    dev.log('picture size : $intSize${suffixes[i]}');
    return {"size": intSize, "suffix": suffixes[i]};
  }
}
