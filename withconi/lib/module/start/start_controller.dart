// ignore_for_file: unused_local_variable
import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:withconi/core/values/constants/auth_variables.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/model/dto/response_dto/auth_response/email_duplication_check_response_dto.dart';
import 'package:withconi/data/repository/signin_respository.dart';
import 'package:withconi/data/repository/signing_auth_repository.dart';
import 'package:withconi/global_widgets/snackbar.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/failures.dart';
import '../../core/values/constants/regex.dart';
import '../../core/values/constants/strings.dart';
import '../../core/signing_auth_info.dart';
import '../../data/model/custom_token.dart';
import '../../data/repository/user_repository.dart';
import '../../global_widgets/dialog/icon_dialog.dart';
import '../../import_basic.dart';
import '../community/controllers/custom_state_mixin.dart';
import '../page_status.dart';

enum ButtonState { success, none, loading }

enum EmittedBy { button, logic }

class StartPageController extends GetxController with WcStateMixin<EmittedBy> {
  StartPageController(this._platformAuthRepository, this._userRepository,
      this._signInRepository);
  final PlatformAuthRepository _platformAuthRepository;
  final UserRepository _userRepository;
  final SignInRepository _signInRepository;
  final RxString _emailInputText = ''.obs;
  final RxString buttonText = '다음'.obs;
  final RxString _validatedEmailText = ''.obs;
  Rx<SigningState> signingState = SigningState.none.obs;
  Rx<ButtonState> buttonState = ButtonState.none.obs;
  RxnString emailErrorText = RxnString();
  TextEditingController emailTextController = TextEditingController();
  final RxString _userEmail = ''.obs;
  final Rxn<Provider> _selectedProvider = Rxn<Provider>();
  late final Worker _debounceWorker;
  late final Worker _everWorker;
  RxBool pageLoading = false.obs;

  String get emailInputText => _emailInputText.value;

  RxBool emailValid = false.obs;

  @override
  void onReady() {
    super.onReady();
    _everWorker = ever(_emailInputText, _validateEmail);
    _debounceWorker = debounce(_validatedEmailText, (callback) {
      onEmailValidated(Provider.email, callback as String);
    }, time: const Duration(milliseconds: 300));
  }

  @override
  void onClose() {
    super.onClose();
    _debounceWorker.dispose();
    _everWorker.dispose();
  }

