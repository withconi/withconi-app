import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/data/model/custom_token.dart';
import 'package:withconi/data/model/dto/request_dto/signup_request/create_custom_token_request_dto.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/ui_model/signup_user_ui_model.dart';

import '../../core/error_handling/exceptions.dart';
import '../../core/error_handling/failures.dart';
import '../../core/signing_auth_info.dart';
import '../../core/values/constants/auth_variables.dart';
import '../../module/ui_model/user_ui_model.dart';
import '../enums/enum.dart';
import '../model/dto/api_call_dto.dart';
import '../model/dto/request_dto/signup_request/create_user_db_request_dto.dart';
import '../provider/remote_provider/signup_api.dart';

class SignUpRepository extends GetxService {
  SignUpRepository(this._api);
  final SignupAPI _api;

  Future<Either<Failure, Map<String, dynamic>>> signUpUserDB(
      {required SignUpDataModel signUpData,
      required String firebaseUid,
      String? profileUploadRef}) async {
    try {
      CreateSignUpDBRequestDTO reqeustDTO = CreateSignUpDBRequestDTO.fromData(
          data: signUpData,
          firebaseUid: firebaseUid,
          photoRef: profileUploadRef);
      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(reqeustDTO);
      Map<String, dynamic> newUserId = await _api.signUpDB(apiCallDTO);
      return Right(newUserId);
    } catch (e) {
      return Left(SignInTokenFailure());
    }
  }

  Future<Either<Failure, User?>> signUpWithFirebaseToken(
      {required String firebaseToken}) async {
    Either<Failure, User?> signUpResult =
        await _api.signUpWithCustomToken(customToken: firebaseToken);

    return signUpResult;
  }

  Future<Either<Failure, User?>> signUpWithEmailPwd(
      {required String email, required String password}) async {
    Either<Failure, User?> signUpResult =
        await _api.signUpWithEmailPassword(email: email, password: password);

    return signUpResult;
  }

  Future<Either<Failure, User?>> signUpWithCredential(
      {required OAuthCredential oAuthCredential}) async {
    Either<Failure, User?> signUpResult =
        await _api.signUpWithAuthCredential(credential: oAuthCredential);

    return signUpResult;
  }

  Future<Either<Failure, CustomTokenResponseDTO>> createFirebaseCustomToken(
      {required String platformToken, required Provider provider}) async {
    var requestDTO = CreateCustomTokenRequestDTO.fromData(
        platformToken: platformToken, provider: provider);
    var apiDTO = ApiCallDTO.fromDTOWithPlatformToken(requestDTO, platformToken);
    Map<String, dynamic> signUpResult =
        await _api.createFirebaseCustomToken(apiDTO);

    return Right(CustomTokenResponseDTO.fromJson(signUpResult));
  }
}
