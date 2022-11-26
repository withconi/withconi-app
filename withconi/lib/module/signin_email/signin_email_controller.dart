import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/core/signing_auth_info.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/repository/signin_respository.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/data/repository/app_setting_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import '../../core/error_handling/failures.dart';
import '../../core/values/constants/regex.dart';
import '../../core/values/constants/strings.dart';
import '../../import_basic.dart';

class SignInEmailController extends GetxController {
  SignInEmailController(this._signInRepository);
  final SignInRepository _signInRepository;

  final RxString _email = ''.obs;
  final RxString _password = ''.obs;

  RxBool isButtonValid = false.obs;

  RxnString passwordErrorText = RxnString();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  String get email => _email.value;
  String get password => _password.value;

  @override
  void onReady() {
    super.onReady();
    _email.value = Get.arguments as String;
    emailTextController.text = _email.value;

    debounce(_password, validatePassword,
        time: const Duration(milliseconds: 400));
  }

  void onPasswordChanged(String password) {
    _password.value = password;
  }

  validateButton() {
    if (passwordErrorText.value == null && password.isNotEmpty) {
      isButtonValid.value = true;
    } else {
      isButtonValid.value = false;
    }
    return isButtonValid.value;
  }

  validatePassword(String value) {
    final passwordRegExp = Regex.password;
    passwordErrorText.value = null;

    if (!passwordRegExp.hasMatch(value)) {
      passwordErrorText.value = Strings.validator.password;
    } else {
      passwordErrorText.value = null;
    }
  }

  nextStep() async {
    EmailPwdSigningAuthInfo authInfo = EmailPwdSigningAuthInfo(
        password: password, provider: Provider.email, email: email);

    await showLoading(() => _signInWithEmailAuthInfo(authInfo));
  }

  _signInWithEmailAuthInfo(EmailPwdSigningAuthInfo authInfo) async {
    Either<Failure, User?> signInEither =
        await _signInRepository.signInWithEmail(authInfo: authInfo);

    User? signInUser = signInEither.fold((l) {
      FailureInterpreter().mapFailureToSnackbar(l, 'signInWithEmail');
      return null;
    }, (user) {
      return user;
    });

    if (signInUser != null) {
      await AuthController.to.setUserInfo();
      Get.offAllNamed(Routes.NAVIGATION);
    }
  }
}
