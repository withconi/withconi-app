import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/user_repository.dart';

import '../../../import_basic.dart';
import '../../configs/constants/auth_variables.dart';
import '../../data/repository/auth_repository.dart';
import '../../ui/widgets/loading.dart';
import '../auth_controller.dart';

class EmailVerificationController extends GetxController {
  final AuthRepository _authRepository = AuthRepository.to;
  final UserRepository _userRepository = UserRepository();

  late String _email;
  late String _nextRoute;

  String get email => _email;

  @override
  Future<void> onInit() async {
    super.onInit();
    _email = AuthController.to.wcUser.value!.email;
    _nextRoute = Get.arguments['nextRoute'] as String;
    await sendVerificationEmail(
        email: email,
        currentRoute: Routes.EMAIL_VERIFICATION,
        nextRoute: _nextRoute);
  }

  sendVerificationEmail(
      {required String email,
      required String currentRoute,
      required String nextRoute}) async {
    var result = await _authRepository.sendVerificationEmail(
        email: email, currentRoute: currentRoute, nextRoute: nextRoute);
    result!.fold((l) => null, (r) => null);
  }

  skipEmailVerification() async {
    var userUpdateEither = await _userRepository
        .updateUser(updateData: {"verificationSkipped": true});

    bool success = userUpdateEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, 'skipEmailVerification');
      return false;
    }, (success) => true);

    if (success) {
      AuthController.to.setUserInfo(redirectPage: true);
    }
  }

  Future<bool> checkEmailVerification({
    required PendingDynamicLinkData verificationLink,
  }) async {
    try {
      if (firebaseAuth.currentUser!.emailVerified == false) {
        AuthCredential authCredential = EmailAuthProvider.credentialWithLink(
            email: AuthController.to.wcUser.value!.email,
            emailLink: verificationLink.link.toString());

        var userUpdateEither = await _userRepository
            .updateUser(updateData: {"isEmailVerified": true});

        bool result = userUpdateEither.fold((failure) {
          FailureInterpreter()
              .mapFailureToDialog(failure, 'checkEmailVerification');
          return false;
        }, (r) {
          print('Successfully signed in with email link!');
          return true;
        });

        return result;
      } else {
        return false;
      }
    } catch (error) {
      print('Error signing in with email link.');
      return false;
    }
  }

  resendVerificationEmail() async {
    var result = await showLoading(() => _authRepository.sendVerificationEmail(
        email: email,
        currentRoute: Routes.EMAIL_VERIFICATION,
        nextRoute: _nextRoute));
    result!.fold((l) => null, (r) => null);
  }
}
