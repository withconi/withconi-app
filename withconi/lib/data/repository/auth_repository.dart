import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/dynamic_link_manager.dart';
import 'package:withconi/configs/helpers/token_manager.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/provider/apple_api.dart';
import 'package:withconi/data/provider/auth_api.dart';
import 'package:withconi/data/provider/google_api.dart';
import 'package:withconi/data/provider/kakao_api.dart';
import 'package:withconi/data/provider/naver_api.dart';
import 'package:withconi/import_basic.dart';
import '../../configs/constants/auth_variables.dart';
import '../../core/custom_auth_info.dart';
import '../model/user.dart';

class AuthRepository extends GetxController {
  final AuthAPI _api = AuthAPI();
  final GoogleAPI _googleApi = GoogleAPI();
  final KakaoAPI _kakaoApi = KakaoAPI();
  final NaverAPI _naverApi = NaverAPI();
  final AppleAPI _appleAPI = AppleAPI();
  static AuthRepository get to => Get.find<AuthRepository>();
  final WcTokenManager _tokenManager = WcTokenManager();
  final DynamicLinkManager _dynamicLinkManager = DynamicLinkManager();

  Provider get getAuthTokenProvider => _tokenManager.getTokenProvider();

  Future<Either<Failure, bool>> checkAppVersion() async {
    try {
      Map<String, dynamic> result = await _api.checkAppVersion();
      return Right(result['success'] as bool);
    } catch (e) {
      return Left(VersionCheckFailure());
    }
  }

