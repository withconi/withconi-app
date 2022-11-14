import 'package:flutter_naver_login/flutter_naver_login.dart';

import '../../../core/error_handling/exceptions.dart';

class NaverAPI {
  Future<String> getNaverToken() async {
    late String _naverToken;

    try {
      NaverAccessToken tokenInfo = await FlutterNaverLogin.currentAccessToken;
      _naverToken = tokenInfo.accessToken;
    } catch (e) {
      print(e);
    }

    return _naverToken;
  }

  Future<String> getNaverUserEmail() async {
    String _userEmail = '';
    NaverLoginResult result;
    NaverAccountResult accountResult;

    try {
      // await FlutterNaverLogin.isLoggedIn;
      if (await FlutterNaverLogin.isLoggedIn) {
        accountResult = await FlutterNaverLogin.currentAccount();
        _userEmail = accountResult.email;
      } else {
        result = await FlutterNaverLogin.logIn();
        _userEmail = result.account.email;
      }

      return _userEmail;
    } catch (e) {
      print(e);
      throw (PlatformSignInException());
    }
  }
}
