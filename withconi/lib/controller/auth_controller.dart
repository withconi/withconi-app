import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/constants/auth_variables.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/ui/pages/start/start_page.dart';
import '../import_basic.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final AuthRepository _authRepository = AuthRepository();
  final Rx<ProviderOptions> provider = ProviderOptions.NONE.obs;
  final RxBool _isLoggedIn = false.obs;

  @override
  onInit() {
    super.onInit();
    provider.value = _authRepository.getAuthTokenProvider();
  }

  @override
  onReady() async {
    super.onReady();
    _isLoggedIn.value =
        await _authRepository.isUserLoggedIn(provider: provider.value);
    await Future.delayed(const Duration(milliseconds: 1300), () {
      _setInitialPage(_isLoggedIn.value);
    });
  }

  _setInitialPage(bool _isLoggedIn) {
    if (_isLoggedIn) {
      // Get.offAll(() => const HomePage());
    } else {
      Get.offAllNamed(Routes.START);
    }
  }
}
