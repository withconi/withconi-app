import '../../../core/auth_info.dart';
import '../../../import_basic.dart';

class UserData extends GetxController {
  static UserData get to => Get.find();
  late RxString _email;
  late RxString _name;
  late RxString _password;
  late RxString _nickName;
  late RxString _profileSrc;
  final Rxn<AuthInfo> _authInfo = Rxn<AuthInfo>();

  String get email => _email.value;
  String get name => _name.value;
  String get password => _password.value;
  String get nickName => _nickName.value;
  String get profileSrc => _profileSrc.value;
  AuthInfo? get authInfo => _authInfo.value;

  @override
  void onInit() {
    super.onInit();
    _email = ''.obs;
    _name = ''.obs;
    _password = ''.obs;
    _nickName = ''.obs;
    _profileSrc = ''.obs;
  }

  void saveEmail(String email) {
    _email.value = email;
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

  void saveProfileSrc(String profileSrc) {
    _profileSrc.value = profileSrc;
  }

  void saveAuthInfo(AuthInfo authInfo) {
    _authInfo.value = authInfo;
    _email.value = authInfo.email;
  }
}
