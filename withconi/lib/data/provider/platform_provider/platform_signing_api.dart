import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as kakao;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:withconi/core/error_handling/exceptions.dart';

import '../../../core/values/constants/auth_variables.dart';
import '../../enums/enum.dart';
import '../../../core/tools/helpers/cache_manager.dart';

class PlatformSigningAPI {
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

  Future<OAuthCredential> getGoogleCredential() async {
    try {
      final GoogleSignInAuthentication? googleAuth =
          await googleSignIn.currentUser!.authentication;

      // Create a new credential
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return credential;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getGoogleUserEmail() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      String? email = googleUser?.email;

      return email!;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getKakaoUserEmail() async {
    late String? _userEmail;
    try {
      kakao.OAuthToken token =
          await kakao.UserApi.instance.loginWithKakaoTalk();
      kakao.TokenManagerProvider.instance.manager.setToken(token);
      print('로그인 성공 ${token.accessToken}');
    } catch (error) {
      print('로그인 실패 $error');
    }
    try {
      var user = await kakao.UserApi.instance.me();

      _userEmail = user.kakaoAccount?.email;
    } catch (e) {
      print(e);
    }

    return _userEmail!;
  }

  Future<String> getKakaoToken() async {
    late String _kakaoToken;

    try {
      kakao.OAuthToken? oAuthToken =
          await kakao.TokenManagerProvider.instance.manager.getToken();
      _kakaoToken = oAuthToken!.accessToken;
    } catch (e) {
      print(e);
    }

    return _kakaoToken;
  }

  Future<bool> checkKakaoTokenValid() async {
    if (await kakao.AuthApi.instance.hasToken()) {
      try {
        kakao.AccessTokenInfo tokenInfo =
            await kakao.UserApi.instance.accessTokenInfo();

        print('토큰 유효성 체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');
        if (tokenInfo.expiresIn < 0) {
          return false;
        } else {
          return true;
        }
      } catch (error) {
        if (error is kakao.KakaoException && error.isInvalidTokenError()) {
          print('토큰 만료 $error');
        } else {
          print('토큰 정보 조회 실패 $error');
        }

        return false;
      }
    } else {
      print('발급된 토큰 없음');
      return false;
    }
  }

  Future<String> getNaverToken() async {
    late String _naverToken;

    try {
      NaverAccessToken tokenInfo = await FlutterNaverLogin.currentAccessToken;
      _naverToken = tokenInfo.accessToken;
    } catch (e) {
      print(e);
    }

    return _naverToken;
  }

  Future<String> getNaverUserEmail() async {
    String _userEmail = '';
    NaverLoginResult result;
    NaverAccountResult accountResult;

    try {
      // await FlutterNaverLogin.isLoggedIn;
      if (await FlutterNaverLogin.isLoggedIn) {
        accountResult = await FlutterNaverLogin.currentAccount();
        _userEmail = accountResult.email;
      } else {
        result = await FlutterNaverLogin.logIn();
        _userEmail = result.account.email;
      }

      return _userEmail;
    } catch (e) {
      print(e);
      throw (PlatformSignInException());
    }
  }
}
