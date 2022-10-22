import 'package:withconi/import_basic.dart';
import 'package:withconi/routes/withconi_bindings.dart';
import 'package:withconi/ui/pages/common_pages/add_conimal_page.dart';
import 'package:withconi/ui/pages/common_pages/conimal_setting_page.dart';
import 'package:withconi/ui/pages/common_pages/email_verification_page.dart';
import 'package:withconi/ui/pages/community/community_my_post_page.dart';
import 'package:withconi/ui/pages/community/community_edit_my_post_page.dart';
import 'package:withconi/ui/pages/community/community_post_search_page.dart';
import 'package:withconi/ui/pages/community/community_report_page.dart';
import 'package:withconi/ui/pages/community/community_post_list_page.dart';
import 'package:withconi/ui/pages/community/community_main_page.dart';
import 'package:withconi/ui/pages/community/community_post_detail_page.dart';
import 'package:withconi/ui/pages/diagnosis/diagnosis_main_page.dart';
import 'package:withconi/ui/pages/dictionary/dictionary_detail_page.dart';
import 'package:withconi/ui/pages/dictionary/dictionary_main_page.dart';
import 'package:withconi/ui/pages/common_pages/edit_conimal_page.dart';
import 'package:withconi/ui/pages/dictionary/dictionary_search_page.dart';
import 'package:withconi/ui/pages/home/home_page.dart';
import 'package:withconi/ui/pages/map/map_bookmark_page.dart';
import 'package:withconi/ui/pages/map/map_detail_page.dart';
import 'package:withconi/ui/pages/map/map_location_permission_page.dart';
import 'package:withconi/ui/pages/map/map_my_review_page.dart';
import 'package:withconi/ui/pages/map/map_new_review_page.dart';
import 'package:withconi/ui/pages/map/map_search_page.dart';
import 'package:withconi/ui/pages/navigation/navigation_page.dart';
import 'package:withconi/ui/pages/settings/setting_page.dart';
import 'package:withconi/ui/pages/common_pages/edit_user_page.dart';
import 'package:withconi/ui/pages/community/community_like_post_page.dart';
import 'package:withconi/ui/pages/signin/signin_email_page.dart';
import 'package:withconi/ui/pages/common_pages/disease_search_page.dart';
import 'package:withconi/ui/pages/signup/signup_conimal_edit_page.dart';
import 'package:withconi/ui/pages/signup/signup_profile_page.dart';
import 'package:withconi/ui/pages/signup/signup_pw_page.dart';
import 'package:withconi/ui/pages/signup/signup_conimal_page_1.dart';
import 'package:withconi/ui/pages/splash.dart';
import 'package:withconi/ui/pages/start/start_page.dart';
import '../ui/pages/community/community_new_post_page.dart';
import '../ui/pages/map/map_main_page.dart';
import '../ui/pages/signup/signup_conimal_page_final.dart';

class WcPages {
  static final pages = [
    GetPage(
        name: Routes.NAVIGATION,
        page: () => NavigationPage(),
        binding: NavigationBinding(),
        transition: Transition.noTransition),
    GetPage(
        name: Routes.HOME,
        page: () => HomePage(),
        // binding: HomeBinding(),
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
      page: () => SignupConimal1Page(),
    ),
    GetPage(
      name: Routes.SIGNUP_CONIMAL_STEP2,
      page: () => SignupConimalFinalPage(),
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
      page: () => CommunityPostListPage(),
    ),
    GetPage(
        name: Routes.COMMUNITY_NEW_POST,
        page: () => CommunityNewPostPage(),
        fullscreenDialog: true,
        transition: Transition.topLevel),
    GetPage(
        name: Routes.COMMUNITY_POST_EDIT,
        page: () => CommunityEditMyPostPage(),
        fullscreenDialog: true,
        transition: Transition.topLevel),
    GetPage(
      name: Routes.COMMUNITY_POST_DETAIL,
      page: () => CommunityPostDetailPage(),
    ),
    GetPage(
      name: Routes.COMMUNITY_POST_SEARCH,
      page: () => CommunityPostSearchPage(),
    ),
    GetPage(
      name: Routes.DIAGNOSIS_MAIN,
      page: () => DiagnosisMainPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.COMMUNITY_NEW_REPORT,
      page: () => CommunityNewReportPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.MAP_MAIN,
      page: () => MapMainPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.MAP_DETAIL,
      page: () => MapDetailPage(),
      popGesture: true,
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 200),
      //  gestureWidth: (context) => 200
    ),
    GetPage(
      name: Routes.DICTIONARY_MAIN,
      page: () => DictionaryMainPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.DICTIONARY_DETAIL,
      page: () => DictionaryDetailPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.DICTIONARY_SEARCH,
      page: () => DictionarySearchPage(),
      transition: Transition.cupertino,
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
    GetPage(
      name: Routes.EMAIL_VERIFICATION,
      page: () => EmailVerificationPage(),
    ),
    GetPage(
      name: Routes.MAP_SEARCH,
      page: () => MapSearchPage(),
    ),
    GetPage(
      name: Routes.MAP_NEW_REVIEW,
      page: () => MapNewReviewPage(),
    ),
    GetPage(
      name: Routes.MAP_BOOKMARK,
      page: () => MapBookmarkPage(),
    ),
    GetPage(
      name: Routes.MAP_MY_REVIEW,
      page: () => MapMyReviewPage(),
    ),
    GetPage(
      name: Routes.MAP_LOCATION_PERMISSION,
      page: () => MapLocationPermissionPage(),
    ),
  ];
}
