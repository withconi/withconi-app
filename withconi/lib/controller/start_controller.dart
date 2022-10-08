// ignore_for_file: unused_local_variable
import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/signup/data/signup_data_manager.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/repository/platform_repository/apple_repository.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/platform_repository/kakao_repository.dart';
import 'package:withconi/data/repository/platform_repository/naver_repository.dart';
import '../configs/constants/regex.dart';
import '../configs/constants/strings.dart';
import '../core/custom_auth_info.dart';
import '../data/repository/platform_repository/google_repository.dart';
import '../import_basic.dart';

enum ButtonState { success, none, loading }

class StartPageController extends GetxController {
  final AuthRepository _authRepository = AuthRepository.to;
  final KakaoRepository _kakaoRepository = KakaoRepository();
  final NaverRepository _naverRepository = NaverRepository();
  final GoogleRepository _googleRepository = GoogleRepository();
  final AppleRepository _appleRepository = AppleRepository();
  final RxString _emailInputText = ''.obs;
  final RxString buttonText = '다음'.obs;
  late Provider _selectedProvider;
  UserState2 _userState = UserState2.none;
  Rx<ButtonState> buttonState = ButtonState.none.obs;
  RxnString emailErrorText = RxnString();
  TextEditingController emailTextController = TextEditingController();
  CustomAuthInfo? customAuthInfo;
  RxBool validateText = false.obs;
  Worker? _worker;

  String get emailInputText => _emailInputText.value;

  @override
  void onReady() {
    super.onReady();
    _worker = debounce(_emailInputText, _validateEmail,
        time: Duration(milliseconds: 300));
  }

  void onEmailChanged(String _email) {
    _emailInputText.value = _email;
    _selectedProvider = Provider.email;
  }

  void _onAuthInfoChanged(CustomAuthInfo _customAuthInfo) {
    customAuthInfo = _customAuthInfo;
    AuthController.to.onAuthInfoChanged(authInfo: _customAuthInfo);
  }

  void _changeButton(
      {required UserState2 userState, required ButtonState button}) {
    if (userState == UserState2.signIn) {
      buttonText.value = '로그인';
      buttonState.value = button;
    } else if (userState == UserState2.signUp) {
      buttonText.value = '회원가입';
      buttonState.value = button;
    } else if (userState == UserState2.none) {
      buttonText.value = '다음';
      buttonState.value = button;
    }
  }

  Future<void> getEmailFromProvider(Provider provider) async {
    String _email = '';
    _selectedProvider = provider;

    if (provider == Provider.email) {
      _email = emailInputText;
    } else {
      // provider 로그인 전, provider에서 유저의 이메일 정보를 가져온다
      Either<Failure, String> snsEmailResult =
          await _authRepository.getEmailFromProvider(provider: provider);
      snsEmailResult.fold(
          (failure) => FailureInterpreter()
              .mapFailureToSnackbar(failure, 'getEmailInfo'),
          (snsEmail) => _email = snsEmail);
    }
    // provider에서 가져온 유저의 email이 중복되는지 검증한다
    await _setUserStateByEmail(email: _email);
    // email 중복검사 결과에 따라, 로그인 혹은 회원가입 로직으로 연결한다
    await _setNextStepByUserState(_userState, _email);
  }

  Future<void> _setUserStateByEmail({required String email}) async {
    // 한개의 email이 여러 provider계정에 동일하게 존재할 수 있다.
    // 이 경우, 기존 계정을 연결하거나 기존에 가입된 계정으로 로그인하도록 유도해야 한다.
    bool? isDupliacteUser = await _checkDuplicateEmail(email: email);

    if (isDupliacteUser != null) {
      if (isDupliacteUser) {
        _userState = UserState2.signIn;
      } else {
        _userState = UserState2.signUp;
      }
    }
  }

  Future<void> _setNextStepByUserState(
      UserState2 _userState, String _email) async {
    await _getCustomAuthInfo(_email);
    if (_userState == UserState2.signUp) {
      //provider에 로그인 하여 oAuth 정보를 가져온 뒤 AuthController에 저장한다
      await _signUpNextPage();
    } else if (_userState == UserState2.signIn) {
      if (_selectedProvider == Provider.email) {
        _signInEmailNextPage();
      } else {
        await _signInSnsUser();
      }
    }
  }

