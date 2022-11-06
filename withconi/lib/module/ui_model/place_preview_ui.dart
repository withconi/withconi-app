import 'package:geolocator/geolocator.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';

import '../../core/tools/helpers/calculator.dart';
import '../../data/enums/enum.dart';
import '../../data/model/abstract_class/place_preview.dart';
import '../../data/model/latlng.dart';
import '../../data/model/dto/response_dto/post_response_dto.dart';

class PlacePreviewUIModel {
  final String placeId;
  final String address;
  final DiseaseType highestDiseaseType;
  final ImageItem thumbnailImage;
  final LatLngClass placeLocation;
  final String name;
  final PlaceType placeType;
  // final String unselectedMarkerImage;
  // final String selectedMarkerImage;
  final String phone;
  LatLngClass baseLocation;
  bool visitVerified;
  final int totalReviews;

  double get meterDistanceBetween {
    double distanceMeters = GeolocatorPlatform.instance.distanceBetween(
      baseLocation.latitude,
      baseLocation.longitude,
      placeLocation.latitude,
      placeLocation.longitude,
    );
    return distanceMeters;
  }

  String get distanceString {
    String distanceResult = '';

    distanceResult = DistanceCalculator()
        .getDistanceToString(distanceMeter: meterDistanceBetween);
    return distanceResult;
  }

  PlacePreviewUIModel({
    required this.address,
    required this.phone,
    required this.baseLocation,
    required this.highestDiseaseType,
    required this.name,
    required this.placeId,
    required this.placeLocation,
    required this.thumbnailImage,
    required this.visitVerified,
    required this.placeType,
    required this.totalReviews,
  });

  factory PlacePreviewUIModel.fromDTO(
      PlacePreview placeDTO, LatLngClass baseLocation) {
    return PlacePreviewUIModel(
      totalReviews: placeDTO.totalReviews,
      phone: placeDTO.phone,
      placeType: placeDTO.placeType,
      visitVerified: placeDTO.isVerified,
      address: placeDTO.address,
      baseLocation: baseLocation,
      highestDiseaseType: DiseaseType.cardiovascular,
      name: placeDTO.name,
      placeId: placeDTO.locId,
      placeLocation: placeDTO.location,
      thumbnailImage: ImageItem(
          id: placeDTO.locId,
          resource: placeDTO.thumbnail,
          imageType: ImageType.network),
    );
  }
}
