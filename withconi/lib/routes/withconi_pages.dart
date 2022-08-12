import 'package:withconi/import_basic.dart';
import 'package:withconi/routes/withconi_bindings.dart';
import 'package:withconi/ui/pages/common_pages/add_conimal_page.dart';
import 'package:withconi/ui/pages/common_pages/conimal_setting_page.dart';
import 'package:withconi/ui/pages/common_pages/my_post_page.dart';
import 'package:withconi/ui/pages/community/community_board_detail_page.dart';
import 'package:withconi/ui/pages/community/community_main_page.dart';
import 'package:withconi/ui/pages/community/community_post_detail_page.dart';
import 'package:withconi/ui/pages/diagnosis/diagnosis_main_page.dart';
import 'package:withconi/ui/pages/dictionary/dictionary_main_page.dart';
import 'package:withconi/ui/pages/common_pages/edit_conimal_page.dart';
import 'package:withconi/ui/pages/home/home_page.dart';
import 'package:withconi/ui/pages/settings/setting_page.dart';
import 'package:withconi/ui/pages/common_pages/edit_user_page.dart';
import 'package:withconi/ui/pages/common_pages/liked_post_page.dart';
import 'package:withconi/ui/pages/signin/signin_email_page.dart';
import 'package:withconi/ui/pages/signup/disease_search_page.dart';
import 'package:withconi/ui/pages/signup/signup_conimal_edit_page.dart';
import 'package:withconi/ui/pages/signup/signup_profile_page.dart';
import 'package:withconi/ui/pages/signup/signup_pw_page.dart';
import 'package:withconi/ui/pages/signup/signup_conimal_page_1.dart';
import 'package:withconi/ui/pages/splash.dart';
import 'package:withconi/ui/pages/start/start_page.dart';

import '../ui/pages/community/community_new_post_page.dart';
import '../ui/pages/hospital/hospital_main_page.dart';
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
      name: Routes.DISEASE_ADD,
      page: () => DiseaseSearchPage(),
    ),
    GetPage(
      name: Routes.CONIMAL_EDIT,
      page: () => EditConimalPage(),
    ),
    GetPage(
      name: Routes.CONIMAL_ADD,
      page: () => AddConimalpage(),
    ),
    GetPage(
      name: Routes.CONIMAL_MANAGE,
      page: () => ConimalSettingPage(),
    ),
    GetPage(
        name: Routes.COMMUNITY_MAIN,
        page: () => CommunityMainPage(),
        transition: Transition.noTransition),
    GetPage(
      name: Routes.COMMUNITY_DETAIL,
      page: () => CommunityBoardDetailPage(),
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
    GetPage(
      name: Routes.SETTING_MAIN,
      page: () => SettingPage(),
    ),
    GetPage(
      name: Routes.USER_EDIT,
      page: () => EditUserPage(),
    ),
    GetPage(
      name: Routes.USER_MY_POST,
      page: () => MyPostPage(),
    ),
    GetPage(
      name: Routes.USER_LIKED_POST,
      page: () => LikedPostPage(),
    ),
  ];
}
