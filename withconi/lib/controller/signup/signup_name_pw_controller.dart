import 'package:withconi/controller/signup/signup_data.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import '../../configs/constants/regex.dart';
import '../../configs/constants/strings.dart';
import '../../import_basic.dart';

class SignUpNamePWController extends GetxController {
  final AuthRepository _repository = AuthRepository();
  late RxString _email;
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

  String get email => _email.value;
  String get password => _password.value;
  String get confirmPassword => _confirmPassword.value;
  String get name => _name.value;

  @override
  void onInit() {
    super.onInit();

    _email = ''.obs;
    _password = ''.obs;
    _confirmPassword = ''.obs;
    _name = ''.obs;
    isButtonValid = false.obs;
  }

  @override
  void onReady() {
    super.onReady();

    _email.value = SignUpData.to.email;
    emailTextController.text = _email.value;

    debounce(_name, validateName, time: const Duration(milliseconds: 400));
    debounce(_password, validatePassword,
        time: const Duration(milliseconds: 400));
    debounce(_confirmPassword, validateConfirmPassword,
        time: const Duration(milliseconds: 400));
  }

  void onNameChanged(String val) {
    _name.value = val;
  }

  void onPasswordChanged(String password) {
    _password.value = password;
  }

  void onConfirmPasswordChanged(String confirmPwd) {
    _confirmPassword.value = confirmPwd;
  }

  validateButton() {
    if (passwordErrorText.value == null &&
        nameErrorText.value == null &&
        confirmPasswordErrorText.value == null &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        name.isNotEmpty) {
      isButtonValid.value = true;
    } else {
      isButtonValid.value = false;
    }
    return isButtonValid.value;
  }

  nextStep() {
    SignUpData.to.onPasswordChange(password);
    SignUpData.to.onNameChange(name);
    Get.toNamed(Routes.SIGNUP_CONIMAL_STEP1);
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
