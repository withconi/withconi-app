import 'package:geolocator/geolocator.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_preview_response_dto.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';

import '../../../core/tools/helpers/calculator.dart';

class PharmacyPreviewUIModel implements PlacePreviewUiModel {
  @override
  String address;

  @override
  LatLngUIModel baseLocation;

  @override
  DiseaseType highestDiseaseType;

  @override
  String name;

  @override
  String phone;

  @override
  String placeId;

  @override
  LatLngUIModel placeLocation;

  @override
  ImageItem thumbnailImage;

  @override
  int totalReviews;

  @override
  bool visitVerified;

  @override
  PlaceType get placeType => PlaceType.pharmacy;

  @override
  double get meterDistance {
    double distanceMeters = GeolocatorPlatform.instance.distanceBetween(
      baseLocation.latitude,
      baseLocation.longitude,
      placeLocation.latitude,
      placeLocation.longitude,
    );
    return distanceMeters;
  }

  @override
  String get distanceString {
    String distanceResult = '';

    distanceResult =
        DistanceCalculator.getDistanceToString(distanceMeter: meterDistance);
    return distanceResult;
  }

  PharmacyPreviewUIModel({
    required this.address,
    required this.phone,
    required this.baseLocation,
    required this.highestDiseaseType,
    required this.name,
    required this.placeId,
    required this.placeLocation,
    required this.thumbnailImage,
    required this.visitVerified,
    required this.totalReviews,
  });

  factory PharmacyPreviewUIModel.fromDTO(
      PharmacyPreviewResponseDTO placeDTO, LatLngUIModel baseLocation) {
    return PharmacyPreviewUIModel(
      totalReviews: placeDTO.totalReviews,
      phone: placeDTO.phone,
      visitVerified: placeDTO.visitVerified,
      address: placeDTO.address,
      baseLocation: baseLocation,
      highestDiseaseType: DiseaseType.cardiovacular,
      name: placeDTO.name,
      placeId: placeDTO.placeId,
      placeLocation: LatLngUIModel.fromDto(placeDTO.coordinate),
      thumbnailImage: (placeDTO.thumbnail.isEmpty)
          ? _defaultThumbnailImage
          : ImageItem(
              id: placeDTO.placeId,
              resource: placeDTO.thumbnail,
              imageType: ImageType.network),
    );
  }
}

ImageItem get _defaultThumbnailImage => ImageItem(
    id: DateTime.now().microsecondsSinceEpoch.toString(),
    resource: 'assets/images/default_thumbnail.png',
    imageType: ImageType.asset);
