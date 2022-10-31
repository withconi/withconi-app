import 'package:withconi/import_basic.dart';
import 'package:withconi/routes/bindings.dart';
import 'package:withconi/module/common/add_conimal_page.dart';
import 'package:withconi/module/common/conimal_setting_page.dart';
import 'package:withconi/module/common/email_verification_page.dart';
import 'package:withconi/module/community/pages/community_my_post_page.dart';
import 'package:withconi/module/community/pages/community_edit_my_post_page.dart';
import 'package:withconi/module/community/pages/community_post_search_page.dart';
import 'package:withconi/module/community/pages/community_report_page.dart';
import 'package:withconi/module/community/pages/community_post_list_page.dart';
import 'package:withconi/module/community/pages/community_main_page.dart';
import 'package:withconi/module/community/pages/community_post_detail_page.dart';
import 'package:withconi/module/diagnosis/pages/diagnosis_main_page.dart';
import 'package:withconi/module/diagnosis/pages/diagnosis_step1_page.dart';
import 'package:withconi/module/diagnosis/pages/diagnosis_symptom_page.dart';
import 'package:withconi/module/dictionary/pages/dictionary_detail_page.dart';
import 'package:withconi/module/dictionary/pages/dictionary_main_page.dart';
import 'package:withconi/module/common/edit_conimal_page.dart';
import 'package:withconi/module/dictionary/pages/dictionary_search_page.dart';
import 'package:withconi/module/home/home_page.dart';
import 'package:withconi/module/map/map_bookmark_page.dart';
import 'package:withconi/module/map/map_detail_page.dart';
import 'package:withconi/module/map/map_location_permission_page.dart';
import 'package:withconi/module/map/map_my_review_page.dart';
import 'package:withconi/module/map/map_new_review_page.dart';
import 'package:withconi/module/map/map_search_page.dart';
import 'package:withconi/module/navigation/navigation_page.dart';
import 'package:withconi/module/setting/setting_page.dart';
import 'package:withconi/module/common/edit_user_page.dart';
import 'package:withconi/module/community/pages/community_like_post_page.dart';
import 'package:withconi/module/signin/signin_email_page.dart';
import 'package:withconi/module/common/disease_search_page.dart';
import 'package:withconi/module/signup/pages/signup_conimal_edit_page.dart';
import 'package:withconi/module/signup/pages/signup_profile_page.dart';
import 'package:withconi/module/signup/pages/signup_pw_page.dart';
import 'package:withconi/module/signup/pages/signup_conimal_page_1.dart';
import 'package:withconi/module/splash/splash.dart';
import 'package:withconi/module/start/start_page.dart';
import '../module/community/pages/community_new_post_page.dart';
import '../module/diagnosis/pages/diagnosis_result_page.dart';
import '../module/diagnosis/pages/diagnosis_step2_page.dart';
import '../module/map/map_main_page.dart';
import '../module/signup/pages/signup_conimal_page_final.dart';

class WcPages {
  static final pages = [
    GetPage(
        name: Routes.NAVIGATION,
        page: () => NavigationPage(),
        binding: NavigationBinding(),
        children: [
          GetPage(
            name: Routes.HOME,
            page: () => HomePage(),
          ),
          GetPage(
            name: Routes.MAP_MAIN,
            page: () => MapMainPage(),
          ),
          GetPage(
            name: Routes.COMMUNITY_MAIN,
            page: () => CommunityMainPage(),
          ),
        ],
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
    GetPage(
      name: Routes.DIAGNOSIS_STEP1,
      page: () => DiagnosisStep1Page(),
    ),
    GetPage(
      name: Routes.DIAGNOSIS_STEP2,
      page: () => DiagnosisStep2Page(),
    ),
    GetPage(
      name: Routes.DIAGNOSIS_SYMPTOM,
      page: () => DiagnosisSymptomPage(),
    ),
    GetPage(
      name: Routes.DIAGNOSIS_RESULT,
      page: () => DiagnosisResultPage(),
    ),
  ];
}
