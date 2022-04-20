import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:withconi/routes/withconi_pages.dart';
import 'configs/sns_login/firebase_auth_constants.dart';
import 'configs/sns_login/kakao_constants.dart';
import 'controller/auth_controller.dart';
import 'routes/withconi_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: WITHCONI_NATIVE_APP_KEY);
  await firebaseInitialization.then((value) {
    Get.put(AuthController());
  });
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.START,
    // theme: appThemeData,
    defaultTransition: Transition.fade,
    getPages: WCPages.pages,
    // locale: Locale('pt', 'BR'),
    // translationsKeys: AppTranslation.translations,
  ));
}
