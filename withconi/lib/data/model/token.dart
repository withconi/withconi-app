class TokenModel {
  TokenModel({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  final bool success;
  final String expiresAt;
  final String requestToken;

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        success: json["success"],
        expiresAt: json["expires_at"],
        requestToken: json["request_token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "expires_at": expiresAt,
        "request_token": requestToken,
      };
}
