class VerificationGroup {
  List<Verification> list;
  int chanceLeft;
  bool verified;
  VerificationGroup({
    required this.list,
    required this.chanceLeft,
    required this.verified,
  }) : super();

  factory VerificationGroup.fromJson(Map<String, dynamic>? json) {
    List<Verification> verificationList = [];
    int chanceLeft = 2;
    bool verified = false;
    if (json != null) {
      List<dynamic> list = json['thumbnails'] as List<dynamic>;
      chanceLeft = json['totalChance'] as int;

      verificationList = list
          .map((e) => Verification.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return VerificationGroup(
        list: verificationList, chanceLeft: chanceLeft, verified: verified);
  }
}

class Verification {
  String imageSrc;
  bool isAnswer;
  Verification({required this.imageSrc, required this.isAnswer}) : super();

  factory Verification.fromJson(Map<String, dynamic>? json) {
    late String image;
    late bool answer;
    if (json != null) {
      image = json['thumbnail'] as String;
      answer = json['success'] as bool;
    }
    return Verification(
      imageSrc: image,
      isAnswer: answer,
    );
  }
}
