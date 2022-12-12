import 'dart:io';

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
import 'package:withconi/module/common/controllers/fcm_controller.dart';
import 'package:withconi/module/map/controllers/map_main_page_controller.dart';
import 'package:withconi/module/ui_model/user_ui_model.dart';
import 'package:withconi/routes/bindings.dart';
import '../../core/values/constants/auth_variables.dart';
import '../../data/repository/fcm_repository.dart';
import '../../import_basic.dart';
import '../../global_widgets/dialog/icon_dialog.dart';
import '../../global_widgets/loading/loading_overlay.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  AuthController(this._appSettingRepository, this._userRepository);
  final AppSettingRepository _appSettingRepository;
  final UserRepository _userRepository;
  // final DynamicLinkManager _dynamicLinkManager = DynamicLinkManager();
  UserUIModel? _userInfo;
  RxInt homeNavIndex = 0.obs;
  Uri? deepLink;
  late bool _isVersionValid;

  late bool _isUserInfoInDbAndAuth;
  // late bool _isFcmTokenValid = false;

  String get _firebaseAuthEmail => (firebaseAuth.currentUser == null)
      ? ''
      : firebaseAuth.currentUser!.email!;

  bool get isUserValid =>
      (_isFirebaseAuthValid && _isUserInfoInDbAndAuth && _userInfo != null);
  bool get isVersionValid => _isVersionValid;
  bool get isEmailVerified => _userInfo!.isEmailVerified;
  bool get isVerifySkipped => _userInfo!.verificationSkipped;
  bool get _isFirebaseAuthValid => (firebaseAuth.currentUser != null);

  UserUIModel get userInfo => _userInfo!;

  @override
  Future<void> onInit() async {
    super.onInit();
    _isVersionValid = await _setVersionValid();

    await setUserAuthInfo();

    Get.offAllNamed(Routes.NAVIGATION);
  }

  setUserAuthInfo() async {
    _isUserInfoInDbAndAuth = await _checkUserInfoValid(_firebaseAuthEmail);
    if (_isVersionValid && _isFirebaseAuthValid && _isUserInfoInDbAndAuth) {
      await _setUserDBInfo();
    } else if (_isFirebaseAuthValid && _isUserInfoInDbAndAuth) {
      await _setUserDBInfo();
    } else if (!_isFirebaseAuthValid && _isUserInfoInDbAndAuth) {
      signOut();
    }
  }

  Future<bool> _checkUserInfoValid(String email) async {
    if (email.isEmpty) {
      return false;
    } else {
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
  }

  // Provider _parseProviderData(UserInfo firebaseUserInfo) {
  //   if (firebaseUserInfo.providerId.contains('.com')) {
  //     return Provider.getByCode(
  //         firebaseUserInfo.providerId.replaceAll('.com', ''));
  //   } else {
  //     return Provider.getByCode(firebaseUserInfo.providerId);
  //   }
  // }

  Future<bool> _setVersionValid() async {
    Either<Failure, bool> checkVersionEither =
        await _appSettingRepository.checkAppVersion();

    bool versionCheckResult = checkVersionEither.fold((l) {
      FailureInterpreter().mapFailureToDialog(l, 'checkAppVersion');
      return false;
    }, (isVersionValid) => isVersionValid);

    return versionCheckResult;
  }

  Future<void> _setUserDBInfo() async {
    Either<Failure, UserResponseDTO> wcUserEither =
        await _userRepository.getUserInfo();

    _userInfo = wcUserEither.fold((fail) {
      FailureInterpreter().mapFailureToDialog(fail, 'setUserInfo');
      return null;
    }, (dto) {
      return _parseUserDto(dto);
    });
  }

  _parseUserDto(UserResponseDTO dto) {
    return UserUIModel.fromDTO(dto);
  }

  // Future<void> refreshWcUserInfo() async {
  //   Either<Failure, UserResponseDTO> wcUserEither =
  //       await _userRepository.getUserInfo();

  //   wcUserEither.fold((fail) {
  //     FailureInterpreter().mapFailureToDialog(fail, 'updateUserInfo');
  //   }, (userDto) {
  //     _userInfo = _parseUserDto(userDto);
  //   });
  // }

  Future<void> showUpdateDialog() async {
    return await showIconDialog(
        buttonText: '업데이트 하러가기',
        onButtonTap: () {
          UrlLauncher().launchStore();
        },
        title: 'Withconi 최신버전 출시!',
        subtitle: '원활한 서비스 이용을 위해서는\n업데이트가 반드시 필요해요 :)');
  }

  signOut({bool goToStartPage = true, bool activeLoading = true}) async {
    await showLoading(() async {
      await NavigationBinding().closeBindings();
      await _signOutFirebase();
      if (goToStartPage) {
        Get.offAllNamed(Routes.START);
        return;
      }
      return;
    }, activeLoding: activeLoading);
  }

  Future<void> _signOutFirebase() async {
    await firebaseAuth.signOut();
  }
}
