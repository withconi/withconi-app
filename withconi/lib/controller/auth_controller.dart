import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/token_manager.dart';

import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/user_repository.dart';
import '../configs/constants/auth_variables.dart';
import '../core/auth_info.dart';
import '../data/model/user.dart';
import '../import_basic.dart';
import '../ui/widgets/loading.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final AuthRepository _authRepository = Get.put(AuthRepository());
  final UserRepository _userRepository = Get.put(UserRepository());

  final Rxn<WcUser> wcUser = Rxn<WcUser>();
  final Rxn<AuthInfo> _authInfo = Rxn<AuthInfo>();
  RxInt homeNavIndex = 0.obs;

  AuthInfo? get authInfo => _authInfo.value;
  Provider get _provider => WcCacheManager().getTokenProvider();

  @override
  onReady() async {
    super.onReady();

    await Future.delayed(const Duration(milliseconds: 1300), () {});
    await setUserInfoAndPage();
  }

  onAuthInfoChanged({required AuthInfo authInfo}) {
    _authInfo.value = authInfo;
  }

  setUserInfoAndPage() async {
    bool _isUserValid =
        await _authRepository.checkValidUserByPlatform(provider: _provider);

    if (_isUserValid) {
      await _setWcUser();
    } else {
      wcUser.value = null;
    }
    _setInitialPage(wcUser.value);
  }

  _setWcUser() async {
    Either<Failure, WcUser> wcUserEither = await showLoading(() =>
        _userRepository.getUserInfoWithUid(uid: firebaseAuth.currentUser!.uid));

    wcUserEither.fold((fail) {
      wcUser.value = null;
      FailureInterpreter().mapFailureToDialog(fail, 'setUserInfo');
    }, (user) {
      wcUser.value = user;
    });
  }

  _setInitialPage(WcUser? wcUser) {
    bool emailVerified = false;
    bool skipEmailVerification = true;
    if (wcUser == null) {
      Get.offAllNamed(Routes.START);
    } else if (wcUser.provider == Provider.email &&
        !emailVerified &&
        !skipEmailVerification) {
      Get.offAllNamed(Routes.EMAIL_VERIFICATION);
    } else {
      Get.offAllNamed(Routes.HOME);
    }
  }

  refreshWcUserInfo() async {
    Either<Failure, WcUser> wcUserEither =
        await _userRepository.getUserInfoWithUid(uid: wcUser.value!.uid);

    wcUserEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail, 'updateUserInfo');
    }, (user) {
      wcUser.value = user;
    });
  }

  // _disposeSavedData() {
  //   SignupUserRepository.to.dispose();
  //   ConimalRepository.to.dispose();
  // }

  signOut() async {
    await _authRepository.signOut();
    WcCacheManager().clearCache();
    await setUserInfoAndPage();
  }
}
