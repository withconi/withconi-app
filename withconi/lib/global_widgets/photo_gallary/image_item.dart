import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:withconi/core/values/constants/constants.dart';

enum ImageType { network, file, asset }

class ImageItem extends Equatable {
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

  ImageProvider get getImageByType {
    String imageResource = resource;
    switch (imageType) {
      case ImageType.asset:
        return AssetImage(imageResource);
      case ImageType.file:
        return FileImage(File(imageResource));
      case ImageType.network:
        return NetworkImage(Constants.WITHCONI_IMAGE_BASE_URL + imageResource);
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [resource, id];
}
