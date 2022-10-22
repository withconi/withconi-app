import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/dynamic_link_manager.dart';
import 'package:withconi/configs/helpers/token_manager.dart';
import 'package:withconi/configs/helpers/url_launcher.dart';

import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/user_repository.dart';
import 'package:withconi/ui/widgets/dialog/disease_editing_dialog.dart';
import '../configs/constants/auth_variables.dart';
import '../core/custom_auth_info.dart';
import '../data/model/user.dart';
import '../import_basic.dart';
import '../ui/widgets/dialog/icon_dialog.dart';
import '../ui/widgets/loading/loading_overlay.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  final AuthRepository _authRepository = Get.put(AuthRepository());
  final UserRepository _userRepository = Get.put(UserRepository());
  final DynamicLinkManager _dynamicLinkManager = DynamicLinkManager();
  final Rxn<WcUser> wcUser = Rxn<WcUser>();
  final Rxn<CustomAuthInfo> _authInfo = Rxn<CustomAuthInfo>();
  RxInt homeNavIndex = 0.obs;
  CustomAuthInfo? get authInfo => _authInfo.value;
  Uri? deepLink;
  bool isUserVerified = false;

  @override
  void onInit() async {
    super.onInit();
    await _dynamicLinkManager.setup();
  }

  @override
  onReady() async {
    super.onReady();

    bool? newestVersion = await checkAppVersion();

    // if (newestVersion != null) {
    //   if (newestVersion == true) {
    //     await setUserInfo(redirectPage: true);
    //   } else if (newestVersion == false) {
    //     await showUpdateDialog();
    //   }
    // }
    if (newestVersion == false) {
      await showUpdateDialog();
    } else {
      await setUserInfo(redirectPage: true);
    }
  }

  onAuthInfoChanged({required CustomAuthInfo authInfo}) {
    _authInfo.value = authInfo;
  }

  Future<bool?> checkAppVersion() async {
    Either<Failure, bool> checkVersionEither =
        await _authRepository.checkAppVersion();

    bool? newestVersion = checkVersionEither.fold((l) {
      FailureInterpreter().mapFailureToDialog(l, 'checkAppVersion');
      return null;
    }, (r) => r);

    return newestVersion;
  }

  Future<void> setUserInfo({
    required bool redirectPage,
  }) async {
    // bool _isUserValid =
    //     await _authRepository.checkValidUserByPlatform(provider: _provider);

    bool _isUserValid = true;
    late bool _setUserSucceed;

    if (_isUserValid && firebaseAuth.currentUser != null) {
      _setUserSucceed = await _setWcUser();
    } else {
      wcUser.value = null;
      _setUserSucceed = true;
    }

// TODO : 회원가입 후에 setuser 실패하면 그냥 초기 화면에 있어야 하고, 앱 켯을때 setUser 실패면 로그인 화면으로
    if (redirectPage) {
      _setInitialPage(wcUser.value);
    }
  }

  Future<bool> _setWcUser() async {
    Either<Failure, WcUser> wcUserEither = await showLoading(() =>
        _userRepository.getUserInfoWithUid(uid: firebaseAuth.currentUser!.uid));

    bool succeed = wcUserEither.fold((fail) {
      wcUser.value = null;
      FailureInterpreter().mapFailureToDialog(fail, 'setUserInfo');
      return false;
    }, (user) {
      wcUser.value = user;
      return true;
    });
    return succeed;
  }

  Future<void> _setInitialPage(WcUser? wcUser) async {
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

  Future<void> refreshWcUserInfo() async {
    Either<Failure, WcUser> wcUserEither =
        await _userRepository.getUserInfoWithUid(uid: wcUser.value!.uid);

    wcUserEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail, 'updateUserInfo');
    }, (user) {
      wcUser.value = user;
    });
  }

  Future<void> showUpdateDialog() async {
    return await showIconDialog(
        buttonText: '업데이트 하러가기',
        onButtonTap: () {
          UrlLauncher().launchStore();
        },
        title: 'Withconi 최신버전 출시!',
        subtitle: '원활한 서비스 이용을 위해서는\n업데이트가 반드시 필요해요 :)');
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    await setUserInfo(redirectPage: true);
  }
}
