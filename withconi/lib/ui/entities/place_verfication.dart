class PlaceVerificationEntity {
  List<String> imageSrcList;
  int correctImageIndex;
  bool verified;
  int chanceLeft;
  PlaceVerificationEntity({
    required this.imageSrcList,
    required this.correctImageIndex,
    required this.verified,
    required this.chanceLeft,
  }) : super();
}
