import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:withconi/core/values/constants/auth_variables.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/user_request/get_user_info_request_dto.dart';
import 'package:withconi/data/model/dto/request_dto/user_request/update_user_info_request_dto.dart';
import 'package:withconi/data/model/dto/response_dto/auth_response/user_response_dto.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/provider/remote_provider/user_api.dart';
import 'package:withconi/module/ui_model/user_ui_model.dart';
import '../../core/error_handling/failures.dart';
import '../../core/tools/helpers/dynamic_link_manager.dart';
import '../../routes/routes.dart';
import '../model/dto/request_dto/auth_request/get_duplicated_email_check_request_dto.dart';
import '../model/dto/response_dto/auth_response/email_duplication_check_response_dto.dart';

class UserRepository extends GetxService {
  UserRepository(this._api);

  final UserAPI _api;
  final DynamicLinkManager _dynamicLinkManager = DynamicLinkManager();

  Future<Either<Failure, UserResponseDTO>> getUserInfo() async {
    try {
      var requestDTO = GetUserInfoRequestDTO.fromData();
      var apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      Map<String, dynamic> data = await _api.getUserInfo(apiCallDTO);

      try {
        UserResponseDTO user = UserResponseDTO.fromJson(data);

        return Right(user);
      } catch (e) {
        throw DataParsingException();
      }
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on DataParsingException {
      return Left(DataParsingFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } on UnauthorizedException {
      return Left(WrongTokenFailure());
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, bool>> updateUser(
      {required UserUIModel user, String? photoRef}) async {
    try {
      var requestDTO =
          UpdateUserInfoRequestDTO.fromData(data: user, photoRef: photoRef);
      var apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      Map<String, dynamic>? data = await _api.updateUser(apiCallDTO);
      return Right(true);
    } on NoInternetConnectionException {
      return Left(NoConnectionFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(UserInfoUpdateFailure());
    }
  }

  Future<Either<Failure, UserInfoExistenceResponseDTO>> getUserInfoExistence({
    required String email,
  }) async {
    try {
      var requestDTO = GetUserInfoExistenceRequestDTO.fromData(email);

      ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
      final Map<String, dynamic> userInfoExistenceResult =
          await _api.getUserInfoExistence(apiCallDTO);

      var responseDTO =
          UserInfoExistenceResponseDTO.fromJson(userInfoExistenceResult);

      return Right(responseDTO);
    } on NoInternetConnectionException {
      print('NoInternetConnectionException');
      return Left(NoConnectionFailure());
    } catch (e) {
      print('NoUserDataFailure');
      return Left(NoUserDataFailure());
    }
  }

  Future<Either<Failure, bool>?> sendVerificationEmail(
      {required String email,
      required String currentRoute,
      required String nextRoute}) async {
    try {
      var acs = ActionCodeSettings(
          url: await _dynamicLinkManager.getShortLink(
              Routes.EMAIL_VERIFICATION, nextRoute),
          // This must be true
          handleCodeInApp: true,
          iOSBundleId: 'co.yellowtoast.withconi',
          androidPackageName: 'co.yellowtoast.withconi',
          // installIfNotAvailable
          androidInstallApp: true,

          // minimumVersion
          dynamicLinkDomain: 'withconimal.page.link',
          androidMinimumVersion: '12');

      var emailAuth = email;
      await firebaseAuth.sendSignInLinkToEmail(
          email: emailAuth, actionCodeSettings: acs);
      return Right(true);
    } catch (e) {
      return Left(SignInCredentialFailure());
    }
  }

  signOut() async {
    await firebaseAuth.signOut();
  }
}
