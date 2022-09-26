import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:withconi/core/error_handling/exceptions.dart';

import '../../configs/constants/enum.dart';
import '../../configs/helpers/cache_manager.dart';
import '../../core/custom_auth_info.dart';

class AppleAPI {
  Future<String> getAppleUserEmail() async {
    try {
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      String? email = appleCredential.email;
      await CacheManager().saveCache(
          CacheControllerKey.accessToken, appleCredential.authorizationCode);
      await CacheManager().saveCache(
          CacheControllerKey.appleIdToken, appleCredential.identityToken);

      if (email != null) {
        log('애플에서 이메일 local storage 저장');
        await CacheManager().saveCache(CacheControllerKey.email, email);
        email = CacheManager().getCache(CacheControllerKey.email);
        log('local storage 이메일 저장 결과 : $email');
      } else {
        log('애플에서 이메일 가져올 수 없음, local storage 탐색');
        email = CacheManager().getCache(CacheControllerKey.email);
        log('local storage 내 이메일 탐색 결과 : $email');
      }

      return email;
    } catch (e) {
      throw PlatformException();
    }
  }

  Future<OAuthCredential> getAppleCredential() async {
    String identityToken =
        CacheManager().getCache(CacheControllerKey.appleIdToken);

    String accessToken =
        CacheManager().getCache(CacheControllerKey.accessToken);
    OAuthCredential oauthCredential = OAuthProvider("apple.com").credential(
      idToken: identityToken,
      accessToken: accessToken,
    );

    return oauthCredential;
  }
}
