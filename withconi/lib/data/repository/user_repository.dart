import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/provider/user_api.dart';
import '../../core/error_handling/failures.dart';
import '../model/user.dart';

class UserRepository {
  UserRepository._internal();
  static final _singleton = UserRepository._internal();
  factory UserRepository() => _singleton;

  final UserAPI _api = UserAPI();

  Future<Either<Failure, WcUser>> getUserInfoWithUid(
      {required String uid}) async {
    try {
      Map<String, dynamic> data = await _api.getUserInfo(uid: uid);

      try {
        WcUser wcUser = WcUser.fromJson(data['user']);
        return Right(wcUser);
      } catch (e) {
        throw DataParsingException();
      }
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

  Future<Either<Failure, bool>> updateUser(
      {required Map<String, dynamic> updateData}) async {
    try {
      Map<String, dynamic>? data =
          await _api.updateUser(updateData: updateData);
      if (data != null) {
        return Right(true);
      } else {
        return Left(UserInfoUpdateFailure());
      }
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(UserInfoUpdateFailure());
    }
  }
}
