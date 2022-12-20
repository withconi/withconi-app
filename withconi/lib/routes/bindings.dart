import 'package:get/get.dart';
import 'package:withconi/data/provider/platform_provider/platform_auth_api.dart';
import 'package:withconi/data/provider/remote_provider/app_config_api.dart';
import 'package:withconi/data/provider/remote_provider/community_api.dart';
import 'package:withconi/data/provider/remote_provider/conimal_api.dart';
import 'package:withconi/data/provider/remote_provider/diagnosis_api.dart';
import 'package:withconi/data/provider/remote_provider/disease_api.dart';
import 'package:withconi/data/provider/remote_provider/image_api.dart';
import 'package:withconi/data/provider/remote_provider/map_api.dart';
import 'package:withconi/data/provider/remote_provider/signin_api.dart';
import 'package:withconi/data/provider/remote_provider/signup_api.dart';
import 'package:withconi/data/provider/remote_provider/user_api.dart';
import 'package:withconi/data/repository/app_setting_repository.dart';
import 'package:withconi/data/repository/community_repository.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/data/repository/diagnosis_repository.dart';
import 'package:withconi/data/repository/disease_repository.dart';
import 'package:withconi/data/repository/fcm_repository.dart';
import 'package:withconi/data/repository/local_notification_repository.dart';
import 'package:withconi/data/repository/signin_respository.dart';
import 'package:withconi/data/repository/signup_repository.dart';
import 'package:withconi/data/repository/signing_auth_repository.dart';
import 'package:withconi/data/repository/user_repository.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/module/common/controllers/add_conimal_controller.dart';
import 'package:withconi/module/common/controllers/breed_search_controller.dart';
import 'package:withconi/module/common/controllers/change_password_controller.dart';
import 'package:withconi/module/common/controllers/conimal_manage_controller.dart';
import 'package:withconi/module/common/controllers/edit_conimal_controller.dart';
import 'package:withconi/module/common/controllers/email_verification_controller.dart';
import 'package:withconi/module/common/controllers/fcm_controller.dart';
import 'package:withconi/module/common/controllers/life_cycle_controller.dart';
import 'package:withconi/module/community/controllers/community_edit_my_post_controller.dart';
import 'package:withconi/module/community/controllers/community_my_post_controller.dart';
import 'package:withconi/module/community/controllers/community_new_post_controller.dart';
import 'package:withconi/module/community/controllers/community_new_report_controller.dart';
import 'package:withconi/module/community/controllers/community_post_detail_controller.dart';
import 'package:withconi/module/community/controllers/community_post_list_controller.dart';
import 'package:withconi/module/community/controllers/community_post_search_controller.dart';
import 'package:withconi/module/diagnosis/controllers/diagnosis_step1_controller.dart';
import 'package:withconi/module/diagnosis/controllers/diagnosis_symptom_controller.dart';
import 'package:withconi/module/dictionary/controllers/dictionary_detail_controller.dart';
import 'package:withconi/module/dictionary/controllers/dictionary_main_controller.dart';
import 'package:withconi/module/map/controllers/map_detail_controller.dart';
import 'package:withconi/module/map/controllers/map_edit_review_controller.dart';
import 'package:withconi/module/map/controllers/map_image_verification_controller.dart';
import 'package:withconi/module/map/controllers/map_my_bookmark_controller.dart';
import 'package:withconi/module/map/controllers/map_new_review_controller.dart';
import 'package:withconi/module/map/controllers/map_search_controller.dart';
import 'package:withconi/module/navigation/navigation_controller.dart';
import 'package:withconi/module/setting/setting_controller.dart';
import 'package:withconi/module/signin_email/signin_email_controller.dart';
import 'package:withconi/module/signup/controllers/signup_profile_controller.dart';
import 'package:withconi/module/signup/controllers/signup_pw_controller.dart';
import 'package:withconi/module/signup/signup_data_storage.dart';
import 'package:withconi/module/start/start_controller.dart';

