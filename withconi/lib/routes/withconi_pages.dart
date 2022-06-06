import 'package:withconi/import_basic.dart';
import 'package:withconi/ui/pages/signup/signup_name_pw.dart';
import 'package:withconi/ui/pages/signup/signup_conimal_step1.dart';
import 'package:withconi/ui/pages/splash.dart';
import 'package:withconi/ui/pages/start/start_page.dart';

class WCPages {
  static final pages = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashPage(),
        transition: Transition.fade
        //  binding: HomeBinding()
        ),
    GetPage(
      name: Routes.START,
      page: () => StartPage(),

      //  binding: HomeBinding()
    ),
    GetPage(
      name: Routes.SIGNUP_NAME_PW,
      page: () => SignupPageNamePw(),
    ),
    GetPage(
      name: Routes.SIGNUP_CONIMAL_STEP1,
      page: () => SignupPageConimalStep1(),
    ),
  ];
}
