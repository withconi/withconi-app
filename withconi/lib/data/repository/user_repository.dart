import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/data/repository/conimal_repository.dart';

import '../../controller/failure_ui_interpreter.dart';
import '../../controller/signup/shared_data/user_data.dart';
import '../../core/auth_info.dart';
import '../../core/error_handling/failures.dart';
import '../model/conimal.dart';
import '../model/user.dart';

class UserRepository {
  UserRepository._internal();
  static final _singleton = UserRepository._internal();
  factory UserRepository() => _singleton;

  ConimalRepository _conimalRepository = ConimalRepository();

  uploadProfileImage() {}

  deleteProfileImage() {}

  editProfileImage() {}

  String getUserEmail() {
    return UserData.to.email;
  }

  getUserName() {
    return UserData.to.name;
  }

  getProvider() {
    return UserData.to.provider;
  }

  saveUserEmail(String email) {
    UserData.to.saveEmail(email);
  }

  saveUserAuthInfo(AuthInfo authInfo) {
    UserData.to.saveAuthInfo(authInfo);
  }

  saveUserName(String name) {
    UserData.to.saveName(name);
  }

  saveUserPassword(String password) {
    UserData.to.savePassword(password);
  }

  saveUserNickname(String nickName) {
    UserData.to.saveNickName(nickName);
  }

  saveUserProfile(File? profileFile) {
    UserData.to.saveProfileSrc(profileFile);
  }

  saveProvider(ProviderOptions provider) {
    UserData.to.saveProvider(provider);
  }

  registerUserDB() {}

  WcUser? newUser() {
    Either<Failure, List<Conimal>> allConimalEither =
        _conimalRepository.getAllTempConimal();
    allConimalEither.fold(
        (fail) => FailureInterpreter().mapFailureToDialog(fail), (conimals) {
      WcUser newUser = WcUser(
          uid: DateTime.now().millisecondsSinceEpoch.toString(),
          email: UserData.to.email,
          displayName: UserData.to.name,
          nickname: UserData.to.nickName,
          provider: UserData.to.provider,
          photoURL: UserData.to.profileImg?.path,
          conimals: conimals);
      return newUser;
    });
  }
}
