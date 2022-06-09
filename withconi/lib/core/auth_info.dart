import 'dart:core';

import '../configs/constants/enum.dart';

class AuthInfo {
  dynamic authObject;
  String email;
  ProviderOptions provider;

  AuthInfo({
    required this.authObject,
    required this.email,
    required this.provider,
  });

  factory AuthInfo.fromJson(Map<String, dynamic> json) {
    return AuthInfo(
      authObject: json['authObject'],
      email: json['email'],
      provider: json['provider'],
    );
  }

  Map<String, dynamic> toJson() => {
        'auth': authObject,
        'email': email,
        'provider': provider,
      };
}
