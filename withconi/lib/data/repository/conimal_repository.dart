import 'package:dartz/dartz.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/signup/shared_data/conimal_data.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import '../../core/error_handling/failures.dart';
import '../model/conimal.dart';
import '../model/disease.dart';

class ConimalRepository {
  ConimalRepository._internal();
  static final _singleton = ConimalRepository._internal();
  factory ConimalRepository() => _singleton;
  List<Conimal> tempConimalList = [];
  bool visitedConimal2Page = false;

  Either<Failure, bool> addTempConimal({
    required String conimalName,
    required Gender gender,
    required Species species,
    required DateTime birthDate,
    required DateTime adoptedDate,
    required List<Disease> diseaseList,
  }) {
    try {
      Conimal newConimal = Conimal(
          name: conimalName,
          gender: gender,
          species: species,
          birthDate: birthDate,
          adoptedDate: adoptedDate,
          diseases: diseaseList,
          createdAt: DateTime.now());

      if (tempConimalList.length > 3) {
        throw MaxListException();
      } else {
        tempConimalList.add(newConimal);
      }

      return Right(true);
    } on MaxListException {
      return Left(MaxConimalFailure());
    } catch (e) {
      return Left(DataParsingFailure());
    }
  }

  Either<Failure, bool> registerConimals() {
    try {
      if (tempConimalList.length > 3) {
        throw MaxListException();
      } else {
        for (var conimal in tempConimalList) {
          ConimalData.to.registerConimal(conimal);
        }
      }

      return Right(true);
    } on MaxListException {
      return Left(MaxConimalFailure());
    } catch (e) {
      return Left(RegisterConimalFailure());
    }
  }

  Either<Failure, bool> editTempConimal(Conimal conimal, int index) {
    try {
      tempConimalList.removeAt(index);
      tempConimalList.insert(index, conimal);
      return Right(true);
    } catch (e) {
      return Left(NoSuchDataInListFailure());
    }
  }

  Either<Failure, Conimal> getTempConimal(int index) {
    try {
      return Right(tempConimalList[index]);
    } catch (e) {
      return Left(NoSuchDataInListFailure());
    }
  }

  Either<Failure, List<Conimal>> getAllTempConimal() {
    try {
      return Right(tempConimalList);
    } catch (e) {
      return Left(GetConimalListFailure());
    }
  }
  // Either<Failure, bool> removeConimal() {
  //   try {
  //     ConimalData.to.removeConimal();
  //     return Right(true);
  //   } on EmptyListException {
  //     return Left(EmptyListFailure());
  //   } catch (e) {
  //     return Left(RemoveConimalFailure());
  //   }
  // }

  Either<Failure, bool> removeTempConimal(int index) {
    try {
      tempConimalList.removeAt(index);
      return Right(true);
    } on EmptyListException {
      return Left(EmptyListFailure());
    } catch (e) {
      return Left(RemoveConimalFailure());
    }
  }

  Either<Failure, String> removeLastTempConimal() {
    try {
      tempConimalList.removeLast();
      return Right('남은 코니멀은 총 ${tempConimalList.length}입니다');
    } on EmptyListException {
      return Left(EmptyListFailure());
    } catch (e) {
      return Left(RemoveConimalFailure());
    }
  }

  Either<Failure, bool> removeAllTempConimal() {
    try {
      tempConimalList.clear();
      return Right(true);
    } on EmptyListException {
      return Left(EmptyListFailure());
    } catch (e) {
      return Left(RemoveConimalFailure());
    }
  }

  // List<Conimal> getConimalList() {
  //   List<Conimal> conimalList = ConimalData.to.registeredConimals;
  //   return conimalList;
  // }

  checkConimalNum() {
    return tempConimalList.length;
  }
}
