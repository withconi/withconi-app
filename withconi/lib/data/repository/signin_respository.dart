import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';

import 'package:withconi/core/error_handling/failures.dart';

import 'package:withconi/data/provider/remote_provider/signin_api.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import '../../core/signing_auth_info.dart';

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
      await AuthController.to.setUserInfo();
      return true;
    } else {
      return false;
    }
    // await saveProviderLocalStorage(
    //   provider: authInfo.provider,
    // );
  }

  signInWithAuthToken({required TokenSigningAuthInfo authInfo}) async {
    await _api.signInWithCustomToken(customToken: authInfo.platformToken);
    // await saveProviderLocalStorage(
    //   provider: authInfo.provider,
    // );
  }

  // saveProviderLocalStorage({
  //   required Provider provider,
  // }) async {
  //   // await WcTokenManager().saveProvider(provider);
  // }
}
