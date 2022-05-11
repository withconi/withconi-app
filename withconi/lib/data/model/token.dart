class TokenModel {
  TokenModel({
    required this.success,
    required this.expiresIn,
    required this.accessToken,
  });

  final bool success;
  final String expiresIn;
  final String accessToken;

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        success: json["success"],
        expiresIn: json["expiresIn"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "expiresIn": expiresIn,
        "accessToken": accessToken,
      };
}
