import 'package:firebase_auth/firebase_auth.dart';

import '../../../../import_basic.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../../../core/values/constants/auth_variables.dart';
import '../../../data/repository/app_setting_repository.dart';
import '../../../data/repository/user_repository.dart';
import '../../../global_widgets/loading/loading_overlay.dart';
import '../../auth/auth_controller.dart';

class ChangePasswordController extends GetxController {
  ChangePasswordController(this._email);
  late final String _email;
  String get email => _email;
  RxBool isPasswardEmailSent = false.obs;

  sendVerificationEmail() async {
    try {
      showLoading(() async {
        await firebaseAuth.sendPasswordResetEmail(email: email);
        await AuthController.to
            .signOut(goToStartPage: false, activeLoading: false);
      });
      isPasswardEmailSent.value = true;
    } catch (e) {
      isPasswardEmailSent.value = false;
    }
  }

  goToStartPage() {
    Get.offAllNamed(Routes.START);
  }
}
