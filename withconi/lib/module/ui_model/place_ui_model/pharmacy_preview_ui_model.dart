import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/place_response/place_preview_response_dto.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';
import 'package:withconi/module/ui_model/place_ui_model/abstract_class/place_preview_ui.dart';
import 'package:withconi/module/ui_model/latlng_ui_model.dart';

import '../../../core/tools/helpers/calculator.dart';

class PharmacyPreviewUIModel extends Equatable implements PlacePreviewUIModel {
  @override
  String address;

  // @override
  // LatLngUIModel baseLocation;

  @override
  DiseaseType mostVisitedDiseaseType;

  @override
  String name;

  @override
  String phone;

  @override
  String placeId;

  @override
  List<String> overlappedPlaceList;

  @override
  LatLngUIModel placeLocation;

  @override
  ImageItem thumbnailImage;

  @override
  int totalReviews;

  @override
  bool isPhotoReview;

  @override
  bool isBookmarked;

  @override
  PlaceType get placeType => PlaceType.pharmacy;

  @override
  double meterDistance(LatLngUIModel baseLocation) {
    double distanceMeters = baseLocation.distanceTo(placeLocation);
    return distanceMeters;
  }

  @override
  String distanceString(LatLngUIModel baseLocation) {
    String distanceResult = '';

    distanceResult = DistanceCalculator.getDistanceToString(
        distanceMeter: meterDistance(baseLocation));
    return distanceResult;
  }

  PharmacyPreviewUIModel({
    required this.address,
    required this.phone,
    required this.isBookmarked,
    required this.mostVisitedDiseaseType,
    this.overlappedPlaceList = const [],
    required this.name,
    required this.placeId,
    required this.placeLocation,
    required this.thumbnailImage,
    required this.isPhotoReview,
    required this.totalReviews,
  });

  factory PharmacyPreviewUIModel.fromDTO(
      PharmacyPreviewResponseDTO placeDTO, LatLngUIModel baseLocation) {
    return PharmacyPreviewUIModel(
      isBookmarked: placeDTO.isBookmarked,
      totalReviews: placeDTO.totalReviews,
      phone: placeDTO.phone,
      isPhotoReview: placeDTO.isPhotoReview,
      address: placeDTO.address,
      mostVisitedDiseaseType: placeDTO.mostVisitedDiseaseType,
      name: placeDTO.name,
      placeId: placeDTO.placeId,
      placeLocation: LatLngUIModel.fromDto(placeDTO.coordinate),
      thumbnailImage: (placeDTO.thumbnail.isEmpty)
          ? _defaultThumbnailImage
          : ImageItem(
              id: placeDTO.placeId,
              imageUrl: placeDTO.thumbnail,
              imageType: ImageType.network),
    );
  }

  @override
  List<Object?> get props => [placeId, placeLocation, name];
}

ImageItem get _defaultThumbnailImage => ImageItem(
    id: DateTime.now().microsecondsSinceEpoch.toString(),
    imageUrl: 'assets/images/default_thumbnail.png',
    imageType: ImageType.asset);
