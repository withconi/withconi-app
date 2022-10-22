import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/calculator.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/signup/data/signup_data_manager.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/core/custom_auth_info.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/ui/widgets/loading/loading_overlay.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../data/model/user.dart';
import '../../data/repository/conimal_repository.dart';
import '../../import_basic.dart';

class SignupConimalFinalController extends GetxController {
  // final SignupRepository _signUpRepository = Get.find();
  final SignUpDataManager _signUpDataManager = Get.find();
  // final ConimalRepository _signUpRepository = ConimalRepository.to;
  final AuthRepository _authRepository = AuthRepository();
  final RxString _userName = ''.obs;
  // late final Provider _provider;
  RxList<Conimal> conimalList = RxList<Conimal>();
  String get userName => _userName.value;
  RxBool isButtonValid = true.obs;

  @override
  void onReady() {
    super.onReady();
    _userName.value = _signUpDataManager.name;
    // _provider = AuthController.to.authInfo!.provider;
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
    conimalList.value = _signUpDataManager.conimalList;
    conimalList.refresh();
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
        _signUpDataManager.removeConimalIndex(index);
    removeResultEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToDialog(fail, 'deleteConimal'),
        (success) => getConimalList());
  }

  signUp() async {
    CustomAuthInfo authInfo = _signUpDataManager.authInfo;
    bool signUpSucceed = false;

    await showLoading((() async {
      Either<Failure, String> _userEither =
          await _authRepository.signUpFirebaseAuth(authInfo: authInfo);

      String? firebaseUid = _userEither.fold((fail) {
        FailureInterpreter().mapFailureToDialog(fail, 'signUpFirebaseAuth');
        return null;
      }, (uid) {
        return uid;
      });

      if (firebaseUid != null) {
        signUpSucceed = await signUpDB(firebaseUid: firebaseUid);
      }
    }));

    if (signUpSucceed) {
      await setWcUserInfo(provider: authInfo.provider);
    } else {
      return;
    }
  }

  setWcUserInfo({required Provider provider}) async {
    await AuthController.to.setUserInfo(redirectPage: true);
  }

  Future<bool> signUpDB({required String firebaseUid}) async {
    late WcUser newUser;
    newUser = _signUpDataManager.newUserForDb(firebaseUid: firebaseUid);
    Either<Failure, String> dbUserEither =
        await _authRepository.signUpUserDB(wcUser: newUser);

    bool success = dbUserEither.fold((l) {
      FailureInterpreter().mapFailureToSnackbar(l, 'signUpDB');
      return false;
    }, (r) => true);

    return success;
  }
}
