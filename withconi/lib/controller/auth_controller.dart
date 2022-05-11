import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/constants/firebase_auth_constants.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/ui/pages/start/start_page.dart';
import '../import_basic.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final AuthRepository _authRepository = Get.find<AuthRepository>();
  late Rx<ProviderOptions> _provider;
  final FirebaseAuth _auth = auth;
  final RxBool _isLoggedIn = false.obs;

  @override
  void onReady() {
    super.onReady();
    _provider.value = _authRepository.getAuthTokenProvider();
    _isLoggedIn.value =
        _authRepository.isUserLoggedIn(provider: _provider.value);

    once(_isLoggedIn, _setInitialPage);
  }

  _setInitialPage(_isLoggedIn) async {
    if (_isLoggedIn) {
      Get.offAll(() => const StartPage());
    } else {
      //  Get.offAll(() => const HomePage());
    }
  }
}
