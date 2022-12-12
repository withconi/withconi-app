import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:withconi/core/values/constants/auth_variables.dart';
import 'package:withconi/routes/bindings.dart';
import 'import_basic.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: Constants.WITHCONI_NATIVE_APP_KEY);
  await firebaseInitialization;
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await GetStorage.init();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: WcColors.white,
    ),
    initialRoute: Routes.SPLASH,
    initialBinding: InitialBinding(),
    defaultTransition: Transition.cupertino,
    getPages: WcPages.pages,
    // ignore: prefer_const_literals_to_create_immutables
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    // ignore: prefer_const_literals_to_create_immutables
    supportedLocales: [
      const Locale('ko', 'KR'),
    ],

    // navigatorKey: Utils.mainAppNav,
    // translationsKeys: AppTranslation.translations,
  ));
}
