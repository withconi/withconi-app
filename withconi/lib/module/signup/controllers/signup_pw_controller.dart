import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/data/repository/signup_repository.dart';

import '../../../core/signing_auth_info.dart';
import '../../../core/values/constants/regex.dart';
import '../../../core/values/constants/strings.dart';
import '../../../import_basic.dart';
import '../signup_data_storage.dart';

class SignupPwController extends GetxController {
  SignupPwController(this._email);
  late final String _email;
  late RxString _password;
  late RxString _confirmPassword;
  late RxString _name;
  late RxBool isButtonValid;

  RxnString passwordErrorText = RxnString();
  RxnString confirmPasswordErrorText = RxnString();
  RxnString nameErrorText = RxnString();

  TextEditingController emailTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  String get email => _email;
  String get password => _password.value;
  String get confirmPassword => _confirmPassword.value;
  String get name => _name.value;

  @override
  void onInit() {
    super.onInit();

    _password = ''.obs;
    _confirmPassword = ''.obs;
    _name = ''.obs;
    isButtonValid = false.obs;
  }

  @override
  void onReady() {
    super.onReady();

    emailTextController.text = _email;

    debounce(_password, validatePassword,
        time: const Duration(milliseconds: 400));
    debounce(_confirmPassword, validateConfirmPassword,
        time: const Duration(milliseconds: 400));
  }

  void onPasswordChanged(String password) {
    _password.value = password;
  }

  void onConfirmPasswordChanged(String confirmPwd) {
    _confirmPassword.value = confirmPwd;
  }

  validateButton() {
    if (passwordErrorText.value == null &&
        confirmPasswordErrorText.value == null &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      isButtonValid.value = true;
    } else {
      isButtonValid.value = false;
    }
    return isButtonValid.value;
  }

  nextStep() {
    Get.toNamed(
      Routes.SIGNUP_PROFILE,
      arguments: {
        'signingAuthInfo': EmailPwdSigningAuthInfo(
            email: email, password: password, provider: Provider.email)
      },
    );
  }

  validateName(String value) {
    final nameRegExp = Regex.name;
    nameErrorText.value = null;
    if (!nameRegExp.hasMatch(value)) {
      nameErrorText.value = Strings.validator.name;
    } else {
      nameErrorText.value = null;
    }
  }

  String? validatePassword(String value) {
    final passwordRegExp = Regex.password;
    passwordErrorText.value = null;

    if (!passwordRegExp.hasMatch(value)) {
      passwordErrorText.value = Strings.validator.password;
    } else {
      passwordErrorText.value = null;
    }
    validateConfirmPassword(confirmPassword);
  }

  validateConfirmPassword(String value) {
    confirmPasswordErrorText.value = null;

    if (password != value) {
      confirmPasswordErrorText.value = Strings.validator.confirmPassword;
    } else {
      confirmPasswordErrorText.value = null;
    }
  }
}
