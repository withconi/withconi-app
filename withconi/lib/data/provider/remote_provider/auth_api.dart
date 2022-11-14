import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_naver_login/flutter_naver_login.dart';

import 'package:withconi/core/values/constants/auth_variables.dart';

import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/core/network_handling/network_service.dart';

import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/get_version_check_request_dto.dart';

import '../../../core/error_handling/failures.dart';

class AuthAPI {
  final Api _dio = Api();

  // Future<CustomAuthInfo> getGoogleAuthInfo() async {
  //   try {
  //     late final CustomAuthInfo authInfo;

  //     // Trigger the authentication flow
  //     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //     print(googleSignIn.currentUser);

  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;

  //     // Create a new credential
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );

  //     String? email = googleUser?.email;
  //     authInfo = CustomAuthInfo(
  //         authObject: credential, email: email!, provider: Provider.google);
  //     return authInfo;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<String> getGoogleUserEmail() async {
  //   try {
  //     late final CustomAuthInfo authInfo;

  //     // Trigger the authentication flow
  //     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;

  //     // Create a new credential
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );

  //     String? email = googleUser?.email;

  //     return email!;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  checkAppVersion() async {
    GetVersionCheckRequestDTO requestDTO = GetVersionCheckRequestDTO.fromData();
    ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
    Map<String, dynamic> data = await _dio.apiCall(apiCallDTO);

    return data;
  }

  Future<Either<Failure, User?>> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(NoEmailUserFailure());
      } else if (e.code == 'wrong-password') {
        return Left(WrongPasswordFailure());
      } else {
        return Left(NoUserDataFailure());
      }
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  // validateKakaoToken() {}

  // Future<CustomAuthInfo> getKakaoAuthInfo() async {
  //   late String accessToken;
  //   late CustomAuthInfo authInfo;

  //   try {
  //     kakao.OAuthToken token =
  //         await kakao.UserApi.instance.loginWithKakaoTalk();
  //     print('로그인 성공 ${token.accessToken}');
  //     accessToken = token.accessToken;
  //   } catch (error) {
  //     print('로그인 실패 $error');
  //     accessToken = '';
  //   }
  //   try {
  //     var user = await kakao.UserApi.instance.me();

  //     String? email = user.kakaoAccount?.email;
  //     authInfo = CustomAuthInfo(
  //         authObject: accessToken, email: email!, provider: Provider.kakao);
  //   } catch (e) {
  //     print(e);
  //   }

  //   return authInfo;
  // }

  // Future<String> getKakaoUserEmail() async {
  //   late String? _userEmail;
  //   try {
  //     kakao.OAuthToken token =
  //         await kakao.UserApi.instance.loginWithKakaoTalk();
  //     kakao.TokenManagerProvider.instance.manager.setToken(token);
  //     print('로그인 성공 ${token.accessToken}');
  //   } catch (error) {
  //     print('로그인 실패 $error');
  //   }
  //   try {
  //     var user = await kakao.UserApi.instance.me();

  //     _userEmail = user.kakaoAccount?.email;
  //   } catch (e) {
  //     print(e);
  //   }

  //   return _userEmail!;
  // }

  // Future<String> getKakaoToken() async {
  //   late String _kakaoToken;

  //   try {
  //     kakao.OAuthToken? oAuthToken =
  //         await kakao.TokenManagerProvider.instance.manager.getToken();
  //     _kakaoToken = oAuthToken!.accessToken;
  //   } catch (e) {
  //     print(e);
  //   }

  //   return _kakaoToken;
  // }

  // Future<String> getNaverToken() async {
  //   late String _naverToken;

  //   try {
  //     NaverAccessToken tokenInfo = await FlutterNaverLogin.currentAccessToken;
  //     _naverToken = tokenInfo.accessToken;
  //   } catch (e) {
  //     print(e);
  //   }

  //   return _naverToken;
  // }

  // Future<CustomAuthInfo> getNaverAuthInfo() async {
  //   String accessToken = '';
  //   late final NaverLoginResult result;
  //   late final NaverAccessToken tokenInfo;
  //   late final CustomAuthInfo authInfo;

  //   try {
  //     // await FlutterNaverLogin.isLoggedIn;
  //     if (await FlutterNaverLogin.isLoggedIn) {
  //       tokenInfo = await FlutterNaverLogin.currentAccessToken;
  //       if (tokenInfo.isValid()) {
  //         result = await FlutterNaverLogin.logIn();
  //         print('토큰 유효성 체크 성공 ${tokenInfo.isValid()} ${tokenInfo.expiresAt}');
  //         accessToken = tokenInfo.accessToken;
  //       } else {
  //         print('토큰 유효하지 않음');
  //         result = await FlutterNaverLogin.logIn();

  //         accessToken = result.accessToken.accessToken;
  //         print(result);
  //       }
  //     } else {
  //       print('토큰 유효하지 않음');
  //       result = await FlutterNaverLogin.logIn();
  //       tokenInfo = await FlutterNaverLogin.currentAccessToken;

  //       print(tokenInfo.accessToken);
  //     }
  //     authInfo = CustomAuthInfo(
  //         authObject: tokenInfo.accessToken,
  //         email: result.account.email,
  //         provider: Provider.naver);
  //     return authInfo;
  //   } catch (e) {
  //     print(e);
  //     throw (PlatformSignInException());
  //   }
  // }

  // Future<String> getNaverUserEmail() async {
  //   String _userEmail = '';
  //   late final NaverLoginResult result;
  //   late final NaverAccessToken tokenInfo;
  //   late final CustomAuthInfo authInfo;

  //   try {
  //     // await FlutterNaverLogin.isLoggedIn;
  //     if (await FlutterNaverLogin.isLoggedIn) {
  //       tokenInfo = await FlutterNaverLogin.currentAccessToken;
  //       if (tokenInfo.isValid()) {
  //         result = await FlutterNaverLogin.logIn();
  //         print('토큰 유효성 체크 성공 ${tokenInfo.isValid()} ${tokenInfo.expiresAt}');
  //         // accessToken = tokenInfo.accessToken;
  //       } else {
  //         print('토큰 유효하지 않음');
  //         result = await FlutterNaverLogin.logIn();
  //         // accessToken = result.accessToken.accessToken;
  //         print(result);
  //       }
  //     } else {
  //       print('토큰 유효하지 않음');
  //       result = await FlutterNaverLogin.logIn();
  //       tokenInfo = await FlutterNaverLogin.currentAccessToken;

  //       print(tokenInfo.accessToken);
  //     }

  //     _userEmail = result.account.email;
  //     return _userEmail;
  //   } catch (e) {
  //     print(e);
  //     throw (PlatformSignInException());
  //   }
  // }

  // Future<CustomAuthInfo> getEmailAuthInfo(String email) async {
  //   CustomAuthInfo authInfo = CustomAuthInfo(
  //       authObject: null, email: email, provider: Provider.email);
  //   return authInfo;
  // }

  Future<User?> signInWithCustomToken({required String customToken}) async {
    try {
      UserCredential _userCredential =
          await firebaseAuth.signInWithCustomToken(customToken);
      return _userCredential.user;
    } catch (e) {
      throw SignInTokenException();
    }
  }

  Future<User?> signInWithAuthCredential(
      {required OAuthCredential credential}) async {
    try {
      UserCredential _userCredential =
          await firebaseAuth.signInWithCredential(credential);
      print(firebaseAuth.currentUser);
      return _userCredential.user;
    } catch (e) {
      throw SignInCredentialException();
    }
  }

  Future<Map<String, dynamic>> refreshFirebaseCustomToken(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> customTokenData = await _dio.apiCall(apiCallDTO);

    return customTokenData;
  }

  Future<Map<String, dynamic>> checkEmailDuplication(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> data = await _dio.apiCall(apiCallDTO);

    return data;
  }

  // Future<bool> checkValidUserByPlatform({required Provider provider}) async {
  //   bool userLoggedIn = false;

  //   if (firebaseAuth.currentUser == null) {
  //     userLoggedIn = false;
  //   } else {
  //     userLoggedIn = true;

  //     switch (provider) {
  //       case Provider.none:
  //         break;
  //       case Provider.kakao:
  //         userLoggedIn = await checkKakaoTokenValid();
  //         break;
  //       case Provider.naver:
  //         userLoggedIn = await checkNaverTokenValid();
  //         break;
  //       case Provider.google:
  //         // userLoggedIn = await checkGoogleUserValid();
  //         break;
  //       case Provider.email:
  //         break;
  //       case Provider.apple:
  //         break;

  //       default:
  //     }
  //   }
  //   return userLoggedIn;
  // }

  checkNaverTokenValid() async {
    var tokenInfo = await FlutterNaverLogin.currentAccessToken;
    if (tokenInfo.isValid()) {
      return true;
    } else {
      return false;
    }
  }

  // Future<bool> checkKakaoTokenValid() async {
  //   if (await kakao.AuthApi.instance.hasToken()) {
  //     try {
  //       kakao.AccessTokenInfo tokenInfo =
  //           await kakao.UserApi.instance.accessTokenInfo();

  //       print('토큰 유효성 체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');
  //       if (tokenInfo.expiresIn < 0) {
  //         return false;
  //       } else {
  //         return true;
  //       }
  //     } catch (error) {
  //       if (error is kakao.KakaoException && error.isInvalidTokenError()) {
  //         print('토큰 만료 $error');
  //       } else {
  //         print('토큰 정보 조회 실패 $error');
  //       }

  //       return false;
  //     }
  //   } else {
  //     print('발급된 토큰 없음');
  //     return false;
  //   }
  // }

  // checkGoogleUserValid() async {
  //   final GoogleSignInAccount? googleSignInAccount =
  //       await googleSignIn.signIn();

  //   if (googleSignInAccount != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
