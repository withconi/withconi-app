import 'package:dartz/dartz.dart';
import 'package:withconi/configs/helpers/calculator.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/signup_conimal_data_repository.dart';
import 'package:withconi/data/repository/signup_user_data_repository.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../import_basic.dart';
import 'shared_data/user_data.dart';

class SignupConimal2Controller extends GetxController {
  final SignupUserRepository _userRepository = SignupUserRepository();
  final ConimalRepository _conimalRepository = ConimalRepository();
  final AuthRepository _authRepository = AuthRepository();
  final RxString _userName = ''.obs;
  RxList<Conimal> conimalList = RxList<Conimal>();
  String get userName => _userName.value;

  @override
  void onReady() {
    super.onReady();
    _userName.value = _userRepository.getUserName();
    _conimalRepository.visitedConimal2Page = true;
    getConimalList();
  }

  getConimalList() {
    Either<Failure, List<Conimal>> getListResultEither =
        _conimalRepository.getAllTempConimal();
    getListResultEither.fold(
        (fail) => FailureInterpreter().mapFailureToDialog(fail),
        (list) => conimalList.assignAll(list));
  }

  calculateConimalAge(int index) {
    int age = Calculator().calculateAge(conimalList[index].birthDate);

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
        _conimalRepository.removeTempConimal(index);
    removeResultEither.fold(
        (fail) => FailureInterpreter().mapFailureToDialog(fail),
        (success) => getConimalList());
  }

  registerConimals() {
    Either<Failure, bool> registerConimalEither =
        _conimalRepository.registerConimals();
    registerConimalEither.fold(
        (fail) => FailureInterpreter().mapFailureToDialog(fail),
        (success) => signUp());
  }

  signUp() {
    _authRepository.signUp();
  }
}
