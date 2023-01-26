import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/auth/auth_controller.dart';

import '../routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    late RouteSettings? routeSettings;

    if (!AuthController.to.isVersionValid) {
      //버전 페이지 이동
      routeSettings = null;
    } else if (!AuthController.to.isUserValid) {
      if (AuthController.to.appInited) {
        routeSettings = const RouteSettings(name: Routes.START);
      } else {
        routeSettings = const RouteSettings(name: Routes.AGREEMENT);
      }
    } else if (AuthController.to.isUserValid &&
        !AuthController.to.isEmailVerified &&
        !AuthController.to.isVerifySkipped &&
        AuthController.to.userInfo.provider.signMethod != SignMethod.sns) {
      routeSettings = const RouteSettings(
          name: Routes.EMAIL_VERIFICATION,
          arguments: {'nextRoute': Routes.NAVIGATION});
    } else if (AuthController.to.isUserValid &&
        !AuthController.to.isEmailVerified &&
        !AuthController.to.isVerifySkipped) {
      //홈페이지 이동
      routeSettings = null;
    } else {
      routeSettings = null;
    }

    return routeSettings;
  }
}
