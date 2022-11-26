import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_naver_login/flutter_naver_login.dart';

import 'package:withconi/core/values/constants/auth_variables.dart';

import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/core/network_handling/network_service.dart';

import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/data/model/dto/request_dto/community_request/get_version_check_request_dto.dart';
import 'package:withconi/import_basic.dart';

import '../../../core/error_handling/failures.dart';

class SignInAPI extends GetxService {
  final Api _dio = Api();

  // checkAppVersion() async {
  //   GetVersionCheckRequestDTO requestDTO = GetVersionCheckRequestDTO.fromData();
  //   ApiCallDTO apiCallDTO = ApiCallDTO.fromDTO(requestDTO);
  //   Map<String, dynamic> data = await _dio.apiCall(apiCallDTO);

  //   return data;
  // }

  Future<Either<Failure, User?>> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(NoEmailUserFailure());
      } else if (e.code == 'wrong-password') {
        return Left(WrongPasswordFailure());
      } else {
        return Left(NoUserDataFailure());
      }
    } catch (e) {
      return Left(NoUserDataFailure());
    }
  }

  Future<User?> signInWithCustomToken({required String customToken}) async {
    try {
      UserCredential _userCredential =
          await firebaseAuth.signInWithCustomToken(customToken);
      return _userCredential.user;
    } catch (e) {
      throw SignInTokenException();
    }
  }

  Future<User?> signInWithAuthCredential(
      {required OAuthCredential credential}) async {
    try {
      UserCredential _userCredential =
          await firebaseAuth.signInWithCredential(credential);
      print(firebaseAuth.currentUser);
      return _userCredential.user;
    } catch (e) {
      throw SignInCredentialException();
    }
  }

  Future<Map<String, dynamic>> refreshFirebaseCustomToken(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> customTokenData = await _dio.apiCall(apiCallDTO);

    return customTokenData;
  }
}
