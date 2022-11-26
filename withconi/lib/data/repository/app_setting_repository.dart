import 'package:dartz/dartz.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/provider/remote_provider/app_config_api.dart';
import 'package:withconi/import_basic.dart';

class AppSettingRepository extends GetxController {
  // final AuthAPI _api = AuthAPI();
  AppSettingRepository(this._api);
  final AppSettingAPI _api;

  Future<Either<Failure, bool>> checkAppVersion() async {
    try {
      Map<String, dynamic> result = await _api.checkAppVersion();
      return Right(true);
    } catch (e) {
      return Left(VersionCheckFailure());
    }
  }

  // Future<Either<Failure, bool>?> sendVerificationEmail(
  //     {required String email,
  //     required String currentRoute,
  //     required String nextRoute}) async {
  //   try {
  //     var acs = ActionCodeSettings(
  //         url: await _dynamicLinkManager.getShortLink(
  //             Routes.EMAIL_VERIFICATION, nextRoute),
  //         // This must be true
  //         handleCodeInApp: true,
  //         iOSBundleId: 'co.yellowtoast.withconi',
  //         androidPackageName: 'co.yellowtoast.withconi',
  //         // installIfNotAvailable
  //         androidInstallApp: true,

  //         // minimumVersion
  //         dynamicLinkDomain: 'withconimal.page.link',
  //         androidMinimumVersion: '12');

  //     var emailAuth = email;
  //     await firebaseAuth.sendSignInLinkToEmail(
  //         email: emailAuth, actionCodeSettings: acs);
  //     return Right(true);
  //   } catch (e) {
  //     return Left(SignInCredentialFailure());
  //   }
  // }

  // signOut() async {
  //   await firebaseAuth.signOut();
  // }
}