import '../data/repository/image_repository.dart';
import '../data/repository/map_repository.dart';
import '../module/common/controllers/disease_search_controller.dart';
import '../module/common/controllers/edit_user_controller.dart';
import '../module/community/controllers/community_liked_post_controller.dart';
import '../module/community/controllers/community_main_controller.dart';
import '../module/community/controllers/community_setting_controller.dart';
import '../module/diagnosis/controllers/diagnosis_result_controller.dart';
import '../module/diagnosis/controllers/diagnosis_step2_controller.dart';
import '../module/home/home_controller.dart';
import '../module/map/controllers/map_location_permission_controller.dart';
import '../module/map/controllers/map_main_page_controller.dart';
import '../module/map/controllers/map_my_review_controller.dart';
import '../module/map/controllers/map_review_detail_controller.dart';
import '../module/signup/controllers/signup_conimal_manage_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppSettingAPI>(
      () => AppSettingAPI(),
    );
    Get.lazyPut<UserAPI>(
      () => UserAPI(),
    );
    Get.lazyPut<ImageAPI>(
      () => ImageAPI(),
    );

    Get.lazyPut<AppSettingRepository>(() => AppSettingRepository(
          Get.find<AppSettingAPI>(),
        ));
    Get.lazyPut<UserRepository>(() => UserRepository(
          Get.find<UserAPI>(),
        ));
    Get.lazyPut<ImageRepository>(() => ImageRepository(
          Get.find<ImageAPI>(),
        ));

    Get.put<AuthController>(
        AuthController(
          Get.find<AppSettingRepository>(),
          Get.find<UserRepository>(),
        ),
        permanent: true);
    Get.put<LifeCycleController>(
      LifeCycleController(),
      permanent: true,
    );
  }
}

class NavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
    FcmBinding().dependencies();
  }

  Future<bool> closeBindings() async {
    await FcmBinding().closeBinding();
    HomeBinding().closeBinding();
    CommunityMainBinding().closeBinding();
    MapMainBinding().closeBinding();
    DictionaryMainBinding().closeBinding();

    return true;
  }
}

class FcmBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalNotificationService());
    Get.lazyPut(() => FcmRepository(Get.find()));
    Get.put(FcmController(Get.find()));
  }

  Future<void> closeBinding() async {
    await FcmController.to.deleteFcmToken();
    await Get.delete<FcmController>(force: true);
    Get.delete<LocalNotificationService>(force: true);
    Get.delete<FcmRepository>(force: true);
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConimalAPI>(() => ConimalAPI());
    Get.lazyPut<CommunityAPI>(() => CommunityAPI());
    Get.lazyPut<ConimalRepository>(
        () => ConimalRepository(Get.find<ConimalAPI>()));
    Get.lazyPut<CommunityRepository>(
        () => CommunityRepository(Get.find<CommunityAPI>()));
    Get.put<HomeController>(
        HomeController(
            Get.find<ConimalRepository>(), Get.find<CommunityRepository>()),
        permanent: true);
  }

  closeBinding() {
    Get.delete<ConimalAPI>(force: true);
    Get.delete<CommunityAPI>(force: true);
    Get.delete<ConimalRepository>(force: true);
    Get.delete<CommunityRepository>(force: true);
    Get.delete<HomeController>(force: true);
  }
}

class StartPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlatformAuthAPI>(() => PlatformAuthAPI());
    Get.lazyPut<SignInAPI>(() => SignInAPI());
    // Get.lazyPut<UserAPI>(() => UserAPI());
    Get.lazyPut<PlatformAuthRepository>(
        () => PlatformAuthRepository(Get.find<PlatformAuthAPI>()));
    Get.lazyPut<SignInRepository>(
        () => SignInRepository(Get.find<SignInAPI>()));
    // Get.lazyPut<UserRepository>(() => UserRepository(Get.find<UserAPI>()));
    // Get.lazyPut<UserRepository>(() => UserRepository(Get.find<UserAPI>()));
    Get.lazyPut<StartPageController>(
      () => StartPageController(Get.find<PlatformAuthRepository>(),
          Get.find<UserRepository>(), Get.find<SignInRepository>()),
    );
  }
}

class MapMainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapAPI>(() => MapAPI());
    Get.lazyPut<MapRepository>(() => MapRepository(Get.find<MapAPI>()));

    Get.put<MapMainPageController>(
        MapMainPageController(
          Get.find<MapRepository>(),
        ),
        permanent: true);
  }

  closeBinding() {
    Get.delete<MapAPI>(force: true);
    Get.delete<MapRepository>(force: true);
    Get.delete<MapMainPageController>(force: true);
  }
}

class CommunityMainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityAPI>(() => CommunityAPI());
    Get.lazyPut<CommunityRepository>(
        () => CommunityRepository(Get.find<CommunityAPI>()));
    Get.put<CommunityMainController>(
        CommunityMainController(
          Get.find<CommunityRepository>(),
        ),
        permanent: true);
  }

  closeBinding() {
    Get.delete<CommunityAPI>(force: true);
    Get.delete<CommunityRepository>(force: true);
    Get.delete<CommunityMainController>(force: true);
  }
}

