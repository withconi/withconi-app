import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/provider/user_api.dart';
import '../../core/error_handling/failures.dart';
import '../model/user.dart';

class UserRepository {
  final UserAPI _api = UserAPI();

  Future<Either<Failure, WcUser>> getUserInfoByUid(
      {required String uid}) async {
    try {
      Map<String, dynamic> data = await _api.getUserInfo(uid: uid);
      WcUser wcUser = WcUser.fromJson(data);
      return Right(wcUser);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }
}
