import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:withconi/configs/constants/auth_variables.dart';
import 'import_basic.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: Constants.WITHCONI_NATIVE_APP_KEY);
  await firebaseInitialization;
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: WcColors.white),
    initialRoute: Routes.SPLASH,
    defaultTransition: Transition.cupertino,
    getPages: WCPages.pages,
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('ko', 'KR'),
    ],

    // translationsKeys: AppTranslation.translations,
  ));
}
