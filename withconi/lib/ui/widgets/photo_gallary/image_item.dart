import 'package:flutter/widgets.dart';

enum ImageType { network, file, asset }

class ImageItem {
  ImageItem({
    required this.id,
    required this.resource,
    this.isSvg = false,
    required this.imageType,
  });

  final String id;
  final dynamic resource;
  final bool isSvg;
  ImageType imageType;
}

ImageProvider getImageByType(ImageItem imageItem) {
  switch (imageItem.imageType) {
    case ImageType.asset:
      return AssetImage('${imageItem.resource}');
    case ImageType.file:
      return FileImage(imageItem.resource);
    case ImageType.network:
      return NetworkImage('${imageItem.resource}');
    default:
      return NetworkImage('${imageItem.resource}');
  }
}
