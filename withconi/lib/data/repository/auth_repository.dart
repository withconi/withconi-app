import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/dynamic_link_manager.dart';
import 'package:withconi/configs/helpers/token_manager.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/model/custom_token.dart';
import 'package:withconi/data/provider/auth_api.dart';
import 'package:withconi/data/repository/signup_repository.dart';
import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/widgets/loading.dart';
import '../../configs/constants/auth_variables.dart';
import '../../core/auth_info.dart';
import '../model/conimal.dart';

class AuthRepository extends GetxController {
  final AuthAPI _api = AuthAPI();
  static AuthRepository get to => Get.find<AuthRepository>();
  final SignupRepository _signUpUserRepository = SignupRepository.to;
  final TokenManager _tokenManager = TokenManager();
  final DynamicLinkManager _dynamicLinkManager = DynamicLinkManager();

  Provider getAuthTokenProvider() => _tokenManager.getTokenProvider();

  Future<Either<Failure, CustomAuthInfo>> getGoogleAuthInfo() async {
    try {
      CustomAuthInfo authInfo = await _api.getGoogleAuthInfo();
      return Right(authInfo);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, UserState>> getUserState(
      {required CustomAuthInfo authInfo}) async {
    try {
      final bool isDuplicateUser =
          await _api.checkUserEmail(email: authInfo.email);

      final UserState userState =
          determineUserState(isDuplicateUser, authInfo.provider);
      return Right(userState);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, CustomAuthInfo>> getCustomAuthInfo(
      {required Provider provider, String? email}) async {
    try {
      late CustomAuthInfo _customAuthInfo;
      if (provider == Provider.email) {
        _customAuthInfo = await _api.getEmailAuthInfo(email!);
      } else {
        switch (provider) {
          case Provider.google:
            _customAuthInfo = await _api.getGoogleAuthInfo();
            break;
          case Provider.kakao:
            _customAuthInfo = await _api.getKakaoAuthInfo();
            CustomToken customToken = await _api.getNewCustomToken(
                provider: Provider.kakao, token: _customAuthInfo.authObject);
            _customAuthInfo.email = customToken.accessToken;
            break;
          case Provider.naver:
            _customAuthInfo = await _api.getNaverAuthInfo();
            CustomToken customToken = await _api.getNewCustomToken(
                provider: Provider.kakao, token: _customAuthInfo.authObject);
            _customAuthInfo.email = customToken.accessToken;
            break;
          case Provider.apple:
            _customAuthInfo = await _api.getAppleAuthInfo();
            break;
          default:
        }
      }

      return Right(_customAuthInfo);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  UserState determineUserState(bool isDuplicateUser, Provider provider) {
    UserState userState;
    if (isDuplicateUser) {
      if (provider == Provider.email) {
        userState = UserState.signInEmail;
      } else if ((provider == Provider.apple) ||
          (provider == Provider.google)) {
        userState = UserState.signInAuthCredential;
      } else if ((provider == Provider.naver) || (provider == Provider.kakao)) {
        userState = UserState.signInToken;
      } else {
        userState = UserState.none;
      }
    } else {
      if (provider == Provider.email) {
        userState = UserState.signUpEmail;
      } else if (provider == Provider.none) {
        userState = UserState.none;
      } else {
        userState = UserState.signUpSns;
      }
    }
    return userState;
  }

  Future<Either<Failure, CustomAuthInfo>> getAppleAuthInfo() async {
    try {
      CustomAuthInfo authInfo = await _api.getAppleAuthInfo();
      return Right(authInfo);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, CustomAuthInfo>> getEmailAuthInfo(email) async {
    try {
      CustomAuthInfo authInfo = await _api.getEmailAuthInfo(email);
      return Right(authInfo);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, CustomAuthInfo>> getKakaoAuthInfo() async {
    try {
      CustomAuthInfo authInfo = await _api.getKakaoAuthInfo();
      return Right(authInfo);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      print('getKakaoAuthInfo error');
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, CustomAuthInfo>> getNaverAuthInfo() async {
    try {
      CustomAuthInfo authInfo = await _api.getNaverAuthInfo();
      return Right(authInfo);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } on PlatformSignInException {
      return Left(NaverSigninFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<bool> checkValidUserByPlatform({required Provider provider}) async {
    return await _api.checkValidUserByPlatform(provider: provider);
  }

  Future<Either<Failure, bool>> checkDuplicateUser(
      {required String email, required Provider provider}) async {
    try {
      final bool isDuplicateUser = await _api.checkUserEmail(email: email);
      return Right(isDuplicateUser);
    } on NoInternetConnectionException {
      print('NoInternetConnectionException');
      return Left(NoConnectionFailure());
    } catch (e) {
      print('NoUserDataFailure');
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, User?>> signUp(
      {String? password,
      required List<Conimal> conimalList,
      required CustomAuthInfo authInfo}) async {
    late User? _authUser;

    try {
      switch (authInfo.provider) {
        case Provider.email:
          _authUser = await _api.creatUserWithEmail(
              email: authInfo.email, password: password!);
          break;
        case Provider.google:
          _authUser = await _api.signInWithAuthCredential(
              credential: authInfo.authObject);
          break;
        case Provider.apple:
          _authUser = await _api.signInWithAuthCredential(
              credential: authInfo.authObject);
          break;
        case Provider.kakao:
          CustomToken customToken = await _api.getNewCustomToken(
              provider: authInfo.provider, token: authInfo.authObject);
          _authUser = await _api.signInWithCustomToken(
              customToken: customToken.accessToken);
          break;
        case Provider.naver:
          CustomToken customToken = await _api.getNewCustomToken(
              provider: authInfo.provider, token: authInfo.authObject);
          _authUser = await _api.signInWithCustomToken(
              customToken: customToken.accessToken);
          break;

        default:
      }

      await _signUpUserRepository.signUpUserDB(
          uid: _authUser!.uid,
          authInfo: AuthController.to.authInfo!,
          conimals: conimalList);

      saveProviderLocalStorage(
        provider: authInfo.provider,
      );

      return Right(_authUser);
    } on SignInTokenException {
      return Left(SignInTokenFailure());
    } on SignInCredentialException {
      return Left(SignInCredentialFailure());
    } on CustomFirebaseAuthException catch (e) {
      switch (e.type) {
        case CREATE_EMAIL.accountEnabled:
          return Left(UserEnabledFailure());

        case CREATE_EMAIL.existingEmail:
          return Left(ExistingEmailFailure());
        case CREATE_EMAIL.weakPassword:
          return Left(WeakPasswordFailure());
        default:
          return Left(SignInCredentialFailure());
      }
    } catch (e) {
      return Left(SignInCredentialFailure());
    }
  }

  signInWithEmail(
      {required String password, required CustomAuthInfo authInfo}) async {
    late Either<Failure, User?> _authUserEither;
    _authUserEither =
        await _api.signInWithEmail(email: authInfo.email, password: password);

    await _authUserEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToDialog(fail, 'signInWithEmail'),
        (user) async {
      await saveProviderLocalStorage(
        provider: authInfo.provider,
      );
    });
    return;
  }

  signInWithAuthCredential({required CustomAuthInfo authInfo}) async {
    late UserCredential _userCredential;
    await _api.signInWithAuthCredential(credential: authInfo.authObject);
    await saveProviderLocalStorage(
      provider: authInfo.provider,
    );
  }

  signInWithCustomToken({required CustomAuthInfo authInfo}) async {
    CustomToken customToken = await _api.getNewCustomToken(
        provider: authInfo.provider, token: authInfo.authObject);
    await _api.signInWithCustomToken(customToken: customToken.accessToken);
    await saveProviderLocalStorage(
      provider: authInfo.provider,
    );
  }

  saveProviderLocalStorage({
    required Provider provider,
  }) async {
    await TokenManager().saveProvider(provider);
  }

  Future<Either<Failure, bool>?> sendVerificationEmail(
      {required String email,
      required String currentRoute,
      required String nextRoute}) async {
    try {
      var acs = ActionCodeSettings(
          url: await _dynamicLinkManager.getUrl(
              redirectRoute: Routes.EMAIL_VERIFICATION, nextRoute: nextRoute),
          // This must be true
          handleCodeInApp: true,
          iOSBundleId: 'co.yellowtoast.withconi',
          androidPackageName: 'co.yellowtoast.withconi',
          // installIfNotAvailable
          androidInstallApp: true,
          // minimumVersion
          androidMinimumVersion: '12');

      var emailAuth = email;
      await firebaseAuth.sendSignInLinkToEmail(
          email: emailAuth, actionCodeSettings: acs);
      return Right(true);
    } catch (e) {
      return Left(SignInCredentialFailure());
    }
  }

  signOut() async {
    await firebaseAuth.signOut();
  }
}
