import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/token_manager.dart';
import 'package:withconi/controller/signup/user_data.dart';
import 'package:withconi/data/provider/auth_api.dart';

import '../../core/auth_info.dart';

class AuthRepository {
  final AuthAPI _api = AuthAPI();
  final WcTokenManager _tokenManager = WcTokenManager();
  // Future<TokenModel> newToken() => _api.newCustomAuthToken();

  ProviderOptions getAuthTokenProvider() => _tokenManager.getTokenProvider();

  // Future<UserCredential?> signInWithEmail(
  //         {required String email, required String password}) =>
  //     _api.signInWithEmail(email: email, password: password);

  Future<UserState> signInWithGoogle() async {
    late UserState userState;
    AuthInfo authInfo = await _api.signInWithGoogle();
    userState = await checkUserStateByEmail(
        email: authInfo.email, provider: ProviderOptions.GOOGLE);
    saveUserNativeAuthInfo(
        provider: ProviderOptions.GOOGLE, authObject: authInfo);
    return userState;
  }

  Future<UserState> signInWithApple() async {
    late UserState userState;
    AuthInfo authInfo = await _api.signInWithApple();
    userState = await checkUserStateByEmail(
        email: authInfo.email, provider: ProviderOptions.APPLE);
    saveUserNativeAuthInfo(
        provider: ProviderOptions.APPLE, authObject: authInfo);
    return userState;
  }

  Future<UserState> signInWithKakao() async {
    late UserState userState;
    AuthInfo authInfo = await _api.signInWithKakao();
    userState = await checkUserStateByEmail(
        email: authInfo.email, provider: ProviderOptions.KAKAO);
    saveUserNativeAuthInfo(
        provider: ProviderOptions.KAKAO, authObject: authInfo);
    return userState;
  }

  Future<UserState> signInWithNaver() async {
    late UserState userState;
    AuthInfo authInfo = await _api.signInWithNaver();
    userState = await checkUserStateByEmail(
        email: authInfo.email, provider: ProviderOptions.NAVER);
    saveUserNativeAuthInfo(
        provider: ProviderOptions.NAVER, authObject: authInfo);
    return userState;
  }

  Future<bool> isUserLoggedIn({required ProviderOptions provider}) =>
      _api.isUserLoggedIn(provider: provider);

  Future<UserState> checkUserStateByEmail(
      {required String email, required ProviderOptions provider}) async {
    final bool isDuplicateUser = await _api.checkDuplicateEmail(email: email);
    if (isDuplicateUser && provider == ProviderOptions.EMAIL) {
      return UserState.SIGN_IN_EMAIL;
    } else {
      if (provider == ProviderOptions.EMAIL) {
        return UserState.SIGN_UP_EMAIL;
      } else {
        return UserState.SIGN_UP_SNS;
      }
    }
  }

  Future<bool> saveUserNativeAuthInfo(
      {required ProviderOptions provider, required AuthInfo authObject}) async {
    _tokenManager.saveTokenProvider(ProviderOptions.KAKAO);
    UserData.to.saveAuthInfo(authObject);
    return true;
  }
}
