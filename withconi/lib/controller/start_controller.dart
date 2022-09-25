// ignore_for_file: unused_local_variable
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';

import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/data/repository/signup_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';

import '../configs/constants/regex.dart';
import '../configs/constants/strings.dart';
import '../core/auth_info.dart';
import '../import_basic.dart';

enum ButtonState { sucess, none, loading }

// abstract class UserStateButton {
//   late ButtonState buttonState;
//   late String buttonText;
//   late String nextPage;

// UserStateButton({
//   required this.reviewRate,
//   required this.reviewNum,
//   required this.reviewRateEntity,
// });
// }

// class LoginButton implements UserStateButton {
//   @override
//   ButtonState buttonState = ButtonState.none;

//   @override
//   String buttonText = '로그인';

//   @override
//   String nextPage = Routes.SIGNIN_EMAIL;
// }

// class SignUpButton implements UserStateButton {
//   @override
//   ButtonState buttonState = ButtonState.none;

//   @override
//   String buttonText = '회원가입';

//   @override
//   String nextPage = Routes.SIGNUP_PW;
// }

// class NoneButton implements UserStateButton {
//   @override
//   ButtonState buttonState = ButtonState.none;

//   @override
//   String buttonText = '다음';

//   @override
//   String nextPage = Routes.SIGNIN_EMAIL;
// }

class StartPageController extends GetxController with StateMixin<ButtonState> {
  final AuthRepository _authRepository = AuthRepository.to;
  final SignupRepository _signupUserRepository = SignupRepository.to;

  final RxString _email = ''.obs;
  // final RxBool isButtonValid = false.obs;
  final RxString buttonText = '다음'.obs;
  // final Rx<UserState> _userState = UserState.NONE.obs;
  Rx<ButtonState> buttonState = ButtonState.none.obs;
  // Rxn<AuthInfo> _authInfo = Rxn<AuthInfo>();

  RxnString emailErrorText = RxnString();
  TextEditingController emailTextController = TextEditingController();
  String nextRoute = '';

  String get email => _email.value;

  @override
  void onReady() {
    super.onReady();
    debounce(_email, validateEmail, time: const Duration(microseconds: 700));
  }

  void onEmailChanged(String email) {
    _email.value = email;
  }

  Future<void> onTapSnsButton({required Provider provider}) async {
    late Either<Failure, CustomAuthInfo> authInfoEither;
    authInfoEither = await _authRepository.getCustomAuthInfo(
        provider: provider, email: email);

    CustomAuthInfo? customAuthInfo = await authInfoEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail, 'onTapSnsButton');
      buttonState.value = ButtonState.none;
      return null;
    }, (authInfo) async {
      return authInfo;
    });

    if (customAuthInfo != null) {
      AuthController.to.onAuthInfoChanged(authInfo: customAuthInfo);
      UserState userState =
          await setUserStateByAuthInfo(authInfo: customAuthInfo);
      await setSnsNextStepByUserState(userState);
    }
  }

  getSnsUserState({required CustomAuthInfo authInfo}) async {
    late Either<Failure, UserState> userStateEither;
    userStateEither = await _authRepository.getUserState(authInfo: authInfo);

    userStateEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail, 'getSnsUserState');
    }, (userState) {
      return userState;
    });
  }

  getEmailUserState({required CustomAuthInfo authInfo}) async {
    late Either<Failure, UserState> userStateEither;
    userStateEither = await _authRepository.getUserState(authInfo: authInfo);

    userStateEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail, 'getEmailUserState');
      buttonState.value = ButtonState.none;
    }, (userState) {
      return userState;
    });
  }

  validateEmail(_email) async {
    final emailRegExp = Regex.email;
    emailErrorText.value = null;

    if (!emailRegExp.hasMatch(_email)) {
      (_email.isEmpty)
          ? emailErrorText.value = null
          : emailErrorText.value = Strings.validator.email;
      buttonState.value = ButtonState.none;
    } else {
      emailErrorText.value = null;
      await nextStepWithEmail(email: _email);
    }
  }

  Future<void> nextStepWithEmail({required String email}) async {
    buttonState.value = ButtonState.loading;

    late Either<Failure, CustomAuthInfo> authInfoEither;
    authInfoEither = await _authRepository.getCustomAuthInfo(
        provider: Provider.email, email: email);

    CustomAuthInfo? customAuthInfo = authInfoEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail, 'nextStepWithEmail');
      buttonState.value = ButtonState.none;
      return;
    }, (authInfo) {
      return authInfo;
    });

    if (customAuthInfo != null) {
      AuthController.to.onAuthInfoChanged(authInfo: customAuthInfo);
      UserState userState =
          await setUserStateByAuthInfo(authInfo: customAuthInfo);
      setEmailNextStepByUserState(userState);
    }
  }

  Future<UserState> setUserStateByAuthInfo(
      {required CustomAuthInfo authInfo}) async {
    late Either<Failure, UserState> userStateEither;
    late UserState userState;
    userStateEither = await _authRepository.getUserState(authInfo: authInfo);

    userStateEither.fold((fail) {
      userState = UserState.none;
      FailureInterpreter().mapFailureToDialog(fail, 'setUserStateByAuthInfo');
    }, (_userState) {
      userState = _userState;
    });
    return userState;
  }

  setEmailNextStepByUserState(UserState _userState) async {
    switch (_userState) {
      case UserState.none:
        buttonText.value = '입력';
        // isButtonValid.value = false;
        buttonState.value = ButtonState.none;
        break;
      case UserState.signInEmail:
        nextRoute = Routes.SIGNIN_EMAIL;
        buttonText.value = '로그인';
        // isButtonValid.value = true;
        buttonState.value = ButtonState.sucess;
        break;
      case UserState.signUpEmail:
        buttonText.value = '회원가입';
        nextRoute = Routes.SIGNUP_PW;
        // isButtonValid.value = true;
        buttonState.value = ButtonState.sucess;
        break;
      default:
    }
  }

  setSnsNextStepByUserState(UserState _userState) async {
    switch (_userState) {
      case UserState.signInAuthCredential:
        await _authRepository.signInWithAuthCredential(
            authInfo: AuthController.to.authInfo!);
        await AuthController.to.setUserInfo(redirectPage: true);
        break;

      case UserState.signInToken:
        await _authRepository.signInWithCustomToken(
            authInfo: AuthController.to.authInfo!);
        await AuthController.to.setUserInfo(redirectPage: true);
        break;
      case UserState.signUpSns:
        nextRoute = Routes.SIGNUP_PROFILE;
        goNext();
        return;
      default:
    }
  }

  goNext() {
    _signupUserRepository.saveEmail(email);
    AuthController.to.onAuthInfoChanged(authInfo: AuthController.to.authInfo!);
    Get.toNamed(nextRoute);
  }
}
