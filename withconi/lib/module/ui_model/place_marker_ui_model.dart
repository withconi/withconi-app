import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:withconi/module/ui_model/place_preview_ui.dart';

class PlaceMarkerUIModel extends Marker {
  final PlacePreviewUIModel place;
  final double distanceMeter;

  // the old way
  PlaceMarkerUIModel({
    required String markerId,
    required this.place,
    required String text,
    required int iconWidth,
    required int iconHeight,
    required this.distanceMeter,
    required void Function(Marker? marker, Map<String, int?> iconSize)?
        onTapMarker,
  }) : super(
          markerId: markerId,
          position: place.placeLocation,
          width: iconWidth,
          height: iconHeight,
          captionText: text,
          onMarkerTab: onTapMarker,
        );

  factory PlaceMarkerUIModel.fromMyPlace(
          {required PlacePreviewUIModel place,
          required void Function(Marker? marker, Map<String, int?> iconSize)?
              onTapMarker}) =>
      PlaceMarkerUIModel(
          distanceMeter: place.meterDistanceBetween,
          place: place,
          markerId: place.placeId,
          text: place.name,
          iconWidth: 30,
          iconHeight: 30,
          onTapMarker: onTapMarker);

  Future<void> setImageIcon(
      {String? assetName, int? iconHeight, int? iconWidth}) async {
    icon = await OverlayImage.fromAssetImage(
      assetName: assetName ?? place.unselectedMarkerImage,
    );

    width = iconWidth ?? 30;
    height = iconHeight ?? 30;
  }

  void setOnMarkerTab(
      void Function(Marker? marker, Map<String, int?> iconSize)? callBack) {
    onMarkerTab = callBack;
  }
}
