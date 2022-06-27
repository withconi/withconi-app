import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/signup_conimal_data_repository.dart';

import '../../../core/auth_info.dart';
import '../../../core/error_handling/failures.dart';
import '../../../data/model/conimal.dart';
import '../../../data/model/user.dart';
import '../../../import_basic.dart';

class UserData extends GetxController {
  static UserData get to => Get.find();
  ConimalRepository _conimalRepository = ConimalRepository();
  RxString _email = ''.obs;
  RxString _name = ''.obs;
  RxString _password = ''.obs;
  RxString _nickName = ''.obs;
  Rx<ProviderOptions> _provider = ProviderOptions.none.obs;
  Rxn<File> _profileImg = Rxn<File>();
  final Rxn<AuthInfo> _authInfo = Rxn<AuthInfo>();

  String get email => _email.value;
  String get name => _name.value;
  String get password => _password.value;
  String get nickName => _nickName.value;
  File? get profileImg =>
      (_profileImg.value == null) ? null : _profileImg.value;
  String? get profileImgPath =>
      (_profileImg.value == null) ? null : _profileImg.value!.path;
  AuthInfo? get authInfo => _authInfo.value;
  ProviderOptions get provider => _provider.value;

  void saveEmail(String email) {
    _email.value = email;
  }

  void saveProvider(ProviderOptions provider) {
    _provider.value = provider;
  }

  void saveName(String name) {
    _name.value = name;
  }

  void savePassword(String password) {
    _password.value = password;
  }

  void saveNickName(String nickName) {
    _nickName.value = nickName;
  }

  void saveProfileSrc(File? profileImg) {
    _profileImg.value = profileImg;
  }

  void saveAuthInfo(AuthInfo authInfo) {
    _authInfo.value = authInfo;
    _email.value = authInfo.email;
  }
}
