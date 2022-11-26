import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/core/signing_auth_info.dart';
import 'package:withconi/data/provider/platform_provider/platform_auth_api.dart';
import 'package:withconi/data/provider/remote_provider/user_api.dart';
import 'package:withconi/import_basic.dart';

import '../../../core/error_handling/exceptions.dart';
import '../../../core/error_handling/failures.dart';
import '../enums/enum.dart';
import '../model/dto/api_call_dto.dart';
import '../model/dto/request_dto/auth_request/get_duplicated_email_check_request_dto.dart';
import '../model/dto/response_dto/auth_response/email_duplication_check_response_dto.dart';

class PlatformAuthRepository extends GetxService {
  PlatformAuthRepository(this._platformAuthApi);
  final PlatformAuthAPI _platformAuthApi;

  Future<Either<Failure, OAuthCredential>> getGoogleCredential() async {
    try {
      OAuthCredential googleCredential =
          await _platformAuthApi.getGoogleCredential();

      return Right(googleCredential);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  getAppleSignAuthInfo(String _email) async {
    OAuthCredential oAuthCredential =
        await _platformAuthApi.getAppleCredential();
    return CredentialSigningAuthInfo(
        oAuthCredential: oAuthCredential,
        provider: Provider.apple,
        email: _email);
  }

  getEmailAuthInfo(String _email) {
    return EmailPwdSigningAuthInfo(
        password: '', provider: Provider.email, email: _email);
  }

  Future<Either<Failure, SigningAuthInfo>> getGoogleSignAuthInfo(
      String _email) async {
    try {
      OAuthCredential oAuthCredential =
          await _platformAuthApi.getGoogleCredential();

      return Right(CredentialSigningAuthInfo(
          oAuthCredential: oAuthCredential,
          provider: Provider.google,
          email: _email));
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  getKakaoSignAuthInfo(String _email) async {
    String kakaoToken = await _platformAuthApi.getKakaoToken();
    return TokenSigningAuthInfo(
        platformToken: kakaoToken, provider: Provider.kakao, email: _email);
  }

  getNaverSignAuthInfo(String _email) async {
    String naverToken = await _platformAuthApi.getNaverToken();
    return TokenSigningAuthInfo(
        platformToken: naverToken, provider: Provider.naver, email: _email);
  }

  Future<Either<Failure, String>> getEmailFromProvider(
      {required Provider provider}) async {
    try {
      late String _userEmail;
      switch (provider) {
        case Provider.google:
          _userEmail = await _platformAuthApi.getGoogleUserEmail();
          break;
        case Provider.kakao:
          _userEmail = await _platformAuthApi.getKakaoUserEmail();
          break;
        case Provider.naver:
          _userEmail = await _platformAuthApi.getNaverUserEmail();
          break;
        case Provider.apple:
          _userEmail = await _platformAuthApi.getAppleUserEmail();
          break;
        default:
      }

      return Right(_userEmail);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  // Future<Either<Failure, EmailDuplicationCheckResponseDTO>> checkDuplicateUser({
  //   required String email,
  // }) async {
  //   try {
  //     var requestDTO = GetDuplicatedEmailCheckRequestDTO.fromData(email);

  //     ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
  //     final Map<String, dynamic> checkDuplicationData =
  //         await _userApi.checkEmailDuplication(apiCallDTO);

  //     var responseDTO =
  //         EmailDuplicationCheckResponseDTO.fromJson(checkDuplicationData);

  //     return Right(responseDTO);
  //   } on NoInternetConnectionException {
  //     print('NoInternetConnectionException');
  //     return Left(NoConnectionFailure());
  //   } catch (e) {
  //     print('NoUserDataFailure');
  //     return Left(NoUserDataFailure());
  //   }
  // }
}
