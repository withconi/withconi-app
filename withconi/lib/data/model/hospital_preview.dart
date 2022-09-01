import '../../ui/entities/location.dart';
import 'abstract_class/store_type.dart';

class HospitalPreview implements PlacePreviewType {
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
  final String unselectedMarkerImage = "assets/icons/hospital_unclicked.png";

  @override
  final String selectedMarkerImage = "assets/icons/hospital_clicked.png";

  @override
  final String placeName;

  @override
  final LocationClass location;

  HospitalPreview(
      {required this.uid,
      required this.placeName,
      required this.location,
      required this.address,
      required this.detailInfo,
      required this.snsLink,
      required this.phoneNumber});
}
