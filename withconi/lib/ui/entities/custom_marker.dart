import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

import '../../data/model/abstract_class/store_type.dart';
import 'location.dart';

class CustomMarker extends Marker {
  final PlacePreviewType place;
  bool isSelected = false;

  // the old way
  CustomMarker({
    required String markerId,
    required this.place,
    required LatLngClass position,
    required String text,
    required int iconWidth,
    required int iconHeight,
    required void Function(Marker? marker, Map<String, int?> iconSize)?
        onTapMarker,
  }) : super(
          markerId: markerId,
          position: position,
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
          PlacePreviewType store,
          void Function(Marker? marker, Map<String, int?> iconSize)?
              onTapMarker) =>
      CustomMarker(
          place: store,
          position: store.location,
          markerId: store.locId,
          text: store.name,
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
