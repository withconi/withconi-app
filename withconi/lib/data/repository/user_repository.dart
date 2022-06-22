import 'dart:io';
import '../../controller/signup/shared_data/user_data.dart';

class UserRepository {
  uploadProfileImage() {}

  deleteProfileImage() {}

  editProfileImage() {}

  saveUserEmail(String email) {
    UserData.to.saveEmail(email);
  }

  getUserEmail() {
    return UserData.to.email;
  }

  getUserName() {
    return UserData.to.name;
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

  saveUserProfile(File profileFile) {
    UserData.to.saveProfileSrc(profileFile);
  }

  registerUserDB() {}
}
