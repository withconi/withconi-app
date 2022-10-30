import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:withconi/core/custom_auth_info.dart';
import 'package:withconi/data/model/user.dart';
import '../../data/enums/enum.dart';
import '../../core/error_handling/exceptions.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../data/model/disease.dart';
import '../widgets/photo_gallary/image_item.dart';

class SignUpDataBrain extends GetxController {
  final RxString _email = ''.obs;
  final RxString _name = ''.obs;
  final RxString _password = ''.obs;
  final RxString _nickName = ''.obs;
  final Rxn<ImageItem> _profileImg = Rxn<ImageItem>();
  final List<Conimal> _conimalList = [];
  late CustomAuthInfo _customAuthInfo;
  bool visitedConimal2Page = false;

  String get email => _email.value;
  String get name => _name.value;
  String get password => _password.value;
  String get nickName => _nickName.value;
  List<Conimal> get conimalList => _conimalList;
  int get checkConimalNum => conimalList.length;
  ImageItem? get profileImg => _profileImg.value;

  CustomAuthInfo get authInfo => _customAuthInfo;

  sstoreonimalList(List<Conimal> conimalList) {
    _conimalList.assignAll(conimalList);
  }

  storeEmail(String email) {
    _email.value = email;
  }

  storeUserName(String name) {
    _name.value = name;
  }

  storeUserPassword(String password) {
    _password.value = password;
    //password가 지정되었다면 Email & Password 로그인이기 때문에
    // cuatomAuthInfo 클래스 내에 있는 인증객체에 password를 할당한다.
    _customAuthInfo.authObject = password;
  }

  storeUserNickname(String nickName) {
    _nickName.value = nickName;
  }

  storeUserProfile(ImageItem? imageItem) {
    _profileImg.value = imageItem;
  }

  storeAuthInfo(CustomAuthInfo authInfo) {
    _customAuthInfo = authInfo;
    _email.value = authInfo.email;
  }

  removeAllData() {
    _email.value = '';
    _name.value = '';
    _nickName.value = '';
    _password.value = '';
    _profileImg.value = null;
    _conimalList.clear();
  }

  WcUser newUserForDb({required String firebaseUid}) {
    late final bool isEmailVerified;
    late final bool verificationSkipped;

    if (authInfo.provider != Provider.email) {
      isEmailVerified = true;
      verificationSkipped = false;
    } else {
      isEmailVerified = true;
      verificationSkipped = true;
    }

    return WcUser(
        uid: firebaseUid,
        email: _customAuthInfo.email,
        displayName: name,
        nickname: nickName,
        provider: _customAuthInfo.provider,
        conimals: conimalList.toList(),
        isEmailVerified: isEmailVerified,
        verificationSkipped: verificationSkipped);
  }

  Either<Failure, bool> addConimal({
    required String conimalName,
    required Gender gender,
    required Species species,
    required DateTime birthDate,
    required DateTime adoptedDate,
    required List<Disease> diseaseList,
  }) {
    Conimal newConimal = Conimal(
      conimalId: DateTime.now().millisecondsSinceEpoch.toString(),
      name: conimalName,
      gender: gender,
      species: species,
      birthDate: birthDate,
      adoptedDate: adoptedDate,
      diseases: diseaseList,
    );

    if (_conimalList.length > 3) {
      return Left(MaxConimalFailure());
    } else {
      _conimalList.add(newConimal);
    }

    return Right(true);
  }

  Either<Failure, bool> editConimal(Conimal conimal, int index) {
    try {
      _conimalList.removeAt(index);
      _conimalList.insert(index, conimal);
      return Right(true);
    } catch (e) {
      return Left(NoSuchDataInListFailure());
    }
  }

  Either<Failure, Conimal> getConimalInfo(int index) {
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
}