// class HomeMainBinding implements Bindings {
//   @override
//   void dependencies() {
//     HomeBinding().dependencies();
//     CommunityMainBinding().dependencies();
//     MapMainBinding().dependencies();
//     DictionaryMainBinding().dependencies();
//   }
// }

class SignUpPwBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupPwController>(
      () => SignupPwController(Get.arguments['email']),
    );
  }
}

class SignInEmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInAPI>(() => SignInAPI());
    Get.lazyPut<SignInRepository>(
        () => SignInRepository(Get.find<SignInAPI>()));
    Get.lazyPut<SignInEmailController>(() => SignInEmailController(
        Get.find<SignInRepository>(), Get.arguments['email']));
  }
}

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(
        () => ChangePasswordController(Get.arguments['email']));
  }
}

class SignUpProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupAPI>(() => SignupAPI());
    Get.lazyPut(() => SignUpDataStorage());
    Get.lazyPut<SignUpRepository>(
        () => SignUpRepository(Get.find<SignupAPI>()));
    Get.lazyPut<SignupProfileController>(
      () => SignupProfileController(
          Get.find<SignUpDataStorage>(), Get.arguments['signingAuthInfo']),
    );
  }
}

class SignUpConimalManageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupAPI>(() => SignupAPI());
    Get.lazyPut<ImageAPI>(() => ImageAPI());
    Get.lazyPut(() => SignUpDataStorage());
    Get.lazyPut(() => ImageRepository(Get.find<ImageAPI>()));
    Get.lazyPut(() => SignUpRepository(Get.find<SignupAPI>()));
    Get.lazyPut<SignUpRepository>(
        () => SignUpRepository(Get.find<SignupAPI>()));
    Get.lazyPut<SignupConimalManageController>(
      () => SignupConimalManageController(Get.find<SignUpDataStorage>(),
          Get.find<SignUpRepository>(), Get.find<ImageRepository>()),
    );
  }
}

class CommunitySettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunitySettingPageController>(
      () => CommunitySettingPageController(),
    );
  }
}

class CommunityReportBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityNewReportController>(
      () => CommunityNewReportController(
          Get.find<CommunityRepository>(),
          Get.arguments['boardId'],
          Get.arguments['postId'],
          Get.arguments['authorId']),
    );
  }
}

class CommunityPostSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityPostSearchController>(
      () => CommunityPostSearchController(
          Get.find<CommunityRepository>(), Get.arguments['boardId']),
    );
  }
}

class CommunityPostListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityPostListController>(
      () => CommunityPostListController(Get.find<CommunityRepository>(),
          Get.arguments['boardId'], Get.arguments['boardName']),
    );
  }
}

class CommunityPostDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityPostDetailController>(
      () => CommunityPostDetailController(
          Get.find<CommunityRepository>(),
          Get.arguments['boardId'],
          Get.arguments['postId'],
          Get.arguments['postAbstractController']),
    );
  }
}

class CommunityNewPostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityNewPostController>(() => CommunityNewPostController(
        Get.find<CommunityRepository>(),
        Get.find<ImageRepository>(),
        Get.arguments['boardId']));
  }
}

class CommunityMyPostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPostPageController>(
      () => MyPostPageController(
          Get.find(), Get.arguments['postAbstractController']),
    );
  }
}

class CommunityLikePostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LikedPostController>(
      () => LikedPostController(
          Get.find(), Get.arguments['postAbstractController']),
    );
  }
}

class CommunityEditPostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunityEditMyPostController>(
      () => CommunityEditMyPostController(
        Get.find<CommunityRepository>(),
        Get.find<ImageRepository>(),
        Get.arguments['post'],
      ),
    );
  }
}

class ConimalAddPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddConimalController>(
      () => AddConimalController(),
    );
  }
}

class ConimalEditPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditConimalController>(
      () => EditConimalController(Get.arguments['editConimal']),
    );
  }
}

class DiseaseSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiseaseAPI());
    Get.lazyPut(() => DiseaseRepository(Get.find<DiseaseAPI>()));
    Get.lazyPut<DiseaseSearchController>(
      () => DiseaseSearchController(Get.find<DiseaseRepository>(),
          Get.arguments['selectedDiseaseList'], Get.arguments['maxDisease']),
    );
  }
}

// class DictionarySearchBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(() => DiseaseAPI());
//     Get.lazyPut(() => DiseaseRepository(Get.find<DiseaseAPI>()));
//     Get.lazyPut<DictionarySearchController>(
//       () => DictionarySearchController(Get.find<DiseaseRepository>()),
//     );
//   }
// }

class BreedSearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConimalAPI());
    Get.lazyPut(() => ConimalRepository(Get.find<ConimalAPI>()));
    Get.lazyPut<BreedSearchController>(
      () => BreedSearchController(
          Get.find<ConimalRepository>(), Get.arguments['species']),
    );
  }
}

class ConimalManageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConimalAPI());
    Get.lazyPut(() => ConimalRepository(Get.find<ConimalAPI>()));
    Get.lazyPut<ConimalManageController>(
      () => ConimalManageController(
          Get.find<ConimalRepository>(), Get.arguments['conimals']),
    );
  }
}

// class MapMainPageBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(() => MapAPI());
//     Get.lazyPut(() => MapRepository(Get.find<MapAPI>()));
//     Get.lazyPut<MapMainPageController>(
//         () => MapMainPageController(Get.find<MapRepository>()),
//         fenix: true);
//   }
// }

class MapDetailPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapDetailPageController>(() => MapDetailPageController(
        Get.find<MapRepository>(),
        Get.arguments['placeId'],
        Get.arguments['placeType'],
        Get.arguments['lat'],
        Get.arguments['lng'],
        Get.arguments['mapReviewAbstract']));
  }
}

class MapImageVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapImageVerificationController>(() =>
        MapImageVerificationController(
            Get.arguments['selectedImageList'], Get.arguments['editable']));
  }
}

class DictionaryDetailPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DictionaryDetailController>(
      () => DictionaryDetailController(
          Get.find(), Get.find(), Get.arguments['diseaseId']),
    );
  }
}

class DictionaryMainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiseaseAPI());
    Get.lazyPut(() => DiseaseRepository(Get.find<DiseaseAPI>()));
    Get.lazyPut<DictionaryMainController>(
        () => DictionaryMainController(
              Get.find<DiseaseRepository>(),
            ),
        fenix: true);
  }

  closeBinding() {
    Get.delete<DiseaseAPI>(force: true);
    Get.delete<DiseaseRepository>(force: true);
    Get.delete<DictionaryMainController>(force: true);
  }
}

class SettingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingPageController>(
      () => SettingPageController(),
    );
  }
}

class CommunitySettingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommunitySettingPageController>(
      () => CommunitySettingPageController(),
    );
  }
}

class EditUserPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditUserController>(
      () => EditUserController(
          Get.find<UserRepository>(), Get.find<ImageRepository>()),
    );
  }
}

class EmailVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailVerificationController>(
      () => EmailVerificationController(
          Get.find<UserRepository>(), Get.arguments['nextRoute']),
    );
  }
}

class MapSearchPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapSearchController>(
      () => MapSearchController(
        Get.find<MapRepository>(),
        Get.arguments?['lat'],
        Get.arguments?['lng'],
      ),
    );
  }
}

class MapNewReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapNewReviewController>(
      () => MapNewReviewController(
        Get.find(),
        Get.find(),
        Get.arguments['placeSelected'],
        Get.arguments['lat'],
        Get.arguments['lng'],
        Get.arguments?['placeId'],
        Get.arguments?['placeName'],
        Get.arguments?['placeAddress'],
        Get.arguments?['placeThumbnail'],
      ),
    );
  }
}

class MapEditReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapEditReviewController>(
      () => MapEditReviewController(
        Get.find(),
        Get.arguments['reviewId'],
      ),
    );
  }
}

class MapReviewDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapReviewDetailController>(
      () => MapReviewDetailController(
        Get.arguments['reviewDetail'],
      ),
    );
  }
}

class MapBookmarkBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapMyBookmarkController>(
      () => MapMyBookmarkController(Get.find<MapRepository>()),
    );
  }
}

class MapMyReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapMyReviewController>(
      () => MapMyReviewController(
          Get.find<MapRepository>(),
          Get.arguments['lat'],
          Get.arguments['lng'],
          Get.arguments['mapReviewAbstract']),
    );
  }
}

class MapLocationPermissionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapPermissionController>(
      () => MapPermissionController(),
    );
  }
}

class DiagnosisStep1Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiagnosisAPI());
    Get.lazyPut(() => DiagnosisRepository(Get.find()));
    Get.lazyPut(() => DiagnosisStep1Controller(Get.find()));
  }
}

class DiagnosisStep2Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiagnosisStep2Controller>(
      () => DiagnosisStep2Controller(Get.find()),
    );
  }
}

class DiagnosisSymptomBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiagnosisSymptomController>(
      () => DiagnosisSymptomController(Get.find(), Get.arguments['symptom'],
          Get.arguments['symptomList'], Get.arguments['selectedSymptomList']),
    );
  }
}

class DiagnosisResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiagnosisResultController>(
      () => DiagnosisResultController(Get.find()),
    );
  }
}
