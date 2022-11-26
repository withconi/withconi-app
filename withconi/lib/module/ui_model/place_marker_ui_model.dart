import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';

import '../../data/enums/enum.dart';
import 'latlng_ui_model.dart';

class PlaceMarkerUIModel extends Marker {
  // final PlacePreviewUIModel place;
  final PlaceType placeType;
  final String placeId;

  // the old way
  PlaceMarkerUIModel({
    required this.placeId,
    required this.placeType,
    required LatLngUIModel placeLocation,
    required String text,
    required int iconWidth,
    required int iconHeight,
    required void Function(Marker? marker, Map<String, int?> iconSize)?
        onTapMarker,
  }) : super(
          markerId: placeId,
          position: placeLocation,
          width: iconWidth,
          height: iconHeight,
          captionText: text,
          onMarkerTab: onTapMarker,
        );

  factory PlaceMarkerUIModel.fromMyPlace({
    required PlacePreviewUiModel placePreview,
    required void Function(Marker? marker, Map<String, int?> iconSize)?
        onTapMarker,
  }) =>
      PlaceMarkerUIModel(
        placeId: placePreview.placeId,
        text: placePreview.name,
        iconWidth: 30,
        iconHeight: 30,
        onTapMarker: onTapMarker,
        placeLocation: placePreview.placeLocation,
        placeType: placePreview.placeType,
      );

  Future<void> setMarkerImageIcon({
    required bool iconClicked,
  }) async {
    icon = await OverlayImage.fromAssetImage(
      assetName: (iconClicked)
          ? placeType.selectedImagePng
          : placeType.unselectedImagePng,
    );

    width = (iconClicked) ? 32 : 29;
    height = (iconClicked) ? 46 : 29;
  }

  // void setOnMarkerTab(
  //     void Function(Marker? marker, Map<String, int?> iconSize)? callBack) {
  //   onMarkerTab = callBack;
  //   width = 50;
  //   height = 50;
  // }
}
