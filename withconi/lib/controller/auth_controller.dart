import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/token_manager.dart';
import 'package:withconi/controller/signup/shared_data/conimal_data.dart';
import 'package:withconi/controller/signup/shared_data/user_data.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/signup_conimal_data_repository.dart';
import 'package:withconi/data/repository/signup_user_repository.dart';
import 'package:withconi/data/repository/user_repository.dart';
import '../configs/constants/auth_variables.dart';
import '../data/model/user.dart';
import '../import_basic.dart';
import '../ui/widgets/loading.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  final AuthRepository _authRepository = AuthRepository();
  final UserRepository _userRepository = UserRepository();

  final RxBool _isLoggedIn = false.obs;
  final Rxn<WcUser> wcUser = Rxn<WcUser>();
  bool _init = true;

  @override
  onReady() async {
    super.onReady();
    signOut();
    await Future.delayed(const Duration(milliseconds: 1300), () {});
    await setUserState(firebaseAuth.currentUser);
  }

  setUserState(User? firebaseUser) async {
    _isLoggedIn.value = await _authRepository.isUserLoggedIn();
    _setUserInfo(_isLoggedIn.value);
  }

  _setUserInfo(bool isLoggedIn) async {
    if (isLoggedIn) {
      Either<Failure, WcUser> wcUserEither = await _userRepository
          .getUserInfoWithUid(uid: firebaseAuth.currentUser!.uid);
      wcUserEither.fold((fail) {
        wcUser.value = null;
        FailureInterpreter().mapFailureToDialog(fail);
      }, (user) {
        wcUser.value = user;
      });
    } else {
      wcUser.value = null;
    }
    _setInitialPage(wcUser.value);
  }

  _setInitialPage(WcUser? wcUser) {
    if (wcUser == null) {
      Get.offAllNamed(Routes.START);
    } else {
      _disposeSavedData();
      Get.offAllNamed(Routes.HOME, arguments: wcUser);
    }
  }

  _disposeSavedData() {
    SignupUserRepository.to.dispose();
    ConimalRepository.to.dispose();
  }

  signOut() async {
    await _authRepository.signOut();
    await setUserState(firebaseAuth.currentUser);
  }
}
