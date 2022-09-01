import '../../ui/entities/location.dart';
import 'abstract_class/store_type.dart';

class PharmacyPreview implements PlacePreviewType {
  @override
  final String uid;

  @override
  final String address;

  @override
  final String detailInfo;

  @override
  final String phoneNumber;

  @override
  final String snsLink;

  @override
  final String unselectedMarkerImage = "assets/icons/pharmacy_unclicked.png";

  @override
  final String selectedMarkerImage = "assets/icons/pharmacy_clicked.png";

  @override
  final String placeName;

  @override
  final LocationClass location;

  PharmacyPreview(
      {required this.uid,
      required this.placeName,
      required this.location,
      required this.address,
      required this.detailInfo,
      required this.snsLink,
      required this.phoneNumber});
}
