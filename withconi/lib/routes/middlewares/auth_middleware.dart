import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:withconi/module/auth/auth_controller.dart';

import '../routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    return super.onPageCalled(page);
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    return super.onBindingsStart(bindings);
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    return super.onPageBuildStart(page);
  }

  @override
  void onPageDispose() {
    super.onPageDispose();
  }

  @override
  RouteSettings? redirect(String? route) {
    if (!AuthController.to.isUserLoggedIn) {
      return const RouteSettings(name: Routes.START);
    } else if (!AuthController.to.isEmailVerified &&
        !AuthController.to.emailVerificationSkipped) {
      return const RouteSettings(name: Routes.EMAIL_VERIFICATION);
    } else if (AuthController.to.isUserLoggedIn &&
        (AuthController.to.isEmailVerified ||
            AuthController.to.emailVerificationSkipped)) {
      // AuthController.to.setUserInfo();
      return null;
    } else {
      return null;
    }
  }
}