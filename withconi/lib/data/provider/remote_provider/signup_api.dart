import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/data/model/dto/api_call_dto.dart';
import 'package:withconi/import_basic.dart';

import '../../../core/error_handling/exceptions.dart';
import '../../../core/error_handling/failures.dart';
import '../../../core/network_handling/network_service.dart';
import '../../../core/values/constants/auth_variables.dart';

class SignupAPI extends GetxService {
  final Api _dio = Api();

  Future<Map<String, dynamic>> signUpDB(ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> signUpResultData = await _dio.apiCall(apiCallDTO);
    return signUpResultData;
  }

  Future<Map<String, dynamic>> createFirebaseCustomToken(
      ApiCallDTO apiCallDTO) async {
    Map<String, dynamic> customTokenData = await _dio.apiCall(apiCallDTO);
    return customTokenData;
  }

  Future<Either<Failure, User?>> signUpWithEmailPassword(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
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

  Future<Either<Failure, User?>> signUpWithCustomToken(
      {required String customToken}) async {
    try {
      UserCredential _userCredential =
          await firebaseAuth.signInWithCustomToken(customToken);
      return Right(_userCredential.user);
    } catch (e) {
      throw Left(SignInTokenException());
    }
  }

  Future<Either<Failure, User?>> signUpWithAuthCredential(
      {required OAuthCredential credential}) async {
    try {
      UserCredential _userCredential =
          await firebaseAuth.signInWithCredential(credential);

      return Right(_userCredential.user);
    } catch (e) {
      throw Left(SignInCredentialException());
    }
  }
}




  // newFirebaseCustomToken(TokenSigningAuthInfo tokenSignUpAuthInfo) {

  //   _api.createFirebaseCustomToken(apiCallDTO)
  // }