  _signUpNextPage() async {
    _initSignUpDataManager();
    switch (_selectedProvider) {
      case Provider.email:
        Get.toNamed(Routes.SIGNUP_PW);
        break;
      case Provider.google:
        Get.toNamed(Routes.SIGNUP_PROFILE);
        break;
      case Provider.kakao:
        Get.toNamed(Routes.SIGNUP_PROFILE);
        break;
      case Provider.naver:
        Get.toNamed(Routes.SIGNUP_PROFILE);
        break;
      case Provider.apple:
        Get.toNamed(Routes.SIGNUP_PROFILE);
        break;
      default:
    }
  }

  //본격적인 회원가입 과정을 진행하기 전 정보를 저장할 singleton class를 생성한다.
  // class가 생성된 후 startController에서 얻은 customAuthInfo를 저장한다.
  _initSignUpDataManager() {
    Get.lazyReplace(() => SignUpDataManager());
    final SignUpDataManager signUpDataManager = Get.find();
    signUpDataManager.storeAuthInfo(customAuthInfo!);
  }

  _signInEmailNextPage() {
    Get.toNamed(Routes.SIGNIN_EMAIL);
  }

  Future<void> _getCustomAuthInfo(String _email) async {
    late CustomAuthInfo newAuthInfo;

    if (_selectedProvider == Provider.email) {
      newAuthInfo = EmailPwdAuthInfo(email: _email, password: '');
    } else if (_selectedProvider == Provider.kakao ||
        _selectedProvider == Provider.naver) {
      late Either<Failure, String> tokenEither;
      switch (_selectedProvider) {
        case Provider.kakao:
          tokenEither = await _kakaoRepository.getKakaoToken();
          break;
        case Provider.naver:
          tokenEither = await _naverRepository.getNaverToken();
          break;
        default:
      }
      tokenEither.fold(
          (failure) => FailureInterpreter()
              .mapFailureToSnackbar(failure, 'getProviderToken'),
          (token) => newAuthInfo = TokenAuthInfo(
              accessToken: token, email: _email, provider: _selectedProvider));
    } else if (_selectedProvider == Provider.google ||
        _selectedProvider == Provider.apple) {
      late Either<Failure, OAuthCredential> credentialEither;

      switch (_selectedProvider) {
        case Provider.google:
          credentialEither = await _googleRepository.getGoogleCredential();
          break;
        case Provider.apple:
          credentialEither = await _appleRepository.getAppleCredential();
          break;
        default:
      }

      credentialEither.fold(
          (failure) => FailureInterpreter()
              .mapFailureToSnackbar(failure, 'getGoogleCredential'),
          (oAuthCredential) => newAuthInfo = CredentialAuthInfo(
              oAuthCredential: oAuthCredential, email: _email));
    }
    _onAuthInfoChanged(newAuthInfo);
  }

  Future<void> _signInSnsUser() async {
    switch (_selectedProvider) {
      case Provider.google:
        await _authRepository.signInWithAuthCredential(
            authInfo: customAuthInfo as CredentialAuthInfo);
        break;
      case Provider.kakao:
        break;
      case Provider.naver:
        break;
      case Provider.apple:
        await _authRepository.signInWithAuthCredential(
            authInfo: customAuthInfo as CredentialAuthInfo);
        break;
      default:
    }

    await AuthController.to.setUserInfo(redirectPage: true);
  }

  _validateEmail(_email) async {
    RegExp emailRegExp = Regex.email;
    // bool validated = false;

    if (!emailRegExp.hasMatch(_email)) {
      (_email.isEmpty)
          ? emailErrorText.value = null
          : emailErrorText(Strings.validator.email);
      _changeButton(userState: UserState2.none, button: ButtonState.none);
    } else {
      emailErrorText.value = null;
      await _determineButtonState(_email);
    }
  }

  Future<void> _determineButtonState(String _email) async {
    _changeButton(userState: UserState2.none, button: ButtonState.loading);

    await _setUserStateByEmail(email: _email);
    if (emailErrorText.value == null) {
      _changeButton(userState: _userState, button: ButtonState.success);
    } else {
      _changeButton(userState: UserState2.none, button: ButtonState.none);
    }
  }

  Future<bool?> _checkDuplicateEmail({required String email}) async {
    bool? isDuplicateUser;
    var duplicateEmailResult =
        await _authRepository.checkDuplicateUser(email: email);

    isDuplicateUser = duplicateEmailResult.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, 'checkDuplicateEmail');
      return null;
    }, (duplicate) => duplicate);

    return isDuplicateUser;
  }

  Future<void> onEmailButtonTap() async {
    await _setNextStepByUserState(_userState, _emailInputText.value);
  }
}
