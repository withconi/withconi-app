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

  factory PlaceVerificationEntity.fromJson(Map<String, dynamic>? json) {
    List<String> imageList = [];
    int correctIndex = 0;
    if (json != null) {
      List<dynamic> list = json['thumbnails'] as List<dynamic>;

      for (int i = 0; i < list.length; i++) {
        imageList.add(list[i]['thumbnail'] as String);
        if (list[i]['success'] as bool) {
          correctIndex = i;
        }
      }
    }
    return PlaceVerificationEntity(
        imageSrcList: imageList,
        correctImageIndex: correctIndex,
        verified: false,
        chanceLeft: 2);
  }
}
