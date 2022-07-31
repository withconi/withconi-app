import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/data/provider/auth_api.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import '../../controller/signup/shared_data/user_data.dart';
import '../../core/auth_info.dart';
import '../../core/error_handling/exceptions.dart';
import '../../core/error_handling/failures.dart';
import '../model/conimal.dart';
import '../model/disease.dart';
import '../model/user.dart';

class SignupRepository extends GetxController {
  // SignupUserRepository._internal();
  // static final _singleton = SignupUserRepository._internal();
  static SignupRepository get to => Get.find<SignupRepository>();

  final RxString _email = ''.obs;
  final RxString _name = ''.obs;
  final RxString _password = ''.obs;
  final RxString _nickName = ''.obs;
  final Rxn<File> _profileImg = Rxn<File>();
  final List<Conimal> _conimalList = [];

  String get email => _email.value;
  String get name => _name.value;
  String get password => _password.value;
  String get nickName => _nickName.value;
  File? get profileImg =>
      (_profileImg.value == null) ? null : _profileImg.value;
  String get profileImgPath =>
      (_profileImg.value == null) ? '' : _profileImg.value!.path;
  List<Conimal> get conimalList => _conimalList;
  bool visitedConimal2Page = false;
  int get checkConimalNum => conimalList.length;

  // setSharedData() {
  //   final UserData _userData = Get.put(UserData());
  //   final ConimalData _conimalData = Get.put(ConimalData());
  // }

  final AuthAPI _api = AuthAPI();

  saveConimalList(List<Conimal> conimalList) {
    _conimalList.assignAll(conimalList);
  }

  saveEmail(String email) {
    // _authInfo.value = authInfo;
    _email.value = email;
  }

  saveUserName(String name) {
    _name.value = name;
  }

  saveUserPassword(String password) {
    _password.value = password;
  }

  saveUserNickname(String nickName) {
    _nickName.value = nickName;
  }

  saveUserProfile(File? profileFile) {
    _profileImg.value = profileFile;
  }

  removeAllData() {
    _email.value = '';
    _name.value = '';
    _nickName.value = '';
    _password.value = '';
    _profileImg.value = null;
    _conimalList.clear();
  }

  Either<Failure, bool> addConimal({
    required String conimalName,
    required Gender gender,
    required Species species,
    required DateTime birthDate,
    required DateTime adoptedDate,
    required List<Disease> diseaseList,
  }) {
    try {
      print('here');
      Conimal newConimal = Conimal(
        conimalId: DateTime.now().millisecondsSinceEpoch.toString(),
        name: conimalName,
        gender: gender,
        species: species,
        birthDate: birthDate,
        adoptedDate: adoptedDate,
        diseases: diseaseList,
      );
      print('더 추가하기에서 질병 : ${diseaseList}');

      if (_conimalList.length > 3) {
        throw MaxListException();
      } else {
        _conimalList.add(newConimal);
      }

      return Right(true);
    } on MaxListException {
      return Left(MaxConimalFailure());
    } catch (e) {
      return Left(DataParsingFailure());
    }
  }

  Either<Failure, bool> editTempConimal(Conimal conimal, int index) {
    try {
      _conimalList.removeAt(index);
      _conimalList.insert(index, conimal);
      return Right(true);
    } catch (e) {
      return Left(NoSuchDataInListFailure());
    }
  }

  Either<Failure, Conimal> getTempConimal(int index) {
    try {
      return Right(_conimalList[index]);
    } catch (e) {
      return Left(NoSuchDataInListFailure());
    }
  }

  Either<Failure, List<Conimal>> setConimalList(
      {List<Conimal>? newConimalList}) {
    try {
      if (newConimalList != null) {
        _conimalList.assignAll(newConimalList);
      }
      return Right(_conimalList);
    } catch (e) {
      return Left(GetConimalListFailure());
    }
  }

  Either<Failure, bool> removeConimalIndex(int index) {
    try {
      _conimalList.removeAt(index);
      return Right(true);
    } on EmptyListException {
      return Left(EmptyListFailure());
    } catch (e) {
      return Left(RemoveConimalFailure());
    }
  }

  Either<Failure, String> removeLastAddedConimal() {
    try {
      _conimalList.removeLast();
      return Right('남은 코니멀은 총 ${_conimalList.length}입니다');
    } on EmptyListException {
      return Left(EmptyListFailure());
    } catch (e) {
      return Left(RemoveConimalFailure());
    }
  }

  Either<Failure, bool> removeAllConimal() {
    try {
      _conimalList.clear();
      return Right(true);
    } on EmptyListException {
      return Left(EmptyListFailure());
    } catch (e) {
      return Left(RemoveConimalFailure());
    }
  }

  Future<WcUser> signUpUserDB(
      {required String uid,
      required AuthInfo authInfo,
      required List<Conimal> conimals}) async {
    WcUser newUser;
    newUser = WcUser(
        uid: uid,
        email: authInfo.email,
        displayName: name,
        nickname: nickName,
        provider: authInfo.provider,
        photoURL: profileImgPath,
        conimals: conimals);

    await _api.signUpDB(newUser);

    return newUser;
  }
}
