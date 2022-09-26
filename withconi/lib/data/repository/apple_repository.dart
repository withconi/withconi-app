import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/configs/helpers/cache_manager.dart';
import 'package:withconi/data/provider/apple_api.dart';
import 'package:withconi/data/provider/google_api.dart';
import 'package:withconi/data/provider/kakao_api.dart';

import '../../core/error_handling/exceptions.dart';
import '../../core/error_handling/failures.dart';

class AppleRepository {
  final AppleAPI _api = AppleAPI();

  // Future<Either<Failure, String>> getAppleEmail() async {
  //   try {
  //     String? appleEmail = await _api.getAppleUserEmail();

  //     if (appleEmail != null) {
  //       await CacheManager().saveCache(CacheControllerKey.email, appleEmail);
  //     } else {
  //       appleEmail = CacheManager().getCache(CacheControllerKey.email);
  //       print(appleEmail);
  //     }

  //     return Right(appleEmail);
  //   } on NoInternetConnectionException {
  //     return Left(NoConnectionFailure());
  //   } on PlatformException {
  //     return Left(NoUserDataFailure());
  //   } catch (e) {
  //     return Left(NoUserDataFailure());
  //   }
  // }

  Future<Either<Failure, OAuthCredential>> getAppleCredential() async {
    try {
      OAuthCredential appleCredential = await _api.getAppleCredential();

      return Right(appleCredential);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }
}
