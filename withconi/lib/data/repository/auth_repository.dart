import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/token_manager.dart';
import 'package:withconi/data/model/token.dart';
import 'package:withconi/data/provider/auth_api.dart';

class AuthRepository {
  final AuthAPI _api = AuthAPI();
  final TokenManager _tokenManager = TokenManager();

  // Future<TokenModel> newToken() => _api.newCustomAuthToken();

  ProviderOptions getAuthTokenProvider() => _tokenManager.getTokenProvider();

  Future<UserCredential?> signUpWithEmail(
          {required String email, required String password}) =>
      _api.signUpWithEmail(email: email, password: password);

  Future<UserCredential?> signInWithEmail(
          {required String email, required String password}) =>
      _api.signInWithEmail(email: email, password: password);

  Future<UserCredential?> signInWithGoogle() => _api.signInWithGoogle();

  Future<UserCredential?> signInWithToken(
          {required ProviderOptions provider}) =>
      _api.signInWithToken(provider: provider);

  Future<bool> isUserLoggedIn({required ProviderOptions provider}) =>
      _api.isUserLoggedIn(provider: provider);

  Future<bool> checkDuplicateEmail({required String email}) =>
      _api.checkDuplicateEmail(email: email);
}
