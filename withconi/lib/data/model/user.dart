class UserModel {
  String email;
  String name;
  String accessToken;
  String refreshToken;

  UserModel(
      {required this.email,
      required this.name,
      required this.accessToken,
      required this.refreshToken});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        name: json['name'],
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken']);
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      };
}
