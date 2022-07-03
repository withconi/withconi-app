import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as kakao;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:withconi/configs/constants/api_url.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/constants/auth_variables.dart';
import 'package:withconi/configs/helpers/extension.dart';
import 'package:withconi/core/auth_info.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/data/model/custom_token.dart';

import '../model/user.dart';

class AuthAPI {
  final Api _dio = Api();

  Future<AuthInfo> getGoogleAuthInfo() async {
    try {
      late final AuthInfo authInfo;

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      String? email = googleUser?.email;
      authInfo = AuthInfo(
          authObject: credential,
          email: email!,
          provider: ProviderOptions.google);
      return authInfo;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential?> signInWithEmail(
      {required String email, required String password}) async {
    try {
      try {
        final credential = await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: email);

        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  validateKakaoToken() {}

  Future<AuthInfo> getKakaoAuthInfo() async {
    late String accessToken;
    late AuthInfo authInfo;
    // if (await checkKakaoTokenValid()) {
    //   OAuthToken token = await AuthApi.instance.issueAccessToken();
    // } else {
    //   print('발급된 토큰 없음');
    //   try {
    //     OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
    //     print('로그인 성공 ${token.accessToken}');
    //     accessToken = token.accessToken;
    //   } catch (error) {
    //     print('로그인 실패 $error');
    //     accessToken = '';
    //   }
    // }

    try {
      OAuthToken token = await kakao.UserApi.instance.loginWithKakaoAccount();
      print('로그인 성공 ${token.accessToken}');
      accessToken = token.accessToken;
    } catch (error) {
      print('로그인 실패 $error');
      accessToken = '';
    }
    try {
      var user = await kakao.UserApi.instance.me();

      String? email = user.kakaoAccount?.email;
      authInfo = AuthInfo(
          authObject: accessToken,
          email: email!,
          provider: ProviderOptions.kakao);
    } catch (e) {
      print(e);
    }

    return authInfo;
  }

  Future<AuthInfo> getNaverAuthInfo() async {
    late String accessToken;
    late final NaverLoginResult result;
    late final NaverAccessToken tokenInfo;
    late final AuthInfo authInfo;

    try {
      if (await FlutterNaverLogin.isLoggedIn) {
        tokenInfo = await FlutterNaverLogin.currentAccessToken;
        if (tokenInfo.isValid()) {
          print('토큰 유효성 체크 성공 ${tokenInfo.isValid()} ${tokenInfo.expiresAt}');
          accessToken = tokenInfo.accessToken;
        } else {
          print('토큰 유효하지 않음');
          result = await FlutterNaverLogin.logIn();
          accessToken = result.accessToken.accessToken;
        }
      } else {
        print('토큰 유효하지 않음');
        result = await FlutterNaverLogin.logIn();
      }
      authInfo = AuthInfo(
          authObject: accessToken,
          email: result.account.email,
          provider: ProviderOptions.naver);
      return authInfo;
    } catch (e) {
      print(e);
      throw (PlatformSignInException());
    }
  }

  Future<AuthInfo> getEmailAuthInfo(String email) async {
    AuthInfo authInfo = AuthInfo(
        authObject: null, email: email, provider: ProviderOptions.email);
    return authInfo;
  }

  Future<UserCredential> signInWithCustomToken(
      {required AuthInfo authInfo}) async {
    try {
      String customToken = await getNewCustomToken(
          provider: authInfo.provider, token: authInfo.authObject);
      return await firebaseAuth.signInWithCustomToken(customToken);
    } catch (e) {
      throw SignInTokenException();
    }
  }

  Future<UserCredential> creatUserWithEmail(
      {required String email, required String password}) async {
    try {
      return await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw SignInCredentialException();
    }
  }

  Future<UserCredential> signInWithCredential(
      {required AuthCredential credential}) async {
    try {
      return await firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      throw SignInCredentialException();
    }
  }

  Future<String?> signUpDB(WcUser user) async {
    print('user toJson 결과 => ${user.toJson()} ');
    Map<String, dynamic> data = await _dio.apiCall(
      url: HttpUrl.SIGN_UP,
      queryParameters: null,
      body: user.toJson(),
      requestType: RequestType.POST,
    );

    // return data['uid'];
  }

  getNewCustomToken(
      {required ProviderOptions provider, required String token}) async {
    Map<String, dynamic> data = await _dio.apiCall(
      url: HttpUrl.GET_CUSTOM_TOKEN,
      header: {"accessToken": token},
      queryParameters: null,
      body: {"provider": provider.toShortString()},
      requestType: RequestType.POST,
    );
    CustomToken customToken = CustomToken.fromJson(data);
    return customToken;
  }

  Future<bool> checkUserEmail({required email}) async {
    late bool isDuplicateUser;
    Map<String, dynamic> data = await _dio.apiCall(
      url: HttpUrl.VERIFY_EMAIL,
      queryParameters: null,
      body: {
        "email": email,
      },
      requestType: RequestType.POST,
    );
    if (data['isAuth'] && data['isDB']) {
      isDuplicateUser = true;
    } else {
      isDuplicateUser = false;
    }

    return isDuplicateUser;
  }

  Future<bool> isUserLoggedIn({required ProviderOptions provider}) async {
    bool userLoggedIn = false;

    if (firebaseAuth.currentUser == null) {
      userLoggedIn = false;
    } else {
      userLoggedIn = true;

      switch (provider) {
        case ProviderOptions.kakao:
          userLoggedIn = await checkKakaoTokenValid();
          break;
        case ProviderOptions.naver:
          userLoggedIn = await checkNaverTokenValid();
          break;
        case ProviderOptions.google:
          userLoggedIn = await checkGoogleUserValid();
          break;
        case ProviderOptions.email:
          break;
        case ProviderOptions.apple:
          break;

        default:
      }
    }
    return userLoggedIn;
  }

  checkNaverTokenValid() async {
    var tokenInfo = await FlutterNaverLogin.currentAccessToken;
    if (tokenInfo.isValid()) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkKakaoTokenValid() async {
    if (await AuthApi.instance.hasToken()) {
      try {
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();

        print('토큰 유효성 체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');
        if (tokenInfo.expiresIn < 0) {
          return false;
        } else {
          return true;
        }
      } catch (error) {
        if (error is KakaoException && error.isInvalidTokenError()) {
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

  checkGoogleUserValid() {
    var googleSignInAccount = googleSignIn.currentUser;
    if (googleSignInAccount == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<AuthInfo> getAppleAuthInfo() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    late final AuthInfo authInfo;

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
    authInfo = AuthInfo(
        authObject: oauthCredential,
        email: appleCredential.email!,
        provider: ProviderOptions.apple);

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return authInfo;
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
