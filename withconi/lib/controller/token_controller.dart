import 'package:withconi/configs/enum.dart';
import 'package:withconi/configs/helpers/extension.dart';
import 'package:withconi/controller/cache_manager.dart';

import 'kakao_auth_controller.dart';

@override
class TokenController with CacheManager {
  String? getTokenProvider() {
    String? tokenProvider = getCache(CacheControllerKey.TOKEN_PROVIDER);
    return (tokenProvider == null) ? '' : tokenProvider;
  }

  void getToken(CacheControllerKey cacheControllerKey) {
    getCache(cacheControllerKey);
  }

  void saveAccessToken(String token) {
    saveCache(CacheControllerKey.ACCESS_TOKEN, token);
  }

  void saveRefreshToken(String token) {
    saveCache(CacheControllerKey.REFRESH_TOKEN, token);
  }

  void saveTokenProvider(String tokenProvider) {
    saveCache(CacheControllerKey.TOKEN_PROVIDER, tokenProvider);
  }

  validateToken() {
    String tokenProviderString = getCache(CacheControllerKey.TOKEN_PROVIDER);

    if (tokenProviderString.isEmpty) {
      // _isLoggedIn = false.obs;
    } else {
      TokenProviderOptions tokenProvider =
          TokenProviderOptions.values.enumFromString(tokenProviderString);
      switch (tokenProvider) {
        case TokenProviderOptions.KAKAO:
          KakaoAuthController().tokenValidation();
          break;
        case TokenProviderOptions.GOOGLE:
          break;
        case TokenProviderOptions.NAVER:
          break;
        case TokenProviderOptions.EMAIL:
          break;
        case TokenProviderOptions.APPLE:
          break;

        default:
      }
    }
  }
}
