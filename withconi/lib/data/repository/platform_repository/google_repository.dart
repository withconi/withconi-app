import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/data/provider/google_api.dart';
import 'package:withconi/data/provider/kakao_api.dart';

import '../../../core/error_handling/exceptions.dart';
import '../../../core/error_handling/failures.dart';

class GoogleRepository {
  final GoogleAPI _api = GoogleAPI();

  Future<Either<Failure, OAuthCredential>> getGoogleCredential() async {
    try {
      OAuthCredential googleCredential = await _api.getGoogleCredential();

      return Right(googleCredential);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on PlatformException {
      return Left(NoUserDataFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }
}
