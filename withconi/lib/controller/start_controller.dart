import 'package:dartz/dartz.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/exception_controller.dart';
import 'package:withconi/controller/signup/shared_data/user_data.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/ui/widgets/snackbar.dart';
import '../configs/constants/regex.dart';
import '../configs/constants/strings.dart';
import '../import_basic.dart';
import 'signup/shared_data/conimal_data.dart';

class StartPageController extends GetxController with StateMixin<UserState> {
  final AuthRepository _repository = AuthRepository();
  final RxString _email = ''.obs;
  final RxBool isButtonValid = false.obs;
  final RxString buttonText = '다음'.obs;
  final Rx<UserState> _userState = UserState.NONE.obs;
  RxnString emailErrorText = RxnString();
  TextEditingController emailTextController = TextEditingController();
  String nextRoute = '';
  String get email => _email.value;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
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
    late Either<Failure, UserState> userStateEither;
    switch (provider) {
      case ProviderOptions.GOOGLE:
        userStateEither = await _repository.signInWithGoogle();
        break;
      case ProviderOptions.KAKAO:
        userStateEither = await _repository.signInWithKakao();
        break;
      case ProviderOptions.NAVER:
        userStateEither = await _repository.signInWithNaver();
        break;
      case ProviderOptions.APPLE:
        userStateEither = await _repository.signInWithApple();
        break;
      default:
    }

    changePageState(userStateEither);
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
      checkUserState(_email);
    }
  }

  checkUserState(String email) async {
    change(null, status: RxStatus.loading());
    Either<Failure, UserState> userStateEither = await _repository
        .checkUserStateByEmail(email: email, provider: ProviderOptions.EMAIL);
    changePageState(userStateEither);
  }

  setNextStep(_userState) {
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
    final UserData _userData = Get.put(UserData());
    final ConimalData _conimalData = Get.put(ConimalData());
    UserData.to.saveEmail(email);
    Get.toNamed(nextRoute);
  }

  changePageState(Either<Failure, UserState> userStateEither) {
    userStateEither.fold((failure) {
      ExceptionController().mapFailureToDialog(failure);
      change(UserState.NONE, status: RxStatus.empty());
    }, (userState) {
      if (userState == UserState.NONE) {
        _userState.value = userState;
        change(userState, status: RxStatus.empty());
      } else {
        _userState.value = userState;
        change(userState, status: RxStatus.success());
      }
    });
  }
}
