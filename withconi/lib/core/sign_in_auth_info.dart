// import 'dart:core';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import '../data/enums/enum.dart';

// class CustomAuthInfo {
//   String email;
//   Provider provider;
//   dynamic authObject;

//   CustomAuthInfo({
//     required this.email,
//     required this.provider,
//     this.authObject,
//   });
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/enums/enum.dart';
part 'sign_in_auth_info.freezed.dart';

@freezed
class SignInAuthInfo with _$SignInAuthInfo {
  const SignInAuthInfo._(); // This constructor is needed to have custom methods in Freezed.
  const factory SignInAuthInfo.tokenSignInAuthInfo(
    String customToken,
    Provider provider,
    String email,
  ) = TokenSignInAuthInfo;
  const factory SignInAuthInfo.credentialSignInAuthInfo(
    OAuthCredential oAuthCredential,
    Provider provider,
    String email,
  ) = CredentialSignInAuthInfo;
  const factory SignInAuthInfo.emailPwdAuthInfo(
    String password,
    Provider provider,
    String email,
  ) = EmailPwdSignInAuthInfo;
}

// class TokenAuthInfo extends CustomAuthInfo {
//   String accessToken;

//   TokenAuthInfo(
//       {required this.accessToken,
//       required String email,
//       required Provider provider})
//       : super(email: email, provider: provider, authObject: accessToken);
// }

// class CredentialAuthInfo extends CustomAuthInfo {
//   OAuthCredential oAuthCredential;

//   CredentialAuthInfo({required this.oAuthCredential, required String email})
//       : super(
//           email: email,
//           provider: (oAuthCredential.providerId == 'apple.com')
//               ? Provider.apple
//               : Provider.google,
//           authObject: oAuthCredential,
//         );
// }

// class EmailPwdAuthInfo extends CustomAuthInfo {
//   String password;
//   EmailPwdAuthInfo({required this.password, required String email})
//       : super(
//           email: email,
//           provider: Provider.email,
//           authObject: password,
//         );
// }
