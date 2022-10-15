import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/extension.dart';
import 'package:withconi/configs/helpers/cache_manager.dart';

@override
class WcTokenManager with CacheManager {
  Provider getTokenProvider() {
    String tokenProvider = getCache(CacheControllerKey.provider);
    return (tokenProvider.isEmpty)
        ? Provider.none
        : tokenProvider.toProviderOptions();
  }

  String getToken(CacheControllerKey cacheControllerKey) =>
      getCache(cacheControllerKey);

  void saveAccessToken(String token) =>
      saveCache(CacheControllerKey.accessToken, token);

  void saveRefreshToken(String token) =>
      saveCache(CacheControllerKey.refreshToken, token);

  Future<void> saveProvider(Provider tokenProvider) async =>
      await saveCache(CacheControllerKey.provider, tokenProvider.toString());

  void saveEmailVerificationInfo(
      {required String isEmailVerified, required String isEmailVerifySkipped}) {
    saveCache(CacheControllerKey.emailVerified, isEmailVerified);
    saveCache(CacheControllerKey.emailVerifySkipped, isEmailVerifySkipped);
  }

  Future<void> removeAllcache() async {
    await clearCache();
  }
}
