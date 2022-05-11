import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:withconi/configs/constants/constants.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/data/model/token.dart';

class AuthAPI {
  final Dio _dio = Get.find<Dio>();

  Future<UserCredential> signInWithGoogle() async {
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

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential?> signUpWithEmail() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: 'emailAddress',
        password: 'password',
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<UserCredential?> signInWithEmail() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'emailAddress', password: 'password');
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  signInWithToken() async {
    try {
      // 카카오 계정으로 로그인
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      print('로그인 성공 ${token.accessToken}');
    } catch (error) {
      print('로그인 실패 $error');
    }
  }

  validateProviderToken({required ProviderOptions provider}) async {
    switch (provider) {
      case ProviderOptions.KAKAO:
        if (await AuthApi.instance.hasToken()) {
          try {
            AccessTokenInfo tokenInfo =
                await UserApi.instance.accessTokenInfo();
            print('토큰 유효성 체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');
          } catch (error) {
            if (error is KakaoException && error.isInvalidTokenError()) {
              print('토큰 만료 $error');
            } else {
              print('토큰 정보 조회 실패 $error');
            }
          }
        } else {
          print('발급된 토큰 없음');
        }
        break;

      case ProviderOptions.NAVER:
        break;
      default:
    }
  }

  validateCustomToken() {}

  Future<TokenModel> newCustomToken(
      {required String provider, required String token}) async {
    final response = await _dio.get(
      '/authentication/token/new/',
      queryParameters: {
        "api_key": Constants.WITHCONI_DB_API_KEY,
      },
    );
    // print('[API SUCCESS] ==== ${response.data.toString()}');
    return TokenModel.fromJson(response.data);
  }

  signInWithCustomToken() {}

  createUserDB() {}

  checkDuplicateEmail() {}

  Future<TokenModel> validateWithLogin({
    required String email,
    required String password,
    required String token,
  }) async {
    final response = await _dio.post(
      '/authentication/token/validate_with_login',
      queryParameters: {
        "api_key": Constants.WITHCONI_DB_API_KEY,
      },
      data: {
        "email": email,
        "password": password,
        "request_token": token,
      },
    );
    return TokenModel.fromJson(response.data);
  }

  bool isUserLoggedIn({required ProviderOptions provider}) {
    switch (provider) {
      case ProviderOptions.NONE:
        break;
      case ProviderOptions.KAKAO:
        break;
      case ProviderOptions.NAVER:
        break;
      case ProviderOptions.GOOGLE:
        break;
      case ProviderOptions.EMAIL:
        break;
      case ProviderOptions.APPLE:
        break;

      default:
    }
    return true;
  }
}
