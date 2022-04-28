import 'package:google_sign_in/google_sign_in.dart';
import 'package:withconi/controller/cache_manager.dart';
import 'package:withconi/controller/token_controller.dart';

import '../import_basic.dart';

class AuthController extends GetxController with CacheManager {
  static AuthController instance = Get.find();
  // late Rx<User?> firebaseUser;
  // late Rx<GoogleSignInAccount?> googleSignInAccount;
  late RxBool _isLoggedIn;

  @override
  void onReady() {
    super.onReady();
    TokenController().validateToken();
    ever(_isLoggedIn, _setInitialScreen);

    // firebaseUser = Rx<User?>(auth.currentUser);
    // googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    // firebaseUser.bindStream(auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);

    // googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    // ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(_isLoggedIn) {
    if (_isLoggedIn) {
      // Get.offAll(() => const Register());
    } else {
      // Get.offAll(() => Home());
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // Get.offAll(() => const Register());
    } else {
      // Get.offAll(() => Home());
    }
  }
}
