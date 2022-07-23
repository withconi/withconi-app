import 'package:dartz/dartz.dart';
import 'package:withconi/configs/constants/auth_variables.dart';
import 'package:withconi/configs/constants/enum.dart';
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
      await _api.updateConimal(conimal: editConimal.toJson());

      return Right(true);
    } on MaxListException {
      return Left(MaxConimalFailure());
    } catch (e) {
      return Left(DataParsingFailure());
    }
  }
}
