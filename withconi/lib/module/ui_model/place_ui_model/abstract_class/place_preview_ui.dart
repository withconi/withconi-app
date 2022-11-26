import 'package:geolocator/geolocator.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';
import '../../../../data/enums/enum.dart';
import '../../latlng_ui_model.dart';

abstract class PlacePreviewUiModel {
  late String placeId;
  late String address;
  late DiseaseType highestDiseaseType;
  late ImageItem thumbnailImage;
  late LatLngUIModel placeLocation;
  late String name;
  final PlaceType placeType = PlaceType.all;
  late String phone;
  late LatLngUIModel baseLocation;
  late bool visitVerified;
  late int totalReviews;

  double get meterDistance {
    double distanceMeters = GeolocatorPlatform.instance.distanceBetween(
      baseLocation.latitude,
      baseLocation.longitude,
      placeLocation.latitude,
      placeLocation.longitude,
    );
    return distanceMeters;
  }

  String get distanceString => '';
}
