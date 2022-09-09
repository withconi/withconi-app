import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';

import '../../data/model/abstract_class/place_type.dart';
import 'location.dart';

class CustomMarker extends Marker {
  final PlacePreviewType place;
  double distance;

  // the old way
  CustomMarker({
    required String markerId,
    required this.place,
    required String text,
    required int iconWidth,
    required int iconHeight,
    required this.distance,
    required void Function(Marker? marker, Map<String, int?> iconSize)?
        onTapMarker,
  }) : super(
          markerId: markerId,
          position: place.location,
          width: iconWidth,
          height: iconHeight,
          captionText: text,
          onMarkerTab: onTapMarker,
        );

  /// for SDK 2.17 and up - the new way
  // CustomMarker(
  //     {required this.store,
  //     required LocationClass position,
  //     width = 30,
  //     height = 45})
  //     : super(
  //           position: store.location,
  //           markerId: store.uid,
  //           captionText: store.storeName);

  factory CustomMarker.fromMyPlace(
          {required PlacePreviewType place,
          required double distance,
          required void Function(Marker? marker, Map<String, int?> iconSize)?
              onTapMarker}) =>
      CustomMarker(
          place: place,
          markerId: place.locId,
          text: place.name,
          distance: distance,
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
