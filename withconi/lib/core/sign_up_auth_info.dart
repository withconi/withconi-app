import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/enums/enum.dart';
part 'sign_up_auth_info.freezed.dart';

@freezed
class SignUpAuthInfo with _$SignUpAuthInfo {
  const SignUpAuthInfo._(); // This constructor is needed to have custom methods in Freezed.
  const factory SignUpAuthInfo.tokenAuthInfo({
    String? customToken,
    required Provider provider,
    required String email,
  }) = TokenSignUpAuthInfo;
  const factory SignUpAuthInfo.credentialAuthInfo({
    OAuthCredential? oAuthCredential,
    required Provider provider,
    required String email,
  }) = CredentialSignUpAuthInfo;
  const factory SignUpAuthInfo.emailPwdAuthInfo({
    String? password,
    required Provider provider,
    required String email,
  }) = EmailPwdSignUpAuthInfo;
}