  Future<Either<Failure, String>> getEmailFromProvider(
      {required Provider provider}) async {
    try {
      late String _userEmail;
      switch (provider) {
        case Provider.google:
          _userEmail = await _googleApi.getGoogleUserEmail();
          break;
        case Provider.kakao:
          _userEmail = await _kakaoApi.getKakaoUserEmail();
          break;
        case Provider.naver:
          _userEmail = await _naverApi.getNaverUserEmail();
          break;
        case Provider.apple:
          _userEmail = await _appleAPI.getAppleUserEmail();
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

  // Future<Either<Failure, CustomAuthInfo>> getAppleAuthInfo() async {
  //   try {
  //     CustomAuthInfo authInfo = await _api.getAppleAuthInfo();
  //     return Right(authInfo);
  //   } on NoInternetConnectionException {
  //     return Left(NoConnectionFailure());
  //   } on PlatformException {
  //     return Left(NoUserDataFailure());
  //   } catch (e) {
  //     return Left(NoUserDataFailure());
  //   }
  // }

  // Future<Either<Failure, CustomAuthInfo>> getEmailAuthInfo(email) async {
  //   try {
  //     CustomAuthInfo authInfo = await _api.getEmailAuthInfo(email);
  //     return Right(authInfo);
  //   } on NoInternetConnectionException {
  //     return Left(NoConnectionFailure());
  //   } on PlatformException {
  //     return Left(NoUserDataFailure());
  //   } catch (e) {
  //     return Left(NoUserDataFailure());
  //   }
  // }

  // Future<Either<Failure, CustomAuthInfo>> getKakaoAuthInfo() async {
  //   try {
  //     CustomAuthInfo authInfo = await _api.getKakaoAuthInfo();
  //     return Right(authInfo);
  //   } on NoInternetConnectionException {
  //     return Left(NoConnectionFailure());
  //   } on PlatformException {
  //     return Left(NoUserDataFailure());
  //   } catch (e) {
  //     print('getKakaoAuthInfo error');
  //     return Left(NoUserDataFailure());
  //   }
  // }

  // Future<Either<Failure, CustomAuthInfo>> getNaverAuthInfo() async {
  //   try {
  //     CustomAuthInfo authInfo = await _api.getNaverAuthInfo();
  //     return Right(authInfo);
  //   } on NoInternetConnectionException {
  //     return Left(NoConnectionFailure());
  //   } on PlatformException {
  //     return Left(NoUserDataFailure());
  //   } on PlatformSignInException {
  //     return Left(NaverSigninFailure());
  //   } catch (e) {
  //     return Left(NoUserDataFailure());
  //   }
  // }

  // Future<bool> checkValidUserByPlatform({required Provider provider}) async {
  //   return await _api.checkValidUserByPlatform(provider: provider);
  // }

  Future<Either<Failure, bool>> checkDuplicateUser({
    required String email,
  }) async {
    try {
      final bool isDuplicateUser =
          await _api.checkUserEmailDuplicate(email: email);
      return Right(isDuplicateUser);
    } on NoInternetConnectionException {
      print('NoInternetConnectionException');
      return Left(NoConnectionFailure());
    } catch (e) {
      print('NoUserDataFailure');
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, String>> signUpFirebaseAuth(
      {required CustomAuthInfo authInfo}) async {
    late User? _authUser;

    try {
      switch (authInfo.provider) {
        case Provider.email:
          _authUser = await _api.creatUserWithEmailPassword(
              email: authInfo.email, password: authInfo.authObject);
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
          _authUser = await _api.signInWithCustomToken(
              customToken: authInfo.authObject);
          break;
        case Provider.naver:
          _authUser = await _api.signInWithCustomToken(
              customToken: authInfo.authObject);
          break;

        default:
      }

      return Right(_authUser!.uid);
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
    _authUserEither = await _api.signInWithEmailPassword(
        email: authInfo.email, password: password);

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

  signInWithAuthCredential({required CredentialAuthInfo authInfo}) async {
    await _api.signInWithAuthCredential(credential: authInfo.oAuthCredential);
    await saveProviderLocalStorage(
      provider: authInfo.provider,
    );
  }

  // signInWithCustomToken({required CustomAuthInfo authInfo}) async {
  //   CustomToken customToken = await _api.getNewCustomToken(
  //       provider: authInfo.provider, token: authInfo.authObject);
  //   await _api.signInWithCustomToken(customToken: customToken.accessToken);
  //   await saveProviderLocalStorage(
  //     provider: authInfo.provider,
  //   );
  // }

  saveProviderLocalStorage({
    required Provider provider,
  }) async {
    await WcTokenManager().saveProvider(provider);
  }

  Future<Either<Failure, bool>?> sendVerificationEmail(
      {required String email,
      required String currentRoute,
      required String nextRoute}) async {
    try {
      var acs = ActionCodeSettings(
          url: await _dynamicLinkManager.getShortLink(
              Routes.EMAIL_VERIFICATION, nextRoute),
          // This must be true
          handleCodeInApp: true,
          iOSBundleId: 'co.yellowtoast.withconi',
          androidPackageName: 'co.yellowtoast.withconi',
          // installIfNotAvailable
          androidInstallApp: true,

          // minimumVersion
          dynamicLinkDomain: 'withconimal.page.link',
          androidMinimumVersion: '12');

      // var acs = ActionCodeSettings(
      //     url: await _dynamicLinkManager.getShortLink(
      //         Routes.EMAIL_VERIFICATION, nextRoute),
      //     // This must be true
      //     handleCodeInApp: true,
      //     iOSBundleId: 'co.yellowtoast.withconi',
      //     androidPackageName: 'co.yellowtoast.withconi',
      //     // installIfNotAvailable
      //     androidInstallApp: true,
      //     // minimumVersion
      //     dynamicLinkDomain: 'withconi.page.link',
      //     androidMinimumVersion: '12');

      var emailAuth = email;
      await firebaseAuth.sendSignInLinkToEmail(
          email: emailAuth, actionCodeSettings: acs);
      return Right(true);
    } catch (e) {
      return Left(SignInCredentialFailure());
    }
  }

  Future<Either<Failure, String>> signUpUserDB({
    required WcUser wcUser,
  }) async {
    try {
      String newUserId = await _api.signUpDB(wcUser);
      return Right(newUserId);
    } catch (e) {
      return Left(SignInTokenFailure());
    }
  }

  signOut() async {
    await firebaseAuth.signOut();
  }
}
