import 'package:dartz/dartz.dart';
import 'package:withconi/configs/constants/auth_variables.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/signup/shared_data/conimal_data.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/import_basic.dart';
import '../../core/error_handling/failures.dart';
import '../model/conimal.dart';
import '../model/disease.dart';
import '../provider/conimal_api.dart';
import '../provider/user_api.dart';

class ConimalRepository extends GetxController {
  static ConimalRepository get to => Get.find<ConimalRepository>();
  List<Conimal> conimalList = [];
  ConimalAPI _api = ConimalAPI();

  Future<Either<Failure, bool>> createConimal(
      {required Conimal newConimal}) async {
    try {
      await _api.createConimal(conimal: newConimal.toJson());

      return Right(true);
    } on MaxListException {
      return Left(MaxConimalFailure());
    } catch (e) {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> updateConimal(
      {required Conimal editConimal}) async {
    try {
      print(AuthController.to.wcUser.value!.uid);
      await _api.updateConimal(conimal: editConimal.toJson());

      return Right(true);
    } on MaxListException {
      return Left(MaxConimalFailure());
    } catch (e) {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> updateConimalDisease(
      {required List<Disease> diseases,
      required String conimalId,
      required String userId}) async {
    try {
      List<String> diseaseCodeList = [];

      if (diseases.isNotEmpty) {
        diseaseCodeList =
            diseases.map((disease) => disease.code.toString()).toList();
      }

      await _api.updateConimalDisease(
          conimalId: conimalId, diseases: diseaseCodeList, userId: userId);

      return Right(true);
    } on MaxListException {
      return Left(MaxConimalFailure());
    } catch (e) {
      return Left(DataParsingFailure());
    }
  }

  Future<Either<Failure, bool>> deleteConimal(
      {required String conimalId}) async {
    try {
      await _api.deleteConimal(
          userId: AuthController.to.wcUser.value!.uid, conimalId: conimalId);

      return Right(true);
    } on MaxListException {
      return Left(MaxConimalFailure());
    } catch (e) {
      return Left(DataParsingFailure());
    }
  }
}
