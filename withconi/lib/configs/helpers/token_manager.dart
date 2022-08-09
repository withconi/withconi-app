import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/extension.dart';
import 'package:withconi/configs/helpers/cache_manager.dart';

@override
class WcTokenManager with CacheManager {
  Provider getTokenProvider() {
    String tokenProvider = getCache(CacheControllerKey.PROVIDER);
    print(tokenProvider);
    return (tokenProvider.isEmpty)
        ? Provider.none
        : tokenProvider.toProviderOptions();
  }

  String getToken(CacheControllerKey cacheControllerKey) =>
      getCache(cacheControllerKey);

  void saveAccessToken(String token) =>
      saveCache(CacheControllerKey.ACCESS_TOKEN, token);

  void saveRefreshToken(String token) =>
      saveCache(CacheControllerKey.REFRESH_TOKEN, token);

  void saveTokenProvider(Provider tokenProvider) =>
      saveCache(CacheControllerKey.PROVIDER, tokenProvider.toString());
}
