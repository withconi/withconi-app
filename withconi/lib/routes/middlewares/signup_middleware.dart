import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:withconi/data/repository/signup_repository.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/module/signup/signup_data_storage.dart';

import '../routes.dart';

class SignUpMiddleware extends GetMiddleware {
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
    Get.delete<SignUpDataStorage>();
    Get.delete<SignUpRepository>();
  }

  // @override
  // RouteSettings? redirect(String? route) {
  //   if (!AuthController.to.isUserLoggedIn) {
  //     return const RouteSettings(name: Routes.START);
  //   } else if (!AuthController.to.isEmailVerified) {
  //     return const RouteSettings(name: Routes.EMAIL_VERIFICATION);
  //   }
  //   return null;
  // }
}
