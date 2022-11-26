// ignore_for_file: unused_local_variable
import 'dart:async';
import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/auth_response/email_duplication_check_response_dto.dart';
import 'package:withconi/data/repository/signin_respository.dart';
import 'package:withconi/data/repository/signing_auth_repository.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/module/signup/signup_data_storage.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/repository/platform_repository/apple_repository.dart';
import 'package:withconi/data/repository/app_setting_repository.dart';
import 'package:withconi/data/repository/platform_repository/kakao_repository.dart';
import 'package:withconi/data/repository/platform_repository/naver_repository.dart';
import '../../core/values/constants/regex.dart';
import '../../core/values/constants/strings.dart';
import '../../core/signing_auth_info.dart';
import '../../data/repository/user_repository.dart';
import '../../import_basic.dart';

enum ButtonState { success, none, loading }

enum EmittedBy { button, logic }

class StartPageController extends GetxController {
  StartPageController(this._platformAuthRepository, this._userRepository,
      this._signInRepository);
  final PlatformAuthRepository _platformAuthRepository;
  final UserRepository _userRepository;
  final SignInRepository _signInRepository;
  // final AuthRepository _authRepository;
  final RxString _emailInputText = ''.obs;
  final RxString buttonText = '다음'.obs;
  final RxString _validatedEmailText = ''.obs;
  Rx<SigningState> signingState = SigningState.none.obs;
  Rx<ButtonState> buttonState = ButtonState.none.obs;
  RxnString emailErrorText = RxnString();
  TextEditingController emailTextController = TextEditingController();
  Rxn<SigningAuthInfo> _signingAuthInfo = Rxn<SigningAuthInfo>();
  // SignInAuthInfo? _signingAuthInfo;
  RxBool validateText = false.obs;
  RxString _userEmail = ''.obs;
  Rxn<Provider> _selectedProvider = Rxn<Provider>();
  Worker? _worker;
  RxBool pageLoading = false.obs;

  String get emailInputText => _emailInputText.value;

  RxBool emailValid = false.obs;

  @override
  void onReady() {
    super.onReady();
    ever(_emailInputText, _validateEmail);
    _worker = debounce(_validatedEmailText, (callback) {
      onEmailValidated(Provider.email, callback as String);
    }, time: const Duration(milliseconds: 300));
  }

  void onEmailTextFieldChanged(String _email) {
    _emailInputText.value = _email;
  }

  void _changeButtonState(ButtonState button) {
    buttonState.value = button;
  }

  onEmailValidated(_provider, String email) async {
    // if (_provider == Provider.email) {
    _selectedProvider.value = _provider;
    _setSignState(email, EmittedBy.button);
    // return;
  }

  onTapSnsButton(Provider provider) async {
    pageLoading.value = true;
    String newEmail = await _getSnsEmail(provider);
    if (newEmail.isNotEmpty) {
      _setSignState(newEmail, EmittedBy.logic);
    }
  }

  Future<String> _getSnsEmail(Provider provider) async {
    _selectedProvider.value = provider;
    var getEmailEither =
        await _platformAuthRepository.getEmailFromProvider(provider: provider);

    String userEmail = getEmailEither.fold((failure) {
      FailureInterpreter().mapFailureToSnackbar(failure, 'onChangeProvider');
      pageLoading.value = false;
      return '';
    }, (email) => email);

    return userEmail;
  }

  _changeSignState(_userState, EmittedBy emitBy) {
    signingState.value = _userState;

    if (signingState.value == SigningState.none) {
      _changeButtonState(ButtonState.none);
      return;
    }

    _changeButtonState(ButtonState.success);

    switch (emitBy) {
      case EmittedBy.logic:
        _nextPageWithSigningAuthInfo(
            emitBy, signingState.value, _selectedProvider.value!);
        break;
      default:
    }
  }

  _nextPageWithSigningAuthInfo(
      EmittedBy emittedBy, SigningState signingState, Provider provider) {
    if (signingState == SigningState.signInEmail) {
      _signInEmail(_userEmail.value);
    } else if (signingState == SigningState.signInSns) {
      _signInSns(emittedBy, provider);
    } else if (signingState == SigningState.signUp) {
      _signUp(emittedBy, provider);
    } else {
      pageLoading.value = false;
      return;
    }
  }

  _signUp(EmittedBy emitMethod, Provider provider) async {
    switch (emitMethod) {
      case EmittedBy.button:
        if (provider.signMethod == SignMethod.email) {
          Get.toNamed(Routes.SIGNUP_PW, arguments: _validatedEmailText.value);
        }
        break;

      case EmittedBy.logic:
        if (provider.signMethod == SignMethod.sns) {
          String newEmail = await _getSnsEmail(provider);
          Get.toNamed(Routes.SIGNUP_PROFILE,
              arguments: await _getSnsAuthInfo(newEmail));
        }
        break;
    }
  }

