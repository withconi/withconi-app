import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/signup/shared_data/user_data.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/signup_user_data_repository.dart';
import '../../configs/constants/regex.dart';
import '../../configs/constants/strings.dart';
import '../../import_basic.dart';

class SigninEmailController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final SignupUserRepository _userRepository = SignupUserRepository();

  late RxString _email;
  late RxString _password;
  late RxBool isButtonValid;

  RxnString passwordErrorText = RxnString();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  String get email => _email.value;
  String get password => _password.value;

  @override
  void onInit() {
    super.onInit();

    _email = ''.obs;
    _password = ''.obs;
    isButtonValid = false.obs;
  }

  @override
  void onReady() {
    super.onReady();
    _email.value = UserData.to.email;
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
    await _authRepository.signInWithEmail(
        authInfo: _userRepository.getAuthInfo(), password: password);
  }
}