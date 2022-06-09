import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/signup/user_data.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import '../configs/constants/regex.dart';
import '../configs/constants/strings.dart';
import '../import_basic.dart';

class StartPageController extends GetxController {
  // ignore: unused_field
  final UserData _userData = Get.put(UserData());
  final AuthRepository _repository = AuthRepository();
  late RxString _email;
  late RxBool isButtonValid;
  late RxString buttonText;
  late Rx<UserState> _userState;
  RxnString emailErrorText = RxnString();
  TextEditingController emailTextController = TextEditingController();
  String nextRoute = '';

  String get email => _email.value;

  @override
  void onInit() {
    super.onInit();
    _email = ''.obs;
    isButtonValid = false.obs;
    buttonText = '다음'.obs;
    _userState = UserState.NONE.obs;
  }

  @override
  void onReady() {
    super.onReady();
    debounce(_email, validateEmail, time: const Duration(microseconds: 400));
    ever(_userState, setNextStep);
  }

  void onEmailChange(String email) {
    _email.value = email;
  }

  signIn(ProviderOptions provider) async {
    print(_userState.value);
    switch (provider) {
      case ProviderOptions.GOOGLE:
        _userState.value = await _repository.signInWithGoogle();
        break;
      case ProviderOptions.KAKAO:
        _userState.value = await _repository.signInWithKakao();
        break;
      case ProviderOptions.NAVER:
        _userState.value = await _repository.signInWithNaver();
        break;
      case ProviderOptions.APPLE:
        _userState.value = await _repository.signInWithApple();
        break;
      default:
    }
  }

  validateEmail(_email) async {
    final emailRegExp = Regex.email;
    emailErrorText.value = null;

    if (!emailRegExp.hasMatch(_email)) {
      (_email.isEmpty)
          ? emailErrorText.value = null
          : emailErrorText.value = Strings.validator.email;
      _userState.value = UserState.NONE;
    } else {
      emailErrorText.value = null;
      _userState.value = await _repository.checkUserStateByEmail(
          email: _email, provider: ProviderOptions.EMAIL);
    }
  }

  setNextStep(_userState) {
    print('setNextStep 실행');
    switch (_userState) {
      case UserState.NONE:
        isButtonValid.value = false;
        buttonText.value = '다음';
        break;
      case UserState.SIGN_IN_EMAIL:
        isButtonValid.value = true;
        buttonText.value = '로그인';
        nextRoute = Routes.SIGNIN_EMAIL;
        break;
      case UserState.SIGN_UP_EMAIL:
        isButtonValid.value = true;
        buttonText.value = '회원가입';
        nextRoute = Routes.SIGNUP_PW;
        break;
      case UserState.SIGN_IN_SNS:
        //바로 가면 안되고 로그인 해야함 token이나 credential로
        nextRoute = Routes.HOME;
        break;
      case UserState.SIGN_UP_SNS:
        nextRoute = Routes.SIGNUP_PROFILE;
        nextStep();
        break;
      default:
    }
  }

  nextStep() {
    UserData.to.saveEmail(email);
    _userState.value = UserState.NONE;
    Get.toNamed(nextRoute);
  }
}
