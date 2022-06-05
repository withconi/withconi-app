import 'package:withconi/configs/constants/auth_variables.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/signup/user_data.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import '../import_basic.dart';

class StartPageController extends GetxController {
  final AuthRepository _repository = AuthRepository();
  late RxString _email;
  late RxBool validateButton;

  String get email => _email.value;

  @override
  void onInit() {
    super.onInit();
    _email = ''.obs;
    validateButton = false.obs;
  }

  @override
  void onReady() {
    super.onReady();
    debounce(_email, validateNextButton, time: 1.seconds);
  }

  void onEmailChange(String email) {
    _email.value = email;
  }

  validateNextButton(_email) async {
    validateButton.value = await _repository.checkDuplicateEmail(email: _email);
    print('validate Button 결과 : ${validateButton.value}');
  }

  signIn(ProviderOptions provider) {
    switch (provider) {
      case ProviderOptions.EMAIL:
        // _repository.signInWithEmail(
        //     email: _email.value, password: _password.value);
        break;
      case ProviderOptions.GOOGLE:
        _repository.signInWithGoogle();
        break;
      case ProviderOptions.KAKAO:
        _repository.signInWithToken(provider: authController.provider.value);
        break;
      case ProviderOptions.NAVER:
        _repository.signInWithToken(provider: authController.provider.value);
        break;
      default:
    }
  }

  nextStep() {
    UserData.to.onEmailChange(email);
    Get.toNamed(Routes.SIGNUP_NAME_PW);
  }

  // Future<void> onSignInPressed() async {
  //   try {
  //     final requestToken = Get.arguments as String;

  //     /// call data arguments to from Get.offNamed (event push data Controller)
  //     print('[REQUEST TOKEN] =======> [ $requestToken ]');
  //     final TokenModel authToken = await _repository.authWithLogin(
  //       email: _email,
  //       password: _password,
  //       token: requestToken,
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
