import '../../../../import_basic.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../../../core/values/constants/auth_variables.dart';
import '../../../data/repository/app_setting_repository.dart';
import '../../../data/repository/user_repository.dart';
import '../../../global_widgets/loading/loading_overlay.dart';
import '../../auth/auth_controller.dart';

class ChangePasswordController extends GetxController {
  ChangePasswordController(this._userRepository);
  final UserRepository _userRepository;
  late String _email;

  String get email => _email;

  @override
  onInit() {
    super.onInit();
    _email = Get.arguments as String;
  }

  sendVerificationEmail() async {
    await AuthController.to.signOut(goToStartPage: false);
    Get.offNamed(Routes.PASSWORD_CHANGE_2, arguments: email);
  }
}
