import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/import_basic.dart';

import '../../../core/values/constants/auth_variables.dart';
import '../../enums/enum.dart';
import '../../../core/tools/helpers/cache_manager.dart';

class PlatformAuthAPI extends GetxService {
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
      String? name = appleCredential.givenName;
      await CacheManager.saveCache(
          CacheControllerKey.accessToken, appleCredential.authorizationCode);
      await CacheManager.saveCache(
          CacheControllerKey.appleIdToken, appleCredential.identityToken);

      if (name != null) {
        await CacheManager.saveCache(CacheControllerKey.name, name);
      }
      if (email != null) {
        log('애플에서 이메일 local storage 저장');
        await CacheManager.saveCache(CacheControllerKey.appleEmail, email);
        await CacheManager.saveCache(CacheControllerKey.name, name);
        // email = CacheManager.getCache(CacheControllerKey.appleEmail);
        // idToken = CacheManager.getCache(CacheControllerKey.appleIdToken);
        log('local storage 이메일 저장 결과 : $email');
        // log('local storage apple 토큰 저장 결과 : $idToken');
      } else {
        log('애플에서 이메일 가져올 수 없음, local storage 탐색');
        email = CacheManager.getCache(CacheControllerKey.appleEmail);
        name = CacheManager.getCache(CacheControllerKey.name);
        log('local storage 내 이메일 탐색 결과 : $email');
        log('local storage 내 이름 탐색 결과 : $name');

        if (email == null || name == null) {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithCredential(OAuthProvider("apple.com").credential(
            idToken: appleCredential.identityToken,
            accessToken: appleCredential.authorizationCode,
          ));
          email = userCredential.user?.email;
          name = userCredential.user?.displayName;
          await CacheManager.saveCache(CacheControllerKey.name, name);
        }
      }

      if (email != null) {
        await CacheManager.saveCache(CacheControllerKey.appleEmail, email);
      }

      return email ?? '';
    } catch (e) {
      throw PlatformException();
    }
  }

  Future<OAuthCredential> getAppleCredential() async {
    String? identityToken =
        CacheManager.getCache(CacheControllerKey.appleIdToken);

    String? accessToken = CacheManager.getCache(CacheControllerKey.accessToken);

    if (identityToken == null || accessToken == null) {
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      identityToken = appleCredential.identityToken;
      accessToken = appleCredential.authorizationCode;
    }

    OAuthCredential oauthCredential = OAuthProvider("apple.com").credential(
      idToken: identityToken,
      accessToken: accessToken,
    );

    return oauthCredential;
  }

  Future<OAuthCredential> getGoogleCredential() async {
    try {
      late GoogleSignInAuthentication? googleAuth;
      GoogleSignInAccount? googleSignInAccount = googleSignIn.currentUser;
      if (googleSignInAccount != null) {
        googleAuth = await googleSignIn.currentUser!.authentication;
      } else {
        googleSignInAccount = await googleSignIn.signIn();
        if (googleSignInAccount != null) {
          googleAuth = await googleSignIn.currentUser!.authentication;
        } else {
          throw (NoUserException());
        }
      }

      String? name = googleSignIn.currentUser!.displayName;
      if (name != null) {
        await CacheManager.saveCache(CacheControllerKey.name, name);
      }

      // if (googleSignInAccount != null && googleAuth != null) {

      // }

      // if (googleSignIn.currentUser != null) {
      //   String? name = googleSignIn.currentUser!.displayName;
      //   if (name != null) {
      //     await CacheManager.saveCache(CacheControllerKey.name, name);
      //   }
      // }

      // Create a new credential
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return credential;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getGoogleUserEmail() async {
    try {
      // Trigger the authentication flow
      late final String? email;

      if (await googleSignIn.isSignedIn()) {
        email = googleSignIn.currentUser!.email;
      } else {
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        email = googleUser!.email;
      }

      return email;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getKakaoUserEmail() async {
    String? _userEmail;
    bool kakaoInstalled = await kakao.isKakaoTalkInstalled();

    if (kakaoInstalled) {
      try {
        kakao.OAuthToken token =
            await kakao.UserApi.instance.loginWithKakaoTalk();
        kakao.TokenManagerProvider.instance.manager.setToken(token);
        print('로그인 성공 ${token.accessToken}');
        try {
          var user = await kakao.UserApi.instance.me();
          _userEmail = user.kakaoAccount?.email;
        } catch (e) {
          return null;
        }
      } catch (e) {
        try {
          print('기기에 카카오톡 없음');
          kakao.OAuthToken token =
              await kakao.UserApi.instance.loginWithKakaoAccount();
          kakao.TokenManagerProvider.instance.manager.setToken(token);
          var user = await kakao.UserApi.instance.me();
          _userEmail = user.kakaoAccount?.email;
        } catch (e) {
          return null;
        }
      }
    } else {
      try {
        print('기기에 카카오톡 없음');
        kakao.OAuthToken token =
            await kakao.UserApi.instance.loginWithKakaoAccount();
        kakao.TokenManagerProvider.instance.manager.setToken(token);
        var user = await kakao.UserApi.instance.me();
        _userEmail = user.kakaoAccount?.email;
      } catch (e) {
        return null;
      }
    }

    return _userEmail;
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
