import '../../import_basic.dart';

class SignUpData extends GetxController {
  static SignUpData get to => Get.find();
  late RxString _email;
  late RxString _name;
  late RxString _password;

  String get email => _email.value;
  String get name => _name.value;
  String get password => _password.value;

  @override
  void onInit() {
    super.onInit();
    _email = ''.obs;
    _name = ''.obs;
    _password = ''.obs;
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onEmailChange(String email) {
    _email.value = email;
  }

  void onNameChange(String name) {
    _name.value = name;
  }

  void onPasswordChange(String password) {
    _password.value = password;
  }
}
