import 'dart:async';

import 'package:withconi/global_widgets/snackbar.dart';

import '../../../../import_basic.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../../../core/values/constants/auth_variables.dart';
import '../../../data/repository/app_setting_repository.dart';
import '../../../data/repository/user_repository.dart';
import '../../../global_widgets/loading/loading_overlay.dart';
import '../../auth/auth_controller.dart';

class EmailVerificationController extends GetxController {
  EmailVerificationController(this._userRepository, this._nextRoute);
  final UserRepository _userRepository;
  late final String? _nextRoute;
  late String _email;
  // late String _nextRoute;

  String get email => _email;

  String _pinCode = '';

  bool isPinCodeSent = false;

  late Timer _timer;
  final int _timeout = 240;
  final RxInt _timeCount = 240.obs;

  RxString timeCountText = '4:00'.obs;
  RxBool isResendButtonValid = false.obs;

  @override
  onInit() {
    super.onInit();
    _email = AuthController.to.userInfo.email;
  }

  @override
  onReady() async {
    super.onReady();

    await _sendVerificationEmail(_email);
  }

  _sendVerificationEmail(
    String email,
  ) async {
    isResendButtonValid.value = false;
    _startTimer();
    var result = await _userRepository.sendVerificationEmail(email: email);

    isPinCodeSent = result!.fold((l) {
      FailureInterpreter().mapFailureToDialog(l, '_sendVerificationEmail');
      return false;
    }, (sentResult) => sentResult);

    if (!isPinCodeSent) {
      _stopTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_timeCount.value <= 0) {
        _stopTimer();
      } else {
        _timeCount.value -= 1;
        timeCountText.value = _getTimeCountText(_timeCount.value);
        isResendButtonValid.value = !_timer.isActive;
      }
    });
  }

  void _stopTimer() {
    _timer.cancel();
    _timeCount.value = _timeout;
    timeCountText.value = _getTimeCountText(_timeCount.value);
    isResendButtonValid.value = !_timer.isActive;
  }

  _getTimeCountText(int time) {
    if (time <= 0) {
      return '0:00';
    }
    int minutes = (_timeCount.value / 60).floor();
    int seconds = (_timeCount.value % 60);
    if (seconds < 10) {
      return '$minutes:0$seconds';
    } else {
      return '$minutes:$seconds';
    }
  }

  skipEmailVerification() async {
    late bool succeed;
    if (AuthController.to.isVerifySkipped) {
      succeed = true;
    } else {
      succeed = await showLoading(() => _updateUserEmailVerificationInfo(
          isEmailVerified: false, isVerificaitonSkipped: true));
    }

    if (succeed) {
      if (Get.previousRoute == Routes.USER_EDIT) {
        Get.back();
      } else {
        Get.offAllNamed(Routes.NAVIGATION);
      }
    }
  }

  onPinCodeCompleted(String code) async {
    _pinCode = code;
    if (isPinCodeSent) {
      if (_timer.isActive) {
        await showLoading(
            () => checkVerificationCode(email: email, verifyCode: _pinCode));
      } else {
        showCustomSnackbar(text: '인증메일을 재전송 해주세요');
      }
    }
  }

  onPinCodeChanged(String code) {
    _pinCode = code;
  }

  Future<bool> _updateUserEmailVerificationInfo(
      {required bool isEmailVerified,
      required bool isVerificaitonSkipped}) async {
    var userUpdateEither = await _userRepository.updateUser(
        user: AuthController.to.userInfo.copyWith(
            verificationSkipped: isVerificaitonSkipped,
            isEmailVerified: isEmailVerified));

    bool updateSucceed = userUpdateEither.fold((failure) {
      FailureInterpreter()
          .mapFailureToDialog(failure, '_updateUserEmailVerificationInfo');
      return false;
    }, (success) {
      return success;
    });

    if (updateSucceed) {
      await AuthController.to.setUserAuthInfo();
    }

    return updateSucceed;
  }

  // prop() {
  //   Get.offNamed(Routes.PASSWORD_CHANGE_1, arguments: {'email': email});
  // }

  checkVerificationCode(
      {required String email, required String verifyCode}) async {
    var emailVerificationEither = await _userRepository
        .checkEmailVerificationCode(email: email, verificationCode: verifyCode);

    bool isEmailVerified = emailVerificationEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, 'checkVerificationCode');
      return false;
    }, (isEmailVerified) {
      return isEmailVerified;
    });

    if (isEmailVerified) {
      _stopTimer();

      bool updateSucceed = await _updateUserEmailVerificationInfo(
          isEmailVerified: isEmailVerified, isVerificaitonSkipped: false);
      if (updateSucceed) {
        goToNextRoute();
      } else {}

      print(isEmailVerified);
    } else {
      showCustomSnackbar(text: '인증번호가 다릅니다');
    }
  }

  goToNextRoute() {
    switch (_nextRoute) {
      case Routes.NAVIGATION:
        Get.offAllNamed(Routes.NAVIGATION);
        break;
      case Routes.CHANGE_PASSWORD:
        Get.offNamed(Routes.CHANGE_PASSWORD, arguments: {'email': email});
        break;
      default:
        Get.back(result: true);
    }
  }

  resendVerificationEmail() async {
    if (!_timer.isActive) {
      showCustomSnackbar(text: '인증코드가 전송되었습니다');
      await _sendVerificationEmail(email);
    }
  }
}
