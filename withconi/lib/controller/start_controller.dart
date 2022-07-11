// ignore_for_file: unused_local_variable
import 'package:dartz/dartz.dart';
import 'package:lottie/lottie.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/controller/signup/shared_data/user_data.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/data/repository/signup_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';
import 'signup/shared_data/conimal_data.dart';
import '../configs/constants/regex.dart';
import '../configs/constants/strings.dart';
import '../core/auth_info.dart';
import '../import_basic.dart';

enum ButtonState { sucess, none, loading }

class StartPageController extends GetxController with StateMixin<ButtonState> {
  final AuthRepository _authRepository = AuthRepository.to;
  final SignupRepository _signupUserRepository = SignupRepository.to;

  final RxString _email = ''.obs;
  final RxBool isButtonValid = false.obs;
  final RxString buttonText = '다음'.obs;
  // final Rx<UserState> _userState = UserState.NONE.obs;
  Rx<ButtonState> buttonState = ButtonState.none.obs;
  // Rxn<AuthInfo> _authInfo = Rxn<AuthInfo>();

  RxnString emailErrorText = RxnString();
  TextEditingController emailTextController = TextEditingController();
  String nextRoute = '';

  String get email => _email.value;
  // AuthInfo? get authInfo => _authInfo.value;
  // UserState get userState => _userState.value;

  @override
  void onReady() {
    super.onReady();
    debounce(_email, validateEmail, time: const Duration(microseconds: 200));
  }

  void onEmailChange(String email) {
    _email.value = email;
  }

  getSnsUserState({required AuthInfo authInfo}) async {
    late Either<Failure, UserState> userStateEither;
    userStateEither = await _authRepository.getUserState(authInfo: authInfo);

    userStateEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail, 'getSnsUserState');
    }, (userState) {
      return userState;
    });
  }

  getEmailUserState({required AuthInfo authInfo}) async {
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
    } else {
      emailErrorText.value = null;
      nextStepWithEmail(email: _email);
    }
  }

  Future<void> nextStepWithEmail({required String email}) async {
    buttonState.value = ButtonState.loading;

    late Either<Failure, AuthInfo> authInfoEither;
    authInfoEither = await _authRepository.getAuthInfo(
        provider: ProviderOptions.email, email: email);

    authInfoEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail, 'nextStepWithEmail');
      buttonState.value = ButtonState.none;
    }, (authInfo) async {
      AuthController.to.onAuthInfoChanged(authInfo: authInfo);

      UserState userState = await setUserStateByAuthInfo(authInfo: authInfo);
      setNextStepByUserState(userState);
    });
  }

  Future<UserState> setUserStateByAuthInfo({required AuthInfo authInfo}) async {
    late Either<Failure, UserState> userStateEither;
    late UserState userState;
    userStateEither = await _authRepository.getUserState(authInfo: authInfo);

    userStateEither.fold((fail) {
      userState = UserState.NONE;
      FailureInterpreter().mapFailureToDialog(fail, 'setUserStateByAuthInfo');
    }, (_userState) {
      userState = _userState;
    });
    return userState;
  }

  setNextStepByUserState(UserState _userState) async {
    switch (_userState) {
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

      case UserState.SIGN_IN_CREDENTIAL:
        await _authRepository.signInWithSnsCredential(
            authInfo: AuthController.to.authInfo!);
        break;

      case UserState.SIGN_IN_TOKEN:
        _authRepository.signInWithSnsToken(
            authInfo: AuthController.to.authInfo!);
        break;
      case UserState.SIGN_UP_SNS:
        nextRoute = Routes.SIGNUP_PROFILE;
        goNext();
        return;
      default:
    }
  }

  Future<void> nextStepWithSns({required ProviderOptions provider}) async {
    late Either<Failure, AuthInfo> authInfoEither;
    authInfoEither =
        await _authRepository.getAuthInfo(provider: provider, email: email);

    authInfoEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail, 'nextStepWithSns');
      buttonState.value = ButtonState.none;
    }, (authInfo) {
      AuthController.to.onAuthInfoChanged(authInfo: authInfo);
      showLoading(() async {
        UserState userState = await setUserStateByAuthInfo(authInfo: authInfo);
        setNextStepByUserState(userState);
      });
    });
  }

  goNext() {
    _signupUserRepository.saveEmail(email);
    AuthController.to.onAuthInfoChanged(authInfo: AuthController.to.authInfo!);
    Get.toNamed(nextRoute);
  }
}
