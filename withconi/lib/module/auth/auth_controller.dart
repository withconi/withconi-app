import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/core/tools/helpers/dynamic_link_manager.dart';
import 'package:withconi/core/tools/helpers/url_launcher.dart';

import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/model/dto/response_dto/auth_response/user_response_dto.dart';
import 'package:withconi/data/provider/remote_provider/app_config_api.dart';
import 'package:withconi/data/repository/app_setting_repository.dart';
import 'package:withconi/data/repository/user_repository.dart';
import 'package:withconi/module/map/controllers/map_main_page_controller.dart';
import 'package:withconi/module/ui_model/user_ui_model.dart';
import '../../core/values/constants/auth_variables.dart';
import '../../import_basic.dart';
import '../../global_widgets/dialog/icon_dialog.dart';
import '../../global_widgets/loading/loading_overlay.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  AuthController(this._appSettingRepository, this._userRepository);
  // final AuthRepository _authRepository;
  final AppSettingRepository _appSettingRepository;
  final UserRepository _userRepository;
  // final AuthRepository _authRepository = Get.put(AuthRepository());
  // final UserRepository _userRepository = Get.put(UserRepository());
  final DynamicLinkManager _dynamicLinkManager = DynamicLinkManager();
  UserUIModel? userInfo;
  // final Rxn<CustomAuthInfo> _authInfo = Rxn<CustomAuthInfo>();
  RxInt homeNavIndex = 0.obs;
  Uri? deepLink;
  bool isUserVerified = false;
  bool isAuthenticated = false;
  bool isEmailVerified = false;
  bool emailVerificationSkipped = false;
  bool isUserLoggedIn = false;
  bool isLatestVersion = false;

  @override
  void onInit() async {
    super.onInit();
    await _setAppVersionStatus();
    await setUserInfo();
    Get.offAllNamed(Routes.NAVIGATION);
  }

  // @override
  // onReady() async {
  //   super.onReady();
  //   await setAuthConfig();
  //   Get.offAllNamed(Routes.NAVIGATION);
  // }

  _setAppVersionStatus() async {
    isLatestVersion = await _checkAppVersion();
  }

  Future<bool> setUserInfo() async {
    bool setDbInfoSucceed = false;
    isUserLoggedIn = await _checkUserLogInStatus();
    if (isLatestVersion && isUserLoggedIn) {
      setDbInfoSucceed = await _setDbUserInfo();
    }
    return setDbInfoSucceed;
  }

  _checkUserLogInStatus() async {
    bool isUser = false;
    if (firebaseAuth.currentUser != null) {
      isUser = _checkPlatformAuthStatus();
      isUser =
          await _checkIfUserInfoValid(email: firebaseAuth.currentUser!.email!);
    } else {
      isUser = false;
    }
    return isUser;
  }

  Future<bool> _checkIfUserInfoValid({required String email}) async {
    bool isUserInfoValid;
    var existenceEither =
        await _userRepository.getUserInfoExistence(email: email);

    isUserInfoValid = existenceEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, 'checkDuplicateEmail');
      return false;
    }, (checkResult) {
      if (checkResult.isAuth && checkResult.isDB) {
        return true;
      } else if (checkResult.isAuth) {
        print('🛑 Firebase Auth 에만 유저 정보 등록되어 있음');
        _clearFirebaseAuthUserData();
        return false;
      } else if (checkResult.isDB) {
        print('🛑 DB에만 유저 정보 등록되어 있음');
        return false;
      } else {
        return false;
      }
    });
    return isUserInfoValid;
  }

// TODO: firebaseAuth 유저 데이터 없애는 로직 구현하기
  _clearFirebaseAuthUserData() {}

  bool _checkPlatformAuthStatus() {
    List<UserInfo> userInfoList = firebaseAuth.currentUser!.providerData;
    List<Provider> providerList =
        userInfoList.map((e) => _parseProviderData(e)).toList();

    if (providerList.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Provider _parseProviderData(UserInfo firebaseUserInfo) {
    if (firebaseUserInfo.providerId.contains('.com')) {
      return Provider.getByCode(
          firebaseUserInfo.providerId.replaceAll('.com', ''));
    } else {
      return Provider.getByCode(firebaseUserInfo.providerId);
    }
  }

  // onAuthInfoChanged({required SignAuthInfo authInfo}) {
  //   _authInfo.value = authInfo;
  // }

  Future<bool> _checkAppVersion() async {
    Either<Failure, bool> checkVersionEither =
        await _appSettingRepository.checkAppVersion();

    bool isLatestVersion = checkVersionEither.fold((l) {
      FailureInterpreter().mapFailureToDialog(l, 'checkAppVersion');
      return false;
    }, (r) => r);

    return isLatestVersion;
  }

//   Future<void> setUserInfo({
//     required bool redirectPage,
//   }) async {
//     // bool _isUserValid =
//     //     await _authRepository.checkValidUserByPlatform(provider: _provider);

//     bool _isUserValid = true;
//     late bool _setUserSucceed;

//     if (_isUserValid && firebaseAuth.currentUser != null) {
//       _setUserSucceed = await _setUserInfo();
//     } else {
//       userInfo.value = null;
//       _setUserSucceed = true;
//     }

// // TODO : 회원가입 후에 setuser 실패하면 그냥 초기 화면에 있어야 하고, 앱 켯을때 setUser 실패면 로그인 화면으로
//     if (redirectPage) {
//       _setInitialPage(userInfo.value);
//     }
//   }

  Future<bool> _setDbUserInfo([bool? showLoader]) async {
    Either<Failure, UserResponseDTO> wcUserEither =
        await _userRepository.getUserInfo();

    var userDto = wcUserEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail, 'setUserInfo');
      return null;
    }, (dto) {
      return dto;
    });

    if (userDto != null) {
      userInfo = _parseUserDto(userDto);
      isEmailVerified = userInfo!.isEmailVerified;
      emailVerificationSkipped = userInfo!.verificationSkipped;
      isUserLoggedIn = true;
      return true;
    } else {
      isUserLoggedIn = false;
      return false;
    }
  }

  _parseUserDto(UserResponseDTO dto) {
    return UserUIModel.fromDTO(dto);
  }

  // Future<void> _setInitialPage(UserUIModel? wcUser) async {
  //   if (wcUser == null) {
  //     await Get.offAllNamed(Routes.START);
  //   } else if (wcUser.provider == Provider.email &&
  //       !wcUser.isEmailVerified &&
  //       !wcUser.verificationSkipped) {
  //     await Get.offAllNamed(Routes.EMAIL_VERIFICATION,
  //         arguments: {'nextRoute': Routes.HOME});
  //   } else {
  //     await Get.offAllNamed(Routes.NAVIGATION);
  //   }
  // }

  Future<void> refreshWcUserInfo() async {
    Either<Failure, UserResponseDTO> wcUserEither =
        await _userRepository.getUserInfo();

    wcUserEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail, 'updateUserInfo');
    }, (userDto) {
      userInfo = _parseUserDto(userDto);
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
    await _userRepository.signOut();
    await AuthController.to.setUserInfo();
    // Get.delete<MapMainPageController>(force: true);
    await Get.offAllNamed(Routes.START);
  }
}
