import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/signup_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';

import '../../../import_basic.dart';

class EmailVerificationController extends GetxController {
  final AuthRepository _authRepository = AuthRepository.to;

  late String _email;

  String get email => _email;

  @override
  Future<void> onInit() async {
    super.onInit();
    _email = AuthController.to.wcUser.value!.email;
    await sendVerificationEmail(email: email, currentPath: Get.currentRoute);
  }

  sendVerificationEmail(
      {required String email, required String currentPath}) async {
    var result = await _authRepository.sendVerificationEmail(
        email: email, currentPath: currentPath);
    result!.fold((l) => null, (r) => null);
  }

  // checkEmailVerification({required String email}) async {
  //   var result = await _authRepository.sendVerificationEmail(email: email,currentPath: currentPath);
  //   result!.fold((l) => null, (r) => null);
  // }

  resendVerificationEmail() async {
    var result = await showLoading(() => _authRepository.sendVerificationEmail(
        email: email, currentPath: Get.currentRoute));
    result!.fold((l) => null, (r) => null);
  }
}