  _resetSignUserInfo() {
    buttonText.value = '다음';
    signingState.value = SigningState.none;
    buttonState.value = ButtonState.none;
    emailErrorText.value = null;
    _userEmail.value = '';
    _selectedProvider.value = null;
    pageLoading.value = false;
    emailTextController.clear();
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

  onSnsButtonTap(Provider provider) async {
    late bool confirm;
    _resetSignUserInfo();
    if (provider == Provider.apple) {
      confirm = await showAppleLoginAlert();
    } else {
      confirm = true;
    }

    if (confirm) {
      pageLoading.value = true;
      String? newEmail = await _getSnsEmail(provider);
      if (newEmail != null && newEmail.isNotEmpty) {
        _setSignState(newEmail, EmittedBy.logic);
      } else {
        showCustomSnackbar(text: '이메일을 직접 입력하여 시도해보세요');
      }
    }
  }

  Future<bool> showAppleLoginAlert() async {
    bool? confirm = await showIconDialog(
        dismissible: true,
        icon: Image.asset(
          'assets/icons/apple.png',
          height: 40,
        ),
        buttonText: '이해했어요',
        title: 'Apple 로그인 참고사항',
        subtitle:
            '반드시 이메일을 공유해주셔야\n진행이 가능합니다. 꼭 \'이메일 공유하기\'를 선택해주세요! (1회만 필요)');
    if (confirm == null) {
      return false;
    }

    return confirm;
  }

  Future<String?> _getSnsEmail(Provider provider) async {
    _selectedProvider.value = provider;
    var getEmailEither =
        await _platformAuthRepository.getEmailFromProvider(provider: provider);

    String? userEmail = getEmailEither.fold((failure) {
      FailureInterpreter().mapFailureToSnackbar(failure, '_getSnsEmail');
      pageLoading.value = false;
      return null;
    }, (email) {
      if (email == null || email.isEmpty) return null;
      return email;
    });
    _userEmail.value = userEmail ?? '';

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
          Get.toNamed(Routes.SIGNUP_PW,
              arguments: {'email': _validatedEmailText.value});
          _resetSignUserInfo();
        }
        break;

      case EmittedBy.logic:
        if (provider.signMethod == SignMethod.sns) {
          String newEmail = _userEmail.value;
          if (newEmail.isEmpty) {
            newEmail = await _getSnsEmail(provider) ?? '';
          }

          if (newEmail.isNotEmpty) {
            SigningAuthInfo? signingAuthInfo = await _getSnsAuthInfo(newEmail);

            if (signingAuthInfo != null) {
              Get.toNamed(
                Routes.SIGNUP_PROFILE,
                arguments: {
                  'signingAuthInfo': signingAuthInfo,
                },
              );
            }
          } else {
            showCustomSnackbar(text: '이메일을 직접 입력하여 회원가입 해주세요');
          }
          _resetSignUserInfo();
        }
        break;
    }
  }

  _signInSns(EmittedBy emitMethod, Provider provider) async {
    String newEmail = _userEmail.value;

    if (newEmail.isEmpty) {
      newEmail = await _getSnsEmail(provider) ?? '';
    }

    if (newEmail.isNotEmpty) {
      switch (emitMethod) {
        case EmittedBy.button:
          SigningAuthInfo? signingAuthInfo = await _getSnsAuthInfo(newEmail);

          _signInWithAuthInfo(signingAuthInfo);
          break;

        case EmittedBy.logic:
          SigningAuthInfo? signingAuthInfo = await _getSnsAuthInfo(newEmail);

          _signInWithAuthInfo(signingAuthInfo);

          break;
      }
    } else {
      showCustomSnackbar(text: '이메일을 직접 입력하여 로그인 해주세요');
    }
  }

  _signInEmail(String email) {
    Get.toNamed(Routes.SIGNIN_EMAIL,
        arguments: {'email': _validatedEmailText.value});
    _resetSignUserInfo();
  }

  _signInWithAuthInfo(SigningAuthInfo? authInfo) {
    if (authInfo != null) {
      authInfo.maybeMap(
        tokenAuthInfo: (value) => _signInWithCustomToken(value),
        credentialAuthInfo: (value) => _signInWithAuthCredential(value),
        orElse: () {
          _resetSignUserInfo();
        },
      );
    }
  }

  _signInWithCustomToken(TokenSigningAuthInfo authInfo) async {
    var firebaseCustomTokenEither =
        await _signInRepository.refreshFirebaseCustomToken(
            authInfo: authInfo, provider: authInfo.provider);

    CustomTokenResponseDTO? customToken =
        firebaseCustomTokenEither.fold((failure) {
      FailureInterpreter()
          .mapFailureToDialog(failure, '_signInWithCustomToken');
      return null;
    }, (result) => result);
    if (customToken == null) {
      _resetSignUserInfo();
      return;
    } else {
      var signInUserEither = await _signInRepository.signInWithAuthToken(
          firebaseCustomToken: customToken.accessToken);
      bool signInSucceed = signInUserEither.fold((failure) {
        FailureInterpreter()
            .mapFailureToDialog(failure, '_signInWithCustomToken');
        return false;
      }, (succeed) {
        return true;
      });

      if (signInSucceed) {
        await AuthController.to.setUserAuthInfo();
        Get.offAllNamed(Routes.NAVIGATION);
      } else {
        _resetSignUserInfo();
      }
    }
  }

  _signInWithAuthCredential(CredentialSigningAuthInfo authInfo) async {
    bool signInSucceed =
        await _signInRepository.signInWithAuthCredential(authInfo: authInfo);

    await AuthController.to.onInit();
    _resetSignUserInfo();
    // Get.offAllNamed(Routes.NAVIGATION);
  }

  Future<void> _setSignState(_email, EmittedBy emitBy) async {
// 현재 상태는 provider과 email 을 가지고 있는 상태임

    change(emitBy, status: const PageStatus.loading());
    _changeButtonState(ButtonState.loading);
    UserInfoExistenceResponseDTO? userExistenceDTO =
        await _checkDuplicateEmail(email: _email);

    if (userExistenceDTO == null) {
      _changeSignState(SigningState.none, emitBy);
      _resetSignUserInfo();
    } else if (userExistenceDTO.isAuth && userExistenceDTO.isDB) {
      if (userExistenceDTO.provider == null) {
        showCustomSnackbar(text: '가입된 플랫폼 정보가 없습니다');
        _resetSignUserInfo();
        return;
      }

      if (_selectedProvider.value != userExistenceDTO.provider) {
        bool? providerChangeConfirmed = await showIconDialog(
            dismissible: true,
            icon: Image.asset(
              userExistenceDTO.provider!.iconSrc,
              height: 50,
            ),
            buttonText: '로그인 계속하기',
            title: '${userExistenceDTO.provider!.displayName}로 가입된 계정 있음',
            subtitle:
                '기존에 가입된 ${userExistenceDTO.provider!.displayName}계정으로\n계속 로그인할까요?');

        if (providerChangeConfirmed == true) {
          _selectedProvider.value = userExistenceDTO.provider;
        } else {
          _resetSignUserInfo();
          return;
        }
      }

      if (_selectedProvider.value!.signMethod == SignMethod.sns) {
        _changeSignState(SigningState.signInSns, emitBy);
      } else {
        _changeSignState(SigningState.signInEmail, emitBy);
      }
    } else if (!userExistenceDTO.isAuth && !userExistenceDTO.isDB) {
      _changeSignState(SigningState.signUp, emitBy);
    } else {
      if (firebaseAuth.currentUser != null) {
        await firebaseAuth.currentUser!.delete();
      }
      showCustomSnackbar(text: '이전에 가입이 완료되지 않은 이메일입니다');

      _resetSignUserInfo();
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
    pageLoading.value = true;
    _nextPageWithSigningAuthInfo(
        EmittedBy.button, signingState.value, _selectedProvider.value!);
  }
}
