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
}