  _signInSns(EmittedBy emitMethod, Provider provider) async {
    pageLoading.value = true;
    String newEmail = await _getSnsEmail(provider);
    switch (emitMethod) {
      case EmittedBy.button:
        // String newEmail = await _getSnsEmail(provider);
        _signInWithAuthInfo(await _getSnsAuthInfo(newEmail));
        break;

      case EmittedBy.logic:
        // String newEmail = await _getSnsEmail(provider);
        _signInWithAuthInfo(await _getSnsAuthInfo(newEmail));

        break;
    }
  }

  _signInEmail(String email) {
    Get.toNamed(Routes.SIGNIN_EMAIL, arguments: _validatedEmailText.value);
  }

  _signInWithAuthInfo(SigningAuthInfo? authInfo) {
    if (authInfo != null) {
      return authInfo.maybeMap(
        tokenAuthInfo: (value) {},
        credentialAuthInfo: (value) => _signInWithAuthCredential(value),
        orElse: () {
          pageLoading.value = false;
        },
      );
    }
  }

  _signInWithAuthCredential(CredentialSigningAuthInfo authInfo) async {
    bool signInSucceed =
        await _signInRepository.signInWithAuthCredential(authInfo: authInfo);

    AuthController.to.setUserInfo();
    pageLoading.value = false;
    Get.offAllNamed(Routes.NAVIGATION);
  }

  Future<void> _setSignState(_email, EmittedBy emitBy) async {
// 현재 상태는 provider과 email 을 가지고 있는 상태임
    _changeButtonState(ButtonState.loading);
    UserInfoExistenceResponseDTO? userExistenceDTO =
        await _checkDuplicateEmail(email: _email);

    if (userExistenceDTO == null) {
      _changeSignState(SigningState.none, emitBy);
      pageLoading.value = false;
    } else if (userExistenceDTO.isAuth && userExistenceDTO.isDB) {
      _selectedProvider.value = userExistenceDTO.provider;
      if (_selectedProvider.value!.signMethod == SignMethod.sns) {
        _selectedProvider.value = userExistenceDTO.provider;
        _changeSignState(SigningState.signInSns, emitBy);
      } else {
        _changeSignState(SigningState.signInEmail, emitBy);
      }
    } else {
      _changeSignState(SigningState.signUp, emitBy);
    }
  }

  Future<SigningAuthInfo?> _getSnsAuthInfo(String userEmail) async {
    late Either<Failure, SigningAuthInfo> signAuthInfoEither;
    switch (_selectedProvider.value) {
      case Provider.google:
        signAuthInfoEither =
            await _platformAuthRepository.getGoogleSignAuthInfo(userEmail);
        break;
      case Provider.kakao:
        signAuthInfoEither =
            await _platformAuthRepository.getKakaoSignAuthInfo(userEmail);
        break;
      case Provider.naver:
        signAuthInfoEither =
            await _platformAuthRepository.getNaverSignAuthInfo(userEmail);
        break;
      case Provider.apple:
        signAuthInfoEither =
            await _platformAuthRepository.getAppleSignAuthInfo(userEmail);
        break;
      default:
    }
    SigningAuthInfo? authInfo = signAuthInfoEither.fold((l) {
      FailureInterpreter().mapFailureToDialog(l, '_getCustomAuthInfo');
      pageLoading.value = false;
      _changeButtonState(ButtonState.none);
      return null;
    }, (r) {
      _changeButtonState(ButtonState.success);
      return r;
    });

    return authInfo;
  }

  _validateEmail(_email) async {
    RegExp emailRegExp = Regex.email;
    // bool validated = false;

    if (!emailRegExp.hasMatch(_email)) {
      (_email.isEmpty)
          ? emailErrorText.value = null
          : emailErrorText(Strings.validator.email);
      _changeButtonState(ButtonState.none);
    } else {
      emailErrorText.value = null;
      _validatedEmailText.value = _email;
    }
  }

  Future<UserInfoExistenceResponseDTO?> _checkDuplicateEmail(
      {required String email}) async {
    var duplicateEmailResult =
        await _userRepository.getUserInfoExistence(email: email);

    return duplicateEmailResult.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, 'checkDuplicateEmail');
      return null;
    }, (userInfoExistence) {
      return userInfoExistence;
    });
  }

  onNextButtonTap() {
    _nextPageWithSigningAuthInfo(
        EmittedBy.button, signingState.value, _selectedProvider.value!);
  }
}
