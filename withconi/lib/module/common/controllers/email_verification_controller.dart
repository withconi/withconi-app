import '../../../../import_basic.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../../../core/values/constants/auth_variables.dart';
import '../../../data/repository/app_setting_repository.dart';
import '../../../data/repository/user_repository.dart';
import '../../../global_widgets/loading/loading_overlay.dart';
import '../../auth/auth_controller.dart';

class EmailVerificationController extends GetxController {
  EmailVerificationController(this._userRepository);
  final UserRepository _userRepository;
  late String _email;
  late String _nextRoute;

  String get email => _email;

  @override
  Future<void> onInit() async {
    super.onInit();
    _email = AuthController.to.userInfo!.email;
    var arguments = Get.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      _nextRoute = arguments['nextRoute'] as String;
    } else {
      _nextRoute = '';
    }
    await sendVerificationEmail(
        email: email,
        currentRoute: Routes.EMAIL_VERIFICATION,
        nextRoute: _nextRoute);
  }

  sendVerificationEmail(
      {required String email,
      required String currentRoute,
      required String nextRoute}) async {
    var result = await _userRepository.sendVerificationEmail(
        email: email, currentRoute: currentRoute, nextRoute: nextRoute);
    result!.fold((l) => null, (r) => null);
  }

  skipEmailVerification() async {
    var userUpdateEither = await showLoading(() => _userRepository.updateUser(
        user: AuthController.to.userInfo!.copyWith(verificationSkipped: true)));

    userUpdateEither.fold((failure) {
      return;
    }, (success) async {
      await AuthController.to.setUserInfo();
      Get.offAllNamed(Routes.NAVIGATION);
      return;
    });

    // if (success) {
    //   if (getBack) {
    //     await AuthController.to.setUserInfo(redirectPage: false);
    //     Get.back();
    //   } else {
    //     await AuthController.to.setUserInfo(redirectPage: true);
    //   }
    // }
  }

  // Future<bool> checkEmailVerification({
  //   required PendingDynamicLinkData verificationLink,
  // }) async {
  //   try {
  //     if (firebaseAuth.currentUser!.emailVerified == false) {
  //       AuthCredential authCredential = EmailAuthProvider.credentialWithLink(
  //           email: AuthController.to.wcUser.value!.email,
  //           emailLink: verificationLink.link.toString());

  //       var userUpdateEither = await _userRepository
  //           .updateUser(updateData: {"isEmailVerified": true});

  //       bool result = userUpdateEither.fold((failure) {
  //         FailureInterpreter()
  //             .mapFailureToDialog(failure, 'checkEmailVerification');
  //         return false;
  //       }, (r) {
  //         print('Successfully signed in with email link!');
  //         return true;
  //       });

  //       return result;
  //     } else {
  //       return false;
  //     }
  //   } catch (error) {
  //     print('Error signing in with email link.');
  //     return false;
  //   }
  // }

  resendVerificationEmail() async {
    var result = await showLoading(() => _userRepository.sendVerificationEmail(
        email: email,
        currentRoute: Routes.EMAIL_VERIFICATION,
        nextRoute: _nextRoute));
    result!.fold((l) => null, (r) => null);
  }

  checkEmailVerified() async {
    print(firebaseAuth.currentUser!.emailVerified);
  }
}
