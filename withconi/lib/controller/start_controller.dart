// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/controller/signup/shared_data/user_data.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/signup_conimal_data_repository.dart';
import 'package:withconi/data/repository/signup_user_data_repository.dart';
import '../configs/constants/regex.dart';
import '../configs/constants/strings.dart';
import '../core/auth_info.dart';
import '../import_basic.dart';
import 'signup/shared_data/conimal_data.dart';

class StartPageController extends GetxController with StateMixin<UserState> {
  final AuthRepository _authRepository = AuthRepository();
  final SignupUserRepository _userRepository = SignupUserRepository();
  final ConimalRepository _conimalRepository = ConimalRepository();

  final RxString _email = ''.obs;
  final RxBool isButtonValid = false.obs;
  final RxString buttonText = '다음'.obs;
  final Rx<UserState> _userState = UserState.NONE.obs;
  final Rxn<AuthInfo> _authInfo = Rxn<AuthInfo>();

  RxnString emailErrorText = RxnString();
  TextEditingController emailTextController = TextEditingController();
  String nextRoute = '';

  String get email => _email.value;
  AuthInfo? get authInfo => _authInfo.value;
  UserState get userState => _userState.value;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
  }

  @override
  void onReady() {
    super.onReady();
    debounce(_email, validateEmail, time: const Duration(microseconds: 400));
    ever(_authInfo, checkDuplicateAuthInfo);
  }

  void onEmailChange(String email) {
    _email.value = email;
  }

  void onAuthInfoChange(AuthInfo authInfo) {
    _authInfo.value = authInfo;
  }

  void onUserStateChange(UserState userState) {
    _userState.value = userState;
    setStepByUserState(userState);
  }

  getAuthInfo(ProviderOptions provider) async {
    late Either<Failure, AuthInfo> authInfoEither;
    switch (provider) {
      case ProviderOptions.email:
        authInfoEither = await _authRepository.getEmailAuthInfo(email);
        break;
      case ProviderOptions.google:
        authInfoEither = await _authRepository.getGoogleAuthInfo();
        break;
      case ProviderOptions.kakao:
        authInfoEither = await _authRepository.getKakaoAuthInfo();
        break;
      case ProviderOptions.naver:
        authInfoEither = await _authRepository.getNaverAuthInfo();
        break;
      case ProviderOptions.apple:
        authInfoEither = await _authRepository.getAppleAuthInfo();
        break;
      default:
    }
    authInfoEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail);
      change(null, status: RxStatus.empty());
    }, (authInfo) {
      onAuthInfoChange(authInfo);
    });
  }

  checkDuplicateAuthInfo(_authInfo) async {
    Either<Failure, bool> duplicateUserEither =
        await _authRepository.checkDuplicateUser(
            email: _authInfo.email, provider: _authInfo.provider);

    duplicateUserEither
        .fold((fail) => FailureInterpreter().mapFailureToDialog(fail),
            (isDuplicateUser) {
      UserState newUserState =
          setUserState(isDuplicateUser, _authInfo.provider);
      onUserStateChange(newUserState);
    });
  }

  UserState setUserState(bool isDuplicateUser, ProviderOptions provider) {
    UserState userState;
    if (isDuplicateUser) {
      if (provider == ProviderOptions.email) {
        userState = UserState.SIGN_IN_EMAIL;
      } else if ((provider == ProviderOptions.apple) ||
          (provider == ProviderOptions.google)) {
        userState = UserState.SIGN_IN_CREDENTIAL;
      } else if ((provider == ProviderOptions.naver) ||
          (provider == ProviderOptions.kakao)) {
        userState = UserState.SIGN_IN_TOKEN;
      } else {
        userState = UserState.NONE;
      }
    } else {
      if (provider == ProviderOptions.email) {
        userState = UserState.SIGN_UP_EMAIL;
      } else if (provider == ProviderOptions.none) {
        userState = UserState.NONE;
      } else {
        userState = UserState.SIGN_UP_SNS;
      }
    }
    return userState;
  }

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
      change(null, status: RxStatus.loading());
      getAuthInfo(ProviderOptions.email);
    }
  }

  setStepByUserState(UserState _userState) async {
    switch (_userState) {
      case UserState.NONE:
        isButtonValid.value = false;
        buttonText.value = '입력';
        change(userState, status: RxStatus.success());
        break;
      case UserState.SIGN_IN_EMAIL:
        isButtonValid.value = true;
        buttonText.value = '로그인';
        nextRoute = Routes.SIGNIN_EMAIL;
        change(userState, status: RxStatus.success());
        break;
      case UserState.SIGN_IN_CREDENTIAL:
        //바로 가면 안되고 로그인 해야함 token이나 credential로
        await _authRepository.signInWithSnsCredential(authInfo: authInfo!);
        change(userState, status: RxStatus.success());
        break;
      case UserState.SIGN_IN_TOKEN:
        await _authRepository.signInWithSnsToken(authInfo: authInfo!);
        change(userState, status: RxStatus.success());
        break;
      case UserState.SIGN_UP_EMAIL:
        isButtonValid.value = true;
        buttonText.value = '회원가입';
        nextRoute = Routes.SIGNUP_PW;
        change(userState, status: RxStatus.success());
        break;
      case UserState.SIGN_UP_SNS:
        isButtonValid.value = true;
        buttonText.value = 'SNS 회원가입';
        nextRoute = Routes.SIGNUP_PROFILE;
        change(userState, status: RxStatus.success());
        goNext();
        break;
      default:
    }
  }

  setSharedData() {
    final UserData _userData = Get.put(UserData());
    final ConimalData _conimalData = Get.put(ConimalData());
  }

  goNext() {
    setSharedData();
    _userRepository.saveUserEmail(email);
    _userRepository.saveUserAuthInfo(authInfo!);
    Get.toNamed(nextRoute);
  }
}
