import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as kakao;

class KakaoAPI {
  Future<String> getKakaoUserEmail() async {
    late String? _userEmail;
    try {
      kakao.OAuthToken token =
          await kakao.UserApi.instance.loginWithKakaoTalk();
      kakao.TokenManagerProvider.instance.manager.setToken(token);
      print('로그인 성공 ${token.accessToken}');
    } catch (error) {
      print('로그인 실패 $error');
    }
    try {
      var user = await kakao.UserApi.instance.me();

      _userEmail = user.kakaoAccount?.email;
    } catch (e) {
      print(e);
    }

    return _userEmail!;
  }

  Future<String> getKakaoToken() async {
    late String _kakaoToken;

    try {
      kakao.OAuthToken? oAuthToken =
          await kakao.TokenManagerProvider.instance.manager.getToken();
      _kakaoToken = oAuthToken!.accessToken;
    } catch (e) {
      print(e);
    }

    return _kakaoToken;
  }

  Future<bool> checkKakaoTokenValid() async {
    if (await kakao.AuthApi.instance.hasToken()) {
      try {
        kakao.AccessTokenInfo tokenInfo =
            await kakao.UserApi.instance.accessTokenInfo();

        print('토큰 유효성 체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');
        if (tokenInfo.expiresIn < 0) {
          return false;
        } else {
          return true;
        }
      } catch (error) {
        if (error is kakao.KakaoException && error.isInvalidTokenError()) {
          print('토큰 만료 $error');
        } else {
          print('토큰 정보 조회 실패 $error');
        }

        return false;
      }
    } else {
      print('발급된 토큰 없음');
      return false;
    }
  }
}
