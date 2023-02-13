import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:withconi/core/values/constants/auth_variables.dart';
import 'package:withconi/routes/bindings.dart';
import 'import_basic.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: Constants.WITHCONI_NATIVE_APP_KEY);
  await firebaseInitialization;
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await GetStorage.init();
  final ThemeData theme = ThemeData();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
          colorScheme:
              theme.colorScheme.copyWith(secondary: Colors.transparent),
          scaffoldBackgroundColor: WcColors.white),

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
    ),
  );
}
