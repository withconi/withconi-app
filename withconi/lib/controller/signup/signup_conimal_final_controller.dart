import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/calculator.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/auth_repository.dart';

import 'package:withconi/data/repository/signup_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../data/repository/conimal_repository.dart';
import '../../import_basic.dart';

class SignupConimalFinalController extends GetxController {
  final SignupRepository _signUpRepository = SignupRepository.to;
  // final ConimalRepository _signUpRepository = ConimalRepository.to;
  final AuthRepository _authRepository = AuthRepository();
  final RxString _userName = ''.obs;
  RxList<Conimal> conimalList = RxList<Conimal>();
  String get userName => _userName.value;
  RxBool isButtonValid = true.obs;

  @override
  void onReady() {
    super.onReady();
    _userName.value = _signUpRepository.name;
    getConimalList();
    print(conimalList);
    ever(conimalList, validateButton);
  }

  validateButton(_conimalList) {
    if (_conimalList.length <= 0) {
      isButtonValid.value = false;
    } else {
      isButtonValid.value = true;
    }
  }

  getConimalList() {
    conimalList.value = _signUpRepository.conimalList;
  }

  calculateConimalAge(int index) {
    int age = TimeCalculator().calculateAge(conimalList[index].birthDate);

    return age;
  }

  addConimal() {
    Get.toNamed(Routes.SIGNUP_CONIMAL_STEP1);
  }

  editConimal(int index) {
    Get.toNamed(Routes.SIGNUP_CONIMAL_EDIT, arguments: {'index': index});
  }

  deleteConimal(int index) {
    Either<Failure, bool> removeResultEither =
        _signUpRepository.removeConimalIndex(index);
    removeResultEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToDialog(fail, 'deleteConimal'),
        (success) => getConimalList());
  }

  signUp() {
    List<Conimal> conimalList = _signUpRepository.conimalList;
    showLoading((() async {
      Either<Failure, User?> _userEither = await _authRepository.signUp(
          password: _signUpRepository.password,
          conimalList: conimalList,
          authInfo: AuthController.to.authInfo!);

      _userEither.fold(
          (fail) => FailureInterpreter().mapFailureToDialog(fail, 'signUp'),
          (user) async {
        await AuthController.to.setUserInfo(redirectPage: false);
        await Get.offAllNamed(Routes.EMAIL_VERIFICATION,
            arguments: {'nextRoute': Routes.HOME});
      });
    }));
  }
}
