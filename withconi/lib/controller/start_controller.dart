// ignore_for_file: unused_local_variable
import 'package:dartz/dartz.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/controller/signup/shared_data/user_data.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/signup_conimal_data_repository.dart';
import 'package:withconi/data/repository/signup_user_repository.dart';
import 'signup/shared_data/conimal_data.dart';
import '../configs/constants/regex.dart';
import '../configs/constants/strings.dart';
import '../core/auth_info.dart';
import '../import_basic.dart';

enum ButtonState { sucess, none, loading }

class StartPageController extends GetxController with StateMixin<ButtonState> {
  final AuthRepository _authRepository = AuthRepository();
  final SignupUserRepository _userRepository = SignupUserRepository.to;

  final RxString _email = ''.obs;
  final RxBool isButtonValid = false.obs;
  final RxString buttonText = '다음'.obs;
  final Rx<UserState> _userState = UserState.NONE.obs;
  Rx<ButtonState> buttonState = ButtonState.none.obs;

  RxnString emailErrorText = RxnString();
  TextEditingController emailTextController = TextEditingController();
  String nextRoute = '';

  String get email => _email.value;
  UserState get userState => _userState.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    debounce(_email, validateEmail, time: const Duration(microseconds: 0));
    // ever(buttonState, changeButton);
  }

  void onEmailChange(String email) {
    _email.value = email;
  }

  void onUserStateChange(UserState userState) {
    _userState.value = userState;
  }

  getSnsUserState({required ProviderOptions provider}) async {
    late Either<Failure, UserState> userStateEither;
    userStateEither = await _authRepository.getUserState(provider: provider);

    userStateEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail);
    }, (userState) {
      return userState;
    });
  }

  getEmailUserState({required String email}) async {
    late Either<Failure, UserState> userStateEither;
    userStateEither = await _authRepository.getUserState(
        provider: ProviderOptions.email, email: email);

    userStateEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail);
      buttonState.value = ButtonState.none;
    }, (userState) {
      return userState;
    });
  }

  // checkDuplicateAuthInfo(AuthInfo _authInfo) async {
  //   Either<Failure, bool> duplicateUserEither =
  //       await _authRepository.checkDuplicateUser(
  //           email: _authInfo.email, provider: _authInfo.provider);

  //   duplicateUserEither
  //       .fold((fail) => FailureInterpreter().mapFailureToDialog(fail),
  //           (isDuplicateUser) async {
  //     return isDuplicateUser;
  //   });
  // }

  // UserState setUserState(bool isDuplicateUser, ProviderOptions provider) {
  //   UserState userState;
  //   if (isDuplicateUser) {
  //     if (provider == ProviderOptions.email) {
  //       userState = UserState.SIGN_IN_EMAIL;
  //     } else if ((provider == ProviderOptions.apple) ||
  //         (provider == ProviderOptions.google)) {
  //       userState = UserState.SIGN_IN_CREDENTIAL;
  //     } else if ((provider == ProviderOptions.naver) ||
  //         (provider == ProviderOptions.kakao)) {
  //       userState = UserState.SIGN_IN_TOKEN;
  //     } else {
  //       userState = UserState.NONE;
  //     }
  //   } else {
  //     if (provider == ProviderOptions.email) {
  //       userState = UserState.SIGN_UP_EMAIL;
  //     } else if (provider == ProviderOptions.none) {
  //       userState = UserState.NONE;
  //     } else {
  //       userState = UserState.SIGN_UP_SNS;
  //     }
  //   }
  //   return userState;
  // }

  validateEmail(_email) async {
    final emailRegExp = Regex.email;
    emailErrorText.value = null;

    if (!emailRegExp.hasMatch(_email)) {
      (_email.isEmpty)
          ? emailErrorText.value = null
          : emailErrorText.value = Strings.validator.email;
      _userState.value = UserState.NONE;
      change(null, status: RxStatus.empty());
    } else {
      emailErrorText.value = null;
      nextStepWithEmail(email: _email);
    }
  }

  Future<void> nextStepWithEmail({required String email}) async {
    buttonState.value = ButtonState.loading;
    // UserState _userState = await getEmailUserState(email: email);

    late Either<Failure, UserState> userStateEither;
    userStateEither = await _authRepository.getUserState(
        provider: ProviderOptions.email, email: email);

    userStateEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail);
      buttonState.value = ButtonState.none;
    }, (userState) {
      _userState.value = userState;
      switch (_userState.value) {
        case UserState.NONE:
          buttonText.value = '입력';
          isButtonValid.value = false;
          buttonState.value = ButtonState.none;
          break;
        case UserState.SIGN_IN_EMAIL:
          nextRoute = Routes.SIGNIN_EMAIL;
          buttonText.value = '로그인';
          isButtonValid.value = true;
          buttonState.value = ButtonState.sucess;
          break;
        case UserState.SIGN_UP_EMAIL:
          buttonText.value = '회원가입';
          nextRoute = Routes.SIGNUP_PW;
          isButtonValid.value = true;
          buttonState.value = ButtonState.sucess;
          break;
        default:
      }
    });
  }

  Future<void> nextStepWithSns({required ProviderOptions provider}) async {
    // UserState _userState = await getSnsUserState(provider: provider);

    late Either<Failure, UserState> userStateEither;
    userStateEither =
        await _authRepository.getUserState(provider: provider, email: email);

    userStateEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail);
      buttonState.value = ButtonState.none;
    }, (userState) async {
      _userState.value = userState;
      switch (_userState.value) {
        case UserState.NONE:
          buttonText.value = '입력';
          isButtonValid.value = false;
          return;
        case UserState.SIGN_IN_CREDENTIAL:
          await _authRepository.signInWithSnsCredential();
          break;

        case UserState.SIGN_IN_TOKEN:
          _authRepository.signInWithSnsToken();
          break;
        case UserState.SIGN_UP_SNS:
          nextRoute = Routes.SIGNUP_PROFILE;
          goNext();
          return;
        default:
      }
    });
  }

  // Future<void> setStepByUserState(UserState _userState) async {
  //   switch (_userState) {
  //     case UserState.NONE:
  //       buttonText.value = '입력';
  //       isButtonValid.value = false;
  //       break;
  //     case UserState.SIGN_IN_EMAIL:
  //       nextRoute = Routes.SIGNIN_EMAIL;
  //       buttonText.value = '로그인';
  //       isButtonValid.value = true;
  //       break;
  //     case UserState.SIGN_IN_CREDENTIAL:
  //       await _authRepository.signInWithSnsCredential(authInfo: authInfo!);
  //       break;
  //     case UserState.SIGN_IN_TOKEN:
  //       await _authRepository.signInWithSnsToken(authInfo: authInfo!);
  //       break;
  //     case UserState.SIGN_UP_EMAIL:
  //       buttonText.value = '회원가입';
  //       nextRoute = Routes.SIGNUP_PW;
  //       isButtonValid.value = true;
  //       break;
  //     case UserState.SIGN_UP_SNS:
  //       goNext();
  //       break;
  //     default:
  //   }
  // }

  goNext() {
    _userRepository.saveUserEmail(email);
    Get.toNamed(nextRoute);
  }
}
