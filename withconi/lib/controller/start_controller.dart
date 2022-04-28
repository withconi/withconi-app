import 'package:withconi/data/model/token.dart';
import 'package:withconi/data/repository/auth_repository.dart';

import '../import_basic.dart';

class StartPageController extends GetxController {
  final _repository = Get.find<AuthRepository>();

  String _email = '', _password = '';

  void onEmailChange(String email) {
    _email = email;
  }

  void onPasswordChange(String password) {
    _password = password;
  }

  Future<void> onSignInPressed() async {
    try {
      final requestToken = Get.arguments as String;

      /// call data arguments to from Get.offNamed (event push data Controller)
      print('[REQUEST TOKEN] =======> [ $requestToken ]');
      final TokenModel authToken = await _repository.authWithLogin(
        email: _email,
        password: _password,
        token: requestToken,
      );
    } catch (e) {
      print(e);
    }
  }
}
