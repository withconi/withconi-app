// import 'package:dartz/dartz.dart';
// import 'package:withconi/configs/constants/enum.dart';
// import 'package:withconi/controller/signup/shared_data/conimal_data.dart';
// import 'package:withconi/core/error_handling/exceptions.dart';
// import 'package:withconi/import_basic.dart';
// import '../../core/error_handling/failures.dart';
// import '../model/conimal.dart';
// import '../model/disease.dart';
// import '../provider/user_api.dart';

// class ConimalRepository extends GetxController {
//   static ConimalRepository get to => Get.find<ConimalRepository>();
//   List<Conimal> conimalList = [];
//   bool visitedConimal2Page = false;
//   UserAPI _api = UserAPI();

//   removeAllData() {
//     conimalList.clear();
//     visitedConimal2Page = false;
//   }

//   Either<Failure, bool> addTempConimal({
//     required String conimalName,
//     required Gender gender,
//     required Species species,
//     required DateTime birthDate,
//     required DateTime adoptedDate,
//     required List<Disease> diseaseList,
//   }) {
//     try {
//       Conimal newConimal = Conimal(
//         conimalId: DateTime.now().millisecondsSinceEpoch.toString(),
//         name: conimalName,
//         gender: gender,
//         species: species,
//         birthDate: birthDate,
//         adoptedDate: adoptedDate,
//         diseases: diseaseList,
//         // createdAt: DateTime.now(),
//       );

//       if (conimalList.length > 3) {
//         throw MaxListException();
//       } else {
//         conimalList.add(newConimal);
//       }

//       return Right(true);
//     } on MaxListException {
//       return Left(MaxConimalFailure());
//     } catch (e) {
//       return Left(DataParsingFailure());
//     }
//   }

//   Future<Either<Failure, bool>> addConimalDB({
//     required List<Conimal> existingConimals,
//     required String conimalName,
//     required Gender gender,
//     required Species species,
//     required DateTime birthDate,
//     required DateTime adoptedDate,
//     required List<Disease> diseaseList,
//   }) async {
//     try {
//       Conimal newConimal = Conimal(
//         conimalId: DateTime.now().millisecondsSinceEpoch.toString(),
//         name: conimalName,
//         gender: gender,
//         species: species,
//         birthDate: birthDate,
//         adoptedDate: adoptedDate,
//         diseases: diseaseList,
//         // createdAt: DateTime.now(),
//       );
//       List<Conimal> existingConimalList = [];
//       existingConimalList.assignAll(existingConimals);

//       if (conimalList.length > 3) {
//         throw MaxListException();
//       } else {
//         existingConimalList.add(newConimal);
//       }

//       await updateConimal(conimalList: existingConimalList);

//       return Right(true);
//     } on MaxListException {
//       return Left(MaxConimalFailure());
//     } catch (e) {
//       return Left(DataParsingFailure());
//     }
//   }

//   Either<Failure, bool> editTempConimal(Conimal conimal, int index) {
//     try {
//       conimalList.removeAt(index);
//       conimalList.insert(index, conimal);
//       return Right(true);
//     } catch (e) {
//       return Left(NoSuchDataInListFailure());
//     }
//   }

//   Future<Either<Failure, bool>> updateConimal(
//       {required List<Conimal> conimalList}) async {
//     try {
//       List<Map<String, dynamic>> conimalListToJson =
//           conimalList.map((conimals) => conimals.toJson()).toList();

//       print(conimalListToJson);

//       await _api.updateUser(updateData: {"conimals": conimalListToJson});

//       return Right(true);
//     } catch (e) {
//       return Left(NoSuchDataInListFailure());
//     }
//   }

//   Either<Failure, Conimal> getTempConimal(int index) {
//     try {
//       return Right(conimalList[index]);
//     } catch (e) {
//       return Left(NoSuchDataInListFailure());
//     }
//   }

//   // Either<Failure, List<Conimal>> getAllTempConimal() {
//   //   try {
//   //     return Right(conimalList);
//   //   } catch (e) {
//   //     return Left(GetConimalListFailure());
//   //   }
//   // }

//   Either<Failure, List<Conimal>> setConimalList(
//       {List<Conimal>? newConimalList}) {
//     try {
//       if (newConimalList != null) {
//         conimalList.assignAll(newConimalList);
//       }
//       return Right(conimalList);
//     } catch (e) {
//       return Left(GetConimalListFailure());
//     }
//   }

//   Either<Failure, bool> removeTempConimal(int index) {
//     try {
//       conimalList.removeAt(index);
//       return Right(true);
//     } on EmptyListException {
//       return Left(EmptyListFailure());
//     } catch (e) {
//       return Left(RemoveConimalFailure());
//     }
//   }

//   Either<Failure, String> removeLastTempConimal() {
//     try {
//       conimalList.removeLast();
//       return Right('남은 코니멀은 총 ${conimalList.length}입니다');
//     } on EmptyListException {
//       return Left(EmptyListFailure());
//     } catch (e) {
//       return Left(RemoveConimalFailure());
//     }
//   }

