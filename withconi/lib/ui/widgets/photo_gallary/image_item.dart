import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:withconi/configs/constants/constants.dart';

enum ImageType { network, file, asset }

class ImageItem {
  ImageItem({
    required this.id,
    required this.resource,
    this.isSvg = false,
    required this.imageType,
  });

  final String id;
  final String resource;
  final bool isSvg;
  ImageType imageType;

  toImageByType() {
    switch (imageType) {
      case ImageType.asset:
        return AssetImage(resource);
      case ImageType.file:
        return FileImage(File(resource));
      case ImageType.network:
        return NetworkImage(Constants.WITHCONI_IMAGE_BASE_URL + resource);
    }
  }
}

// ImageProvider getImageByType(ImageItem imageItem) {
//   switch (imageItem.imageType) {
//     case ImageType.asset:
//       return AssetImage('${imageItem.resource}');
//     case ImageType.file:
//       return FileImage(File(imageItem.resource));
//     case ImageType.network:
//       return NetworkImage('${imageItem.resource}');
//     default:
//       return NetworkImage('${imageItem.resource}');
//   }
// }
