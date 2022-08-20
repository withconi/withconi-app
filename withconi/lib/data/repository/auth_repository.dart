import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/token_manager.dart';
import 'package:withconi/controller/auth_controller.dart';

import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/core/error_handling/failures.dart';
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
  final WcCacheManager _tokenManager = WcCacheManager();

  Provider getAuthTokenProvider() => _tokenManager.getTokenProvider();

  Future<Either<Failure, AuthInfo>> getGoogleAuthInfo() async {
    try {
      AuthInfo authInfo = await _api.getGoogleAuthInfo();
      return Right(authInfo);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  // setAuthUserCredential({required UserCredential userCredential}) {
  //   firebaseAuth.signInAnonymously()
  // }
  // Future<Either<Failure, UserState>> getUserState(
  //     {required ProviderOptions provider, String? email}) async {
  //   try {
  //     if (provider == ProviderOptions.email) {
  //       _authInfo = await _api.getEmailAuthInfo(email!);
  //     } else {
  //       switch (provider) {
  //         case ProviderOptions.google:
  //           _authInfo = await _api.getGoogleAuthInfo();
  //           break;
  //         case ProviderOptions.kakao:
  //           _authInfo = await _api.getKakaoAuthInfo();
  //           break;
  //         case ProviderOptions.naver:
  //           _authInfo = await _api.getNaverAuthInfo();
  //           break;
  //         case ProviderOptions.apple:
  //           _authInfo = await _api.getAppleAuthInfo();
  //           break;
  //         default:
  //       }
  //     }

  //     final bool isDuplicateUser =
  //         await _api.checkUserEmail(email: _authInfo.email);

  //     final UserState userState = determineUserState(isDuplicateUser, provider);
  //     return Right(userState);
  //   } on NoInternetConnectionException {
  //     return Left(NoConnectionFailure());
  //   } on PlatformException {
  //     return Left(NoUserDataFailure());
  //   } catch (e) {
  //     return Left(NoUserDataFailure());
  //   }
  // }

  Future<Either<Failure, UserState>> getUserState(
      {required AuthInfo authInfo}) async {
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

  Future<Either<Failure, AuthInfo>> getAuthInfo(
      {required Provider provider, String? email}) async {
    try {
      late AuthInfo _authInfo;
      if (provider == Provider.email) {
        _authInfo = await _api.getEmailAuthInfo(email!);
      } else {
        switch (provider) {
          case Provider.google:
            _authInfo = await _api.getGoogleAuthInfo();
            break;
          case Provider.kakao:
            _authInfo = await _api.getKakaoAuthInfo();
            break;
          case Provider.naver:
            _authInfo = await _api.getNaverAuthInfo();
            break;
          case Provider.apple:
            _authInfo = await _api.getAppleAuthInfo();
            break;
          default:
        }
      }

      return Right(_authInfo);
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
        userState = UserState.SIGN_IN_EMAIL;
      } else if ((provider == Provider.apple) ||
          (provider == Provider.google)) {
        userState = UserState.SIGN_IN_AUTH_CREDENTIAL;
      } else if ((provider == Provider.naver) || (provider == Provider.kakao)) {
        userState = UserState.SIGN_IN_TOKEN;
      } else {
        userState = UserState.NONE;
      }
    } else {
      if (provider == Provider.email) {
        userState = UserState.SIGN_UP_EMAIL;
      } else if (provider == Provider.none) {
        userState = UserState.NONE;
      } else {
        userState = UserState.SIGN_UP_SNS;
      }
    }
    return userState;
  }

  Future<Either<Failure, AuthInfo>> getAppleAuthInfo() async {
    try {
      AuthInfo authInfo = await _api.getAppleAuthInfo();
      return Right(authInfo);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, AuthInfo>> getEmailAuthInfo(email) async {
    try {
      AuthInfo authInfo = await _api.getEmailAuthInfo(email);
      return Right(authInfo);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, AuthInfo>> getKakaoAuthInfo() async {
    try {
      AuthInfo authInfo = await _api.getKakaoAuthInfo();
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

  Future<Either<Failure, AuthInfo>> getNaverAuthInfo() async {
    try {
      AuthInfo authInfo = await _api.getNaverAuthInfo();
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
    return await _api.validateUserByPlatform(provider: provider);
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
      required AuthInfo authInfo}) async {
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
          _authUser = await _api.signInWithCustomToken(authInfo: authInfo);
          break;
        case Provider.naver:
          _authUser =
              await _api.signInWithCustomToken(authInfo: authInfo.authObject);
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
      {required String password, required AuthInfo authInfo}) async {
    late Either<Failure, User?> _authUserEither;
    _authUserEither =
        await _api.signInWithEmail(email: authInfo.email, password: password);

    _authUserEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToDialog(fail, 'signInWithEmail'),
        (userCredential) {
      saveProviderLocalStorage(
        provider: authInfo.provider,
      );
    });
  }

  signInWithAuthCredential({required AuthInfo authInfo}) async {
    showLoading(() async {
      late UserCredential _userCredential;
      await _api.signInWithAuthCredential(credential: authInfo.authObject);
      await saveProviderLocalStorage(
        provider: authInfo.provider,
      );
    });
  }

  signInWithCustomToken({required AuthInfo authInfo}) async {
    late UserCredential _userCredential;
    await _api.signInWithCustomToken(authInfo: authInfo.authObject);
    await saveProviderLocalStorage(
      provider: authInfo.provider,
    );
  }

  saveProviderLocalStorage({
    required Provider provider,
  }) async {
    WcCacheManager().saveProvider(provider);
  }

  Future<Either<Failure, bool>?> sendVerificationEmail(
      {required String email}) async {
    try {
      var acs = ActionCodeSettings(
          // URL you want to redirect back to. The domain (www.example.com) for this
          // URL must be whitelisted in the Firebase Console.
          url:
              'https://withconi.firebaseapp.com/__/auth/action?mode=action&oobCode=code',
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

  checkEmailVerification() {
    // Confirm the link is a sign-in with email link.
    // if (firebaseAuth.isSignInWithEmailLink(emailLink)) {
    //   try {
    //     // The client SDK will parse the code from the link for you.
    //     final userCredential = await FirebaseAuth.instance
    //         .signInWithEmailLink(email: emailAuth, emailLink: emailLink);

    //     // You can access the new user via userCredential.user.
    //     final emailAddress = userCredential.user?.email;

    //     print('Successfully signed in with email link!');
    //   } catch (error) {
    //     print('Error signing in with email link.');
    //   }
    // }
  }

  signOut() async {
    await firebaseAuth.signOut();
  }
}
