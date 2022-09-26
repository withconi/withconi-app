import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as kakao;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:withconi/configs/constants/api_url.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/constants/auth_variables.dart';
import 'package:withconi/configs/helpers/extension.dart';
import 'package:withconi/core/custom_auth_info.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/core/network_handling/network_service.dart';
import 'package:withconi/data/model/custom_token.dart';

import '../model/user.dart';

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