//   Either<Failure, bool> removeAllTempConimal() {
//     try {
//       conimalList.clear();
//       return Right(true);
//     } on EmptyListException {
//       return Left(EmptyListFailure());
//     } catch (e) {
//       return Left(RemoveConimalFailure());
//     }
//   }

//   checkConimalNum() {
//     return conimalList.length;
//   }
// }

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
  // bool visitedConimal2Page = false;
  ConimalAPI _api = ConimalAPI();

  // removeAllData() {
  //   conimalList.clear();
  //   visitedConimal2Page = false;
  // }

  // Either<Failure, bool> addTempConimal({
  //   required String conimalName,
  //   required Gender gender,
  //   required Species species,
  //   required DateTime birthDate,
  //   required DateTime adoptedDate,
  //   required List<Disease> diseaseList,
  // }) {
  //   try {
  //     Conimal newConimal = Conimal(
  //       conimalId: DateTime.now().millisecondsSinceEpoch.toString(),
  //       name: conimalName,
  //       gender: gender,
  //       species: species,
  //       birthDate: birthDate,
  //       adoptedDate: adoptedDate,
  //       diseases: diseaseList,
  //       // createdAt: DateTime.now(),
  //     );

  //     if (conimalList.length > 3) {
  //       throw MaxListException();
  //     } else {
  //       conimalList.add(newConimal);
  //     }

  //     return Right(true);
  //   } on MaxListException {
  //     return Left(MaxConimalFailure());
  //   } catch (e) {
  //     return Left(DataParsingFailure());
  //   }
  // }

  Future<Either<Failure, bool>> createConimalDB({
    required String conimalName,
    required Gender gender,
    required Species species,
    required DateTime birthDate,
    required DateTime adoptedDate,
    required List<Disease> diseaseList,
  }) async {
    try {
      Conimal newConimal = Conimal(
        conimalId: DateTime.now().millisecondsSinceEpoch.toString(),
        name: conimalName,
        gender: gender,
        species: species,
        birthDate: birthDate,
        adoptedDate: adoptedDate,
        diseases: diseaseList,
        uid: firebaseAuth.currentUser!.uid.toString(),
        // createdAt: DateTime.now(),
      );

      await _api.createConimal(conimal: newConimal.toJson());

      return Right(true);
    } on MaxListException {
      return Left(MaxConimalFailure());
    } catch (e) {
      return Left(DataParsingFailure());
    }
  }

  // Either<Failure, bool> editTempConimal(Conimal conimal, int index) {
  //   try {
  //     conimalList.removeAt(index);
  //     conimalList.insert(index, conimal);
  //     return Right(true);
  //   } catch (e) {
  //     return Left(NoSuchDataInListFailure());
  //   }
  // }

  // Future<Either<Failure, bool>> createConimal(
  //     {required Conimal conimal}) async {
  //   try {
  //     return Right(true);
  //   } catch (e) {
  //     return Left(NoSuchDataInListFailure());
  //   }
  // }

  // Either<Failure, Conimal> getTempConimal(int index) {
  //   try {
  //     return Right(conimalList[index]);
  //   } catch (e) {
  //     return Left(NoSuchDataInListFailure());
  //   }
  // }

  // Either<Failure, List<Conimal>> getAllTempConimal() {
  //   try {
  //     return Right(conimalList);
  //   } catch (e) {
  //     return Left(GetConimalListFailure());
  //   }
  // }

  // Either<Failure, List<Conimal>> setConimalList(
  //     {List<Conimal>? newConimalList}) {
  //   try {
  //     if (newConimalList != null) {
  //       conimalList.assignAll(newConimalList);
  //     }
  //     return Right(conimalList);
  //   } catch (e) {
  //     return Left(GetConimalListFailure());
  //   }
  // }

  // Either<Failure, bool> removeTempConimal(int index) {
  //   try {
  //     conimalList.removeAt(index);
  //     return Right(true);
  //   } on EmptyListException {
  //     return Left(EmptyListFailure());
  //   } catch (e) {
  //     return Left(RemoveConimalFailure());
  //   }
  // }

  // Either<Failure, String> removeLastTempConimal() {
  //   try {
  //     conimalList.removeLast();
  //     return Right('남은 코니멀은 총 ${conimalList.length}입니다');
  //   } on EmptyListException {
  //     return Left(EmptyListFailure());
  //   } catch (e) {
  //     return Left(RemoveConimalFailure());
  //   }
  // }

  // Either<Failure, bool> removeAllTempConimal() {
  //   try {
  //     conimalList.clear();
  //     return Right(true);
  //   } on EmptyListException {
  //     return Left(EmptyListFailure());
  //   } catch (e) {
  //     return Left(RemoveConimalFailure());
  //   }
  // }

  // checkConimalNum() {
  //   return conimalList.length;
  // }
}
