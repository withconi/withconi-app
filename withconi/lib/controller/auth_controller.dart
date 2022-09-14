import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/dynamic_link_manager.dart';
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
  final DynamicLinkManager _dynamicLinkManager = DynamicLinkManager();

  final Rxn<WcUser> wcUser = Rxn<WcUser>();
  final Rxn<CustomAuthInfo> _authInfo = Rxn<CustomAuthInfo>();
  RxInt homeNavIndex = 0.obs;

  CustomAuthInfo? get authInfo => _authInfo.value;
  Provider get _provider => TokenManager().getTokenProvider();
  Uri? deepLink;
  bool isUserVerified = false;

  // Rxn<User> firebaseUser = Rxn<User>();
  // Stream<User?> get user => firebaseAuth.authStateChanges();

  @override
  void onInit() async {
    super.onInit();
    await _dynamicLinkManager.setup();
  }

  @override
  onReady() async {
    super.onReady();

    await Future.delayed(const Duration(milliseconds: 1000), () async {
      await setUserInfo(redirectPage: true);
    });
  }

  onAuthInfoChanged({required CustomAuthInfo authInfo}) {
    _authInfo.value = authInfo;
  }

  setUserInfo({
    required bool redirectPage,
  }) async {
    bool _isUserValid =
        await _authRepository.checkValidUserByPlatform(provider: _provider);

    if (_isUserValid) {
      await _setWcUser();
    } else {
      wcUser.value = null;
    }

    if (redirectPage) {
      _setInitialPage(wcUser.value);
    }
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

  _setInitialPage(WcUser? wcUser) async {
    if (wcUser == null) {
      await Get.offAllNamed(Routes.START);
    } else if (wcUser.provider == Provider.email &&
        !wcUser.isEmailVerified &&
        !wcUser.verificationSkipped) {
      await Get.offAllNamed(Routes.EMAIL_VERIFICATION,
          arguments: {'nextRoute': Routes.HOME});
    } else {
      await Get.offAllNamed(Routes.NAVIGATION);
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

  signOut() async {
    await _authRepository.signOut();
    TokenManager().clearCache();
    await setUserInfo(redirectPage: true);
  }
}
