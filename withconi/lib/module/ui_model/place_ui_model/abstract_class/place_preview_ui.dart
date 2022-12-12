import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';
import '../../../../data/enums/enum.dart';
import '../../latlng_ui_model.dart';

abstract class PlacePreviewUIModel extends Equatable {
  late String placeId;
  late String address;
  late DiseaseType mostVisitedDiseaseType;
  late ImageItem thumbnailImage;
  late LatLngUIModel placeLocation;
  late String name;
  final PlaceType placeType = PlaceType.all;
  late String phone;
  // late LatLngUIModel baseLocation;
  late bool isPhotoReview;
  late int totalReviews;

  double meterDistance(LatLngUIModel baseLocation) {
    double distanceMeters = baseLocation.distanceTo(placeLocation);
    return distanceMeters;
  }

  String distanceString(LatLngUIModel baseLocation) => '';
  @override
  List<Object?> get props => [];
}
