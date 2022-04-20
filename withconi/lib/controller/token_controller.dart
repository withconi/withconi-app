// ignore_for_file: constant_identifier_names

import 'package:get_storage/get_storage.dart';

mixin TokenController {
  Future<bool> saveToken(String? accessToken, String? refreshToken,
      TokenProviderOptions tokenProvider) async {
    final box = GetStorage();
    await box.write(TokenControllerKey.ACCESS_TOKEN.toString(), accessToken);
    await box.write(TokenControllerKey.REFRESH_TOKEN.toString(), refreshToken);
    await box.write(
        TokenControllerKey.PROVIDER.toString(), tokenProvider.toString());
    return true;
  }

  String? getAccessToken() {
    final box = GetStorage();
    return box.read(TokenControllerKey.ACCESS_TOKEN.toString());
  }

  String? getRefreshToken() {
    final box = GetStorage();
    return box.read(TokenControllerKey.REFRESH_TOKEN.toString());
  }

  String? getTokenProvider() {
    final box = GetStorage();
    return box.read(TokenControllerKey.PROVIDER.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(TokenControllerKey.ACCESS_TOKEN.toString());
    await box.remove(TokenControllerKey.REFRESH_TOKEN.toString());
    await box.remove(TokenControllerKey.PROVIDER.toString());
  }
}

enum TokenControllerKey { ACCESS_TOKEN, REFRESH_TOKEN, PROVIDER }
enum TokenProviderOptions { KAKAO, NAVER, GOOGLE, APPLE, EMAIL }
