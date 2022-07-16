import 'package:withconi/import_basic.dart';
import 'package:withconi/routes/withconi_bindings.dart';
import 'package:withconi/ui/pages/community/community_detail_page.dart';
import 'package:withconi/ui/pages/community/community_main_page.dart';
import 'package:withconi/ui/pages/community/community_post_detail_page.dart';
import 'package:withconi/ui/pages/diagnosis/diagnosis_main_page.dart';
import 'package:withconi/ui/pages/dictionary/dictionary_main_page.dart';
import 'package:withconi/ui/pages/home/add_conimal_page.dart';
import 'package:withconi/ui/pages/home/edit_conimal_page.dart';
import 'package:withconi/ui/pages/home/home_page.dart';
import 'package:withconi/ui/pages/hospital/hospital_main_page.dart';
import 'package:withconi/ui/pages/signin/signin_email_page.dart';
import 'package:withconi/ui/pages/signup/disease_search_page.dart';
import 'package:withconi/ui/pages/signup/signup_conimal_edit_page.dart';
import 'package:withconi/ui/pages/signup/signup_profile_page.dart';
import 'package:withconi/ui/pages/signup/signup_pw_page.dart';
import 'package:withconi/ui/pages/signup/signup_conimal_page_1.dart';
import 'package:withconi/ui/pages/splash.dart';
import 'package:withconi/ui/pages/start/start_page.dart';

import '../ui/pages/community/community_new_post_page.dart';
import '../ui/pages/signup/signup_conimal_page_2.dart';

class WcPages {
  static final pages = [
    GetPage(
        name: Routes.HOME,
        page: () => HomePage(),
        binding: HomeBinding(),
        transition: Transition.noTransition),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.START,
      page: () => StartPage(),
    ),
    GetPage(
      name: Routes.SIGNUP_PW,
      page: () => SignupPwPage(),
    ),
    GetPage(
      name: Routes.SIGNUP_PROFILE,
      page: () => SignupProfilePage(),
    ),
    GetPage(name: Routes.SIGNIN_EMAIL, page: () => SigninEmailPage()),
    GetPage(
      name: Routes.SIGNUP_CONIMAL_STEP1,
      page: () => SignupConimalPage1(),
    ),
    GetPage(
      name: Routes.SIGNUP_CONIMAL_STEP2,
      page: () => SignupConimalPage2(),
    ),
    GetPage(
      name: Routes.SIGNUP_CONIMAL_EDIT,
      page: () => SignupConimalEditPage(),
    ),
    GetPage(
      name: Routes.SIGNUP_DISEASE_SEARCH,
      page: () => DiseaseSearchPage(),
    ),
    GetPage(
      name: Routes.EDIT_CONIMAL,
      page: () => EditConimalPage(),
    ),
    GetPage(
      name: Routes.ADD_CONIMAL,
      page: () => AddConimalpage(),
    ),
    GetPage(
        name: Routes.COMMUNITY_MAIN,
        page: () => CommunityMainPage(),
        transition: Transition.noTransition),
    GetPage(
      name: Routes.COMMUNITY_DETAIL,
      page: () => CommunityDetailPage(),
    ),
    GetPage(
        name: Routes.COMMUNITY_NEW_POST,
        page: () => CommunityNewPostPage(),
        transition: Transition.topLevel),
    GetPage(
      name: Routes.COMMUNITY_POST_DETAIL,
      page: () => CommunityPostDetailPage(),
    ),
    GetPage(
      name: Routes.COMMUNITY_SEARCH,
      page: () => CommunityMainPage(),
    ),
    GetPage(
      name: Routes.DIAGNOSIS_MAIN,
      page: () => DiagnosisMainPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.HOSPITAL_MAIN,
      page: () => HospitalMainPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.DICTIONARY_MAIN,
      page: () => DictionaryMainPage(),
      transition: Transition.noTransition,
    ),
  ];
}
