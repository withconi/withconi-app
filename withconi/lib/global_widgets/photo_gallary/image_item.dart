import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:withconi/core/values/constants/constants.dart';

enum ImageType { network, file, asset }

class ImageItem extends Equatable {
  ImageItem({
    required this.id,
    required this.imageUrl,
    this.isSvg = false,
    required this.imageType,
  });

  final String id;
  String imageUrl;
  String get imageRef =>
      imageUrl.substring(imageUrl.lastIndexOf('/') + 1, imageUrl.indexOf('?'));
  final bool isSvg;
  ImageType imageType;

  ImageProvider get getImageByType {
    String imageResource = imageUrl;
    if (imageResource.isEmpty) {
      return const AssetImage('assets/icons/paw_icon_grey.png');
    }
    switch (imageType) {
      case ImageType.asset:
        return AssetImage(imageResource);
      case ImageType.file:
        return FileImage(File(imageResource));
      case ImageType.network:
        return NetworkImage(imageResource);
    }
  }

  deleteImage() {
    imageUrl = '';
    imageType = ImageType.asset;
  }

  @override
  List<Object?> get props => [imageUrl, id];
}
