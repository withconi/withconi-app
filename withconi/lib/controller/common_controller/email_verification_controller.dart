import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/signup_repository.dart';

import '../../../import_basic.dart';

class EmailVerificationController extends GetxController {
  final AuthRepository _authRepository = AuthRepository.to;

  late String _email;

  String get email => _email;

  @override
  void onInit() {
    super.onInit();
    _email = AuthController.to.wcUser.value!.email;
  }

  sendVerificationEmail() async {
    var result =
        await _authRepository.sendVerificationEmail(email: 'asdfd@adsfd.com');
    result!.fold((l) => null, (r) => null);
  }

  checkEmailVerification({required String email}) async {
    var result = await _authRepository.sendVerificationEmail(email: email);
    result!.fold((l) => null, (r) => null);
  }
}
