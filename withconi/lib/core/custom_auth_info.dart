import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../configs/constants/enum.dart';

class CustomAuthInfo {
  String email;
  Provider provider;
  dynamic authObject;

  CustomAuthInfo({
    required this.email,
    required this.provider,
    this.authObject,
  });
}

class TokenAuthInfo extends CustomAuthInfo {
  String accessToken;

  TokenAuthInfo(
      {required this.accessToken,
      required String email,
      required Provider provider})
      : super(email: email, provider: provider, authObject: accessToken);
}

class CredentialAuthInfo extends CustomAuthInfo {
  OAuthCredential oAuthCredential;

  CredentialAuthInfo({required this.oAuthCredential, required String email})
      : super(
          email: email,
          provider: (oAuthCredential.providerId == 'apple.com')
              ? Provider.apple
              : Provider.google,
          authObject: oAuthCredential,
        );
}

class EmailPwdAuthInfo extends CustomAuthInfo {
  String password;
  EmailPwdAuthInfo({required this.password, required String email})
      : super(
          email: email,
          provider: Provider.email,
          authObject: password,
        );
}
