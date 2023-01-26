import 'package:withconi/import_basic.dart';
import 'package:withconi/module/common/breed_search_page.dart';
import 'package:withconi/module/common/change_password_page.dart';
import 'package:withconi/module/setting/app_setting/developer_info_page.dart';
import 'package:withconi/module/setting/app_setting/inquiry_page.dart';
import 'package:withconi/module/map/map_edit_review_page.dart';
import 'package:withconi/module/map/map_review_detail_page.dart';
import 'package:withconi/module/start/agreement_page.dart';
import 'package:withconi/routes/bindings.dart';
import 'package:withconi/module/common/add_conimal_page.dart';
import 'package:withconi/module/common/conimal_manage_page.dart';
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
import 'package:withconi/module/signin_email/signin_email_page.dart';
import 'package:withconi/module/common/disease_search_page.dart';
import 'package:withconi/module/signup/pages/signup_profile_page.dart';
import 'package:withconi/module/signup/pages/signup_pw_page.dart';
import 'package:withconi/module/splash/splash.dart';
import 'package:withconi/module/start/start_page.dart';
import 'package:withconi/routes/middlewares/auth_middleware.dart';
import 'package:withconi/routes/middlewares/map_middleware.dart';
import 'package:withconi/routes/middlewares/signup_middleware.dart';
import '../module/common/terms_and_condition_page.dart';
import '../module/community/pages/community_new_post_page.dart';
import '../module/community/pages/community_setting_page.dart';
import '../module/diagnosis/pages/diagnosis_result_page.dart';
import '../module/diagnosis/pages/diagnosis_step2_page.dart';
import '../module/dictionary/pages/dictionary_search_page.dart';
import '../module/map/map_image_verification_page.dart';
import '../module/map/map_main_page.dart';
import '../module/signup/pages/signup_conimal_manage_page.dart';
import 'middlewares/change_password_middleware.dart';

