import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:withconi/configs/constants/api_url.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/constants/auth_variables.dart';
import 'package:withconi/core/auth_info.dart';
import 'package:withconi/data/model/token.dart';

class AuthAPI {
  final Dio _dio = Dio();

  Future<AuthInfo> signInWithGoogle() async {
    late final AuthInfo authInfo;

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

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
        provider: ProviderOptions.GOOGLE);
    return authInfo;
  }

  Future<UserCredential?> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: email);

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }

  Future<AuthInfo> signInWithKakao() async {
    late String accessToken;
    late AuthInfo authInfo;
    if (await AuthApi.instance.hasToken()) {
      try {
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        print('토큰 유효성 체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');
      } catch (error) {
        if (error is KakaoException && error.isInvalidTokenError()) {
          print('토큰 만료 $error');
        } else {
          print('토큰 정보 조회 실패 $error');
        }

        try {
          // 카카오 계정으로 로그인
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          print('로그인 성공 ${token.accessToken}');
          accessToken = token.accessToken;
        } catch (error) {
          print('로그인 실패 $error');
          accessToken = '';
        }
      }
    } else {
      print('발급된 토큰 없음');
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        print('로그인 성공 ${token.accessToken}');
        accessToken = token.accessToken;
      } catch (error) {
        print('로그인 실패 $error');
        accessToken = '';
      }
    }

    var user = await UserApi.instance.me();
    String? email = user.kakaoAccount?.email;

    authInfo = AuthInfo(
        authObject: accessToken,
        email: email!,
        provider: ProviderOptions.KAKAO);

    return authInfo;
  }

  Future<AuthInfo> signInWithNaver() async {
    late String accessToken;
    late final NaverLoginResult result;
    late final NaverAccessToken tokenInfo;
    late final AuthInfo authInfo;
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
        provider: ProviderOptions.NAVER);
    return authInfo;
  }

  Future<UserCredential?> signInWithCustomToken(
      {required String accessToken, required ProviderOptions provider}) async {
    String customToken =
        await getNewCustomToken(provider: 'kakao', token: accessToken);
    return await FirebaseAuth.instance.signInWithCustomToken(customToken);
  }

  Future<UserCredential?> signInWithCredential(
      {required OAuthCredential credential}) async {
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  getNewCustomToken({required String provider, required String token}) async {
    final response = await _dio.post(
      HttpUrl.SIGN_IN,
      data: {"accessToken": token, "provider": provider},
    );
    // print('[API SUCCESS] ==== ${response.data.toString()}');
    return TokenModel.fromJson(response.data);
  }

  signUpUserDB() {}

  Future<bool> checkDuplicateEmail({required email}) async {
    final response = await _dio.post(
      HttpUrl.VERIFY_EMAIL,
      data: {
        "email": email,
      },
    );
    print('[API SUCCESS] ==== ${response.data.toString()}');

    bool isDuplicateUser = response.data['data']['isAuth'];

    return isDuplicateUser;
    // if (email == 'kjh9519@naver.com') {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  Future<bool> isUserLoggedIn({required ProviderOptions provider}) async {
    late bool _isLoggedIn;

    if (auth.currentUser == null || provider == ProviderOptions.NONE) {
      _isLoggedIn = false;
    } else {
      switch (provider) {
        case ProviderOptions.KAKAO:
          break;
        case ProviderOptions.NAVER:
          _isLoggedIn = await FlutterNaverLogin.isLoggedIn;
          break;
        case ProviderOptions.GOOGLE:
          GoogleSignInAccount? googleSignInAccount =
              await googleSignIn.signIn();
          (googleSignInAccount != null)
              ? _isLoggedIn = true
              : _isLoggedIn = false;
          break;
        case ProviderOptions.EMAIL:
          break;
        case ProviderOptions.APPLE:
          break;

        default:
      }
    }
    return _isLoggedIn;
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

  Future<AuthInfo> signInWithApple() async {
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
        provider: ProviderOptions.APPLE);

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return authInfo;
  }
}
