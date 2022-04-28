import 'package:get/get.dart';
import 'package:withconi/data/model/token.dart';
import 'package:withconi/data/provider/auth_api.dart';

class AuthRepository {
  final AuthAPI _api = Get.find<AuthAPI>();

  Future<TokenModel> newToken() => _api.newToken();

  Future<TokenModel> authWithLogin({
    required String email,
    required String password,
    required String token,
  }) =>
      _api.validateWithLogin(email: email, password: password, token: token);
}