class WcPages {
  static final pages = [
    GetPage(
        popGesture: false,
        name: Routes.NAVIGATION,
        page: () => const NavigationPage(),
        // binding: NavigationBinding(),
        bindings: [
          NavigationBinding(),
          FcmBinding(),
          HomeBinding(),
          MapMainBinding(),
          CommunityMainBinding(),
          DictionaryMainBinding(),
        ],
        middlewares: [AuthMiddleware()],
        children: [
          GetPage(
              name: Routes.HOME,
              page: () => const HomePage(),
              binding: HomeBinding(),
              popGesture: false,
              transition: Transition.noTransition),
          GetPage(
            name: Routes.MAP_MAIN,
            page: () => const MapMainPage(),
            popGesture: false,
            transition: Transition.noTransition,
            // binding: MapMainBinding(),
          ),
          GetPage(
            name: Routes.COMMUNITY_MAIN,
            page: () => const CommunityMainPage(),
            transition: Transition.noTransition,
            popGesture: false,
            // binding: CommunityMainBinding(),
          ),
          GetPage(
            name: Routes.DICTIONARY_MAIN,
            page: () => const DictionaryMainPage(),
            binding: DictionaryMainBinding(),
            popGesture: false,
            transition: Transition.noTransition,
          ),
        ],
        transition: Transition.cupertino),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      transition: Transition.fade,
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.START,
      page: () => StartPage(),
      binding: StartPageBinding(),
    ),
    GetPage(
      name: Routes.AGREEMENT,
      page: () => AgreementPage(),
    ),
    GetPage(
      name: Routes.SIGNUP_PW,
      page: () => SignupPwPage(),
      binding: SignUpPwBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP_PROFILE,
      page: () => SignupProfilePage(),
      binding: SignUpProfileBinding(),
    ),
    GetPage(
      name: Routes.SIGNIN_EMAIL,
      page: () => const SigninEmailPage(),
      binding: SignInEmailBinding(),
    ),
    GetPage(
      name: Routes.CHANGE_PASSWORD,
      page: () => const ChangePasswordPage(),
      binding: ChangePasswordBinding(),
      middlewares: [ChangePasswordMiddleware()],
    ),
    GetPage(
        name: Routes.SIGNUP_CONIMAL_MANAGE,
        page: () => SignUpConimalManagePage(),
        binding: SignUpConimalManageBinding(),
        middlewares: [SignUpMiddleware()]),
    GetPage(
      name: Routes.DISEASE_SEARCH,
      page: () => const DiseaseSearchPage(),
      binding: DiseaseSearchBinding(),
    ),
    GetPage(
      name: Routes.BREED_SEARCH,
      page: () => const BreedSearchPage(),
      binding: BreedSearchBinding(),
    ),
    GetPage(
      name: Routes.CONIMAL_EDIT,
      page: () => const ConimalEditPage(),
      binding: ConimalEditPageBinding(),
    ),
    GetPage(
      name: Routes.CONIMAL_ADD,
      page: () => const ConimalAddPage(),
      binding: ConimalAddPageBinding(),
    ),
    GetPage(
      name: Routes.CONIMAL_MANAGE,
      page: () => const ConimalManagePage(),
      binding: ConimalManageBinding(),
    ),
    GetPage(
      name: Routes.COMMUNITY_POST_LIST,
      page: () => CommunityPostListPage(),
      binding: CommunityPostListBinding(),
    ),
    GetPage(
      name: Routes.COMMUNITY_NEW_POST,
      page: () => CommunityNewPostPage(),
      transition: Transition.topLevel,
      binding: CommunityNewPostBinding(),
    ),
    GetPage(
      name: Routes.COMMUNITY_POST_EDIT,
      page: () => CommunityEditMyPostPage(),
      transition: Transition.topLevel,
      binding: CommunityEditPostBinding(),
    ),
    GetPage(
      name: Routes.COMMUNITY_POST_DETAIL,
      page: () => CommunityPostDetailPage(),
      binding: CommunityPostDetailBinding(),
    ),
    GetPage(
      name: Routes.COMMUNITY_POST_SEARCH,
      page: () => CommunityPostSearchPage(),
      binding: CommunityPostSearchBinding(),
    ),
    GetPage(
      name: Routes.COMMUNITY_REPORT,
      page: () => CommunityReportPage(),
      transition: Transition.cupertino,
      binding: CommunityReportBinding(),
    ),
    GetPage(
      name: Routes.COMMUNITY_MY_POST,
      page: () => CommunityMyPostPage(),
      binding: CommunityMyPostBinding(),
    ),
    GetPage(
      name: Routes.COMMUNITY_LIKE_POST,
      page: () => CommunityLikePostPage(),
      binding: CommunityLikePostBinding(),
    ),
    GetPage(
      name: Routes.DIAGNOSIS_MAIN,
      page: () => const DiagnosisMainPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.MAP_DETAIL,
      page: () => MapDetailPage(),
      transition: Transition.fade,
      fullscreenDialog: true,
      transitionDuration: const Duration(milliseconds: 200),
      binding: MapDetailPageBinding(),
    ),
    GetPage(
      name: Routes.MAP_IMAGE_VERIFICATION,
      page: () => const MapImageVerificationPage(),
      popGesture: true,

      binding: MapImageVerificationBinding(),
      //  gestureWidth: (context) => 200
    ),
    GetPage(
      name: Routes.DICTIONARY_DETAIL,
      page: () => const DictionaryDetailPage(),
      transition: Transition.cupertino,
      binding: DictionaryDetailPageBinding(),
    ),
    GetPage(
      name: Routes.COMMUNITY_SETTING,
      page: () => const CommunitySettingPage(),
      transition: Transition.cupertino,
      binding: CommunitySettingPageBinding(),
    ),
    GetPage(
      name: Routes.SETTING_MAIN,
      page: () => const SettingPage(),
      binding: SettingPageBinding(),
    ),
    GetPage(
      name: Routes.USER_EDIT,
      page: () => const EditUserPage(),
      binding: EditUserPageBinding(),
    ),
    GetPage(
      name: Routes.EMAIL_VERIFICATION,
      page: () => const EmailVerificationPage(),
      binding: EmailVerificationBinding(),
    ),
    GetPage(
      name: Routes.MAP_SEARCH,
      page: () => const MapSearchPage(),
      binding: MapSearchPageBinding(),
    ),
    GetPage(
      name: Routes.MAP_EDIT_MY_REVIEW,
      page: () => const MapEditReviewPage(),
      binding: MapEditReviewBinding(),
    ),
    GetPage(
      name: Routes.MAP_REVIEW_DETAIL,
      page: () => const MapReviewDetailPage(),
      binding: MapReviewDetailBinding(),
    ),
    GetPage(
      name: Routes.MAP_NEW_REVIEW,
      page: () => const MapNewReviewPage(),
      binding: MapNewReviewBinding(),
    ),
    GetPage(
      name: Routes.MAP_BOOKMARK,
      page: () => const MapBookmarkPage(),
      binding: MapBookmarkBinding(),
    ),
    GetPage(
      name: Routes.MAP_MY_REVIEW,
      page: () => const MapMyReviewPage(),
      binding: MapMyReviewBinding(),
    ),
    GetPage(
      name: Routes.MAP_LOCATION_PERMISSION,
      page: () => const MapLocationPermissionPage(),
      popGesture: false,
      binding: MapLocationPermissionBinding(),
    ),
    GetPage(
      name: Routes.DIAGNOSIS_STEP1,
      page: () => const DiagnosisStep1Page(),
      binding: DiagnosisStep1Binding(),
    ),
    GetPage(
      name: Routes.DIAGNOSIS_STEP2,
      page: () => const DiagnosisStep2Page(),
      binding: DiagnosisStep2Binding(),
    ),
    GetPage(
      name: Routes.DIAGNOSIS_SYMPTOM,
      page: () => const DiagnosisSymptomPage(),
      binding: DiagnosisSymptomBinding(),
    ),
    GetPage(
      name: Routes.DIAGNOSIS_RESULT,
      page: () => const DiagnosisResultPage(),
      binding: DiagnosisResultBinding(),
    ),
    GetPage(
      name: Routes.REQUEST,
      page: () => const InquiryPage(),
    ),
    GetPage(
      name: Routes.DEVELOPER_INFO,
      page: () => const DeveloperInfoPage(),
    ),
    GetPage(
      name: Routes.TERMS_AND_CONDITION,
      page: () => const TermsAndConditionPage(),
      binding: TermsAndConditionBinding(),
    ),
  ];
}
