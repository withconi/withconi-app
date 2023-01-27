import 'dart:math';

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

  final List<String> overlappedMarkerList;

  // the old way
  PlaceMarkerUIModel({
    required this.placeId,
    required this.placeType,
    required LatLngUIModel placeLocation,
    required LatLngUIModel markerLocation,
    required String text,
    required this.overlappedMarkerList,
    required int iconWidth,
    required int iconHeight,
    required void Function(Marker? marker, Map<String, int?> iconSize)?
        onTapMarker,
  }) : super(
          markerId: placeId,
          position: markerLocation,
          width: iconWidth,
          height: iconHeight,
          captionText: text,
          zIndex: 0,
          onMarkerTab: onTapMarker,
        );

  factory PlaceMarkerUIModel.fromMyPlace({
    required PlacePreviewUIModel placePreview,
    required void Function(Marker? marker, Map<String, int?> iconSize)?
        onTapMarker,
  }) =>
      PlaceMarkerUIModel(
        placeId: placePreview.placeId,
        text: placePreview.name,
        iconWidth: 28,
        iconHeight: 28,
        onTapMarker: onTapMarker,
        overlappedMarkerList: [],
        markerLocation: LatLngUIModel(
            lat: placePreview.placeLocation.lat,
            lng: placePreview.placeLocation.lng),
        placeLocation: LatLngUIModel(
            lat: placePreview.placeLocation.lat,
            lng: placePreview.placeLocation.lng),
        placeType: placePreview.placeType,
      );

  factory PlaceMarkerUIModel.fromMyOverlappedPlace({
    required PlacePreviewUIModel placePreview,
    required List<String> overlappedMarkerList,
    required void Function(Marker? marker, Map<String, int?> iconSize)?
        onTapMarker,
  }) =>
      PlaceMarkerUIModel(
        placeId: placePreview.placeId,
        text: placePreview.name,
        iconWidth: 32,
        iconHeight: 32,
        onTapMarker: onTapMarker,
        overlappedMarkerList: overlappedMarkerList,
        placeLocation: LatLngUIModel(
            lat: placePreview.placeLocation.lat,
            lng: placePreview.placeLocation.lng),
        markerLocation: LatLngUIModel(
            lat: placePreview.placeLocation.lat +
                _generateDoubleRandom(0.000002, 0.00002, 13),
            lng: placePreview.placeLocation.lng +
                _generateDoubleRandom(0.000003, 0.00007, 13)),
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

    if (iconClicked) {
      zIndex = 1;
    } else {
      zIndex = 0;
    }

    width = (iconClicked) ? 47 : 32;
    height = (iconClicked) ? 60 : 32;
  }

  // void setOnMarkerTab(
  //     void Function(Marker? marker, Map<String, int?> iconSize)? callBack) {
  //   onMarkerTab = callBack;
  //   width = 50;
  //   height = 50;
  // }
}

double _generateDoubleRandom(double minValue, double maxValue, int precision) {
  final random = Random(DateTime.now().microsecondsSinceEpoch);
  final boolRandom = random.nextBool();
  final doubleRandom = minValue + (maxValue - minValue) * random.nextDouble();
  // return double.parse(doubleRandom.toStringAsFixed(precision));

  return double.parse(doubleRandom.toStringAsFixed(precision));

  // return double.parse(doubleRandom.toStringAsFixed(precision));
}
