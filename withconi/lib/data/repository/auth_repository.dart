import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/token_manager.dart';
import 'package:withconi/data/model/token.dart';
import 'package:withconi/data/provider/auth_api.dart';

class AuthRepository {
  final AuthAPI _api = Get.find<AuthAPI>();
  final TokenManager _tokenManager = Get.find<TokenManager>();

  // Future<TokenModel> newToken() => _api.newCustomAuthToken();

  ProviderOptions getAuthTokenProvider() => _tokenManager.getTokenProvider();

  Future<UserCredential?> signUpWithEmail() => _api.signUpWithEmail();

  Future<UserCredential?> signInWithEmail() => _api.signInWithEmail();

  Future<UserCredential?> signInWithGoogle() => _api.signInWithGoogle();

  Future<UserCredential?> signInWithToken() => _api.signInWithToken();

  bool isUserLoggedIn({required ProviderOptions provider}) =>
      _api.isUserLoggedIn(provider: provider);

  Future<TokenModel> authWithLogin({
    required String email,
    required String password,
    required String token,
  }) =>
      _api.validateWithLogin(email: email, password: password, token: token);
}
