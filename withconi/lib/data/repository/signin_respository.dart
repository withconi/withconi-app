import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';

import 'package:withconi/core/error_handling/failures.dart';

import 'package:withconi/data/provider/remote_provider/signin_api.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import '../../core/signing_auth_info.dart';
import '../enums/enum.dart';
import '../model/custom_token.dart';
import '../model/dto/api_call_dto.dart';
import '../model/dto/request_dto/signup_request/create_custom_token_request_dto.dart';

class SignInRepository extends GetxController {
  SignInRepository(this._api);
  final SignInAPI _api;

  Future<Either<Failure, User?>> signInWithEmail(
      {required EmailPwdSigningAuthInfo authInfo}) async {
    late Either<Failure, User?> _authUserEither;
    _authUserEither = await _api.signInWithEmailPassword(
        email: authInfo.email, password: authInfo.password);

    // await _authUserEither.fold(
    //     (fail) =>
    //         FailureInterpreter().mapFailureToDialog(fail, 'signInWithEmail'),
    //     (user) async {
    //   // await saveProviderLocalStorage(
    //   //   provider: authInfo.provider,
    //   // );
    // });
    // return;
    return _authUserEither;
  }

  signInWithAuthCredential(
      {required CredentialSigningAuthInfo authInfo}) async {
    User? signInUser = await _api.signInWithAuthCredential(
        credential: authInfo.oAuthCredential);
    if (signInUser != null) {
      await AuthController.to.setUserAuthInfo();
      return true;
    } else {
      return false;
    }
    // await saveProviderLocalStorage(
    //   provider: authInfo.provider,
    // );
  }

  Future<Either<Failure, User>> signInWithAuthToken(
      {required String firebaseCustomToken}) async {
    try {
      User? signInUser =
          await _api.signInWithCustomToken(customToken: firebaseCustomToken);

      if (signInUser != null) {
        return Right(signInUser);
      } else {
        return const Left(NoUserDataFailure());
      }
    } catch (e) {
      return const Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, CustomTokenResponseDTO>> refreshFirebaseCustomToken(
      {required TokenSigningAuthInfo authInfo,
      required Provider provider}) async {
    var requestDTO = CreateCustomTokenRequestDTO.fromData(
        platformToken: authInfo.platformToken, provider: provider);
    var apiDTO =
        ApiCallDTO.fromDTOWithPlatformToken(requestDTO, authInfo.platformToken);
    Map<String, dynamic> customTokenResult =
        await _api.refreshFirebaseCustomToken(apiDTO);

    return Right(CustomTokenResponseDTO.fromJson(customTokenResult));
  }

  // saveProviderLocalStorage({
  //   required Provider provider,
  // }) async {
  //   // await WcTokenManager().saveProvider(provider);
  // }
}
