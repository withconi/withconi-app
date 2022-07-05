import 'package:dartz/dartz.dart';
import 'package:withconi/configs/helpers/calculator.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/signup_conimal_data_repository.dart';
import 'package:withconi/data/repository/signup_user_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../import_basic.dart';
import 'shared_data/user_data.dart';

class SignupConimal2Controller extends GetxController {
  final SignupUserRepository _signupUserRepository = SignupUserRepository.to;
  final ConimalRepository _conimalRepository = ConimalRepository.to;
  final AuthRepository _authRepository = AuthRepository();
  final RxString _userName = ''.obs;
  RxList<Conimal> conimalList = RxList<Conimal>();
  String get userName => _userName.value;
  RxBool isButtonValid = true.obs;

  @override
  void onReady() {
    super.onReady();
    _userName.value = _signupUserRepository.name;
    _conimalRepository.visitedConimal2Page = true;
    getConimalList();
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

  signUp() {
    List<Conimal> conimalList = _conimalRepository.tempConimalList;
    showLoading((() async {
      await _authRepository.signUp(
          conimalList: conimalList, password: _signupUserRepository.password);
    }));
  }
}
