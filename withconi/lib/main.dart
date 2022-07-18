import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:withconi/configs/constants/auth_variables.dart';
import 'package:withconi/routes/withconi_bindings.dart';
import 'import_basic.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: Constants.WITHCONI_NATIVE_APP_KEY);
  await firebaseInitialization;
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

    // translationsKeys: AppTranslation.translations,
  ));
}
