import '../../../../import_basic.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../../../core/values/constants/auth_variables.dart';
import '../../../data/repository/app_setting_repository.dart';
import '../../../data/repository/user_repository.dart';
import '../../../global_widgets/loading/loading_overlay.dart';
import '../../auth/auth_controller.dart';

class ChangePasswordController2 extends GetxController {
  late String _email;

  String get email => _email;

  @override
  Future<void> onInit() async {
    super.onInit();
    _email = Get.arguments as String;
  }

  goToSignIn() {
    Get.offAllNamed(Routes.START);
  }
}
