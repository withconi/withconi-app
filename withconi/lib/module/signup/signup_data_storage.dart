import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:withconi/core/signing_auth_info.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/signup_user_ui_model.dart';
import '../../core/error_handling/exceptions.dart';
import '../../core/error_handling/failures.dart';
import '../../data/enums/enum.dart';
import '../../global_widgets/photo_gallary/image_item.dart';

class SignUpDataStorage extends GetxService {
  final Rx<SignUpDataModel> _signupModel =
      SignUpDataModel('', '', '', null, false, false, null, false, []).obs;

  String get email => _signupModel.value.signingAuthInfo!.map(
        tokenAuthInfo: (value) => value.email,
        credentialAuthInfo: (value) => value.email,
        emailPwdAuthInfo: (value) => value.email,
      );
  Provider get provider => _signupModel.value.signingAuthInfo!.map(
        tokenAuthInfo: (value) => value.provider,
        credentialAuthInfo: (value) => value.provider,
        emailPwdAuthInfo: (value) => value.provider,
      );
  String get name => _signupModel.value.name;
  String get nickname => _signupModel.value.nickname;
  List<ConimalUIModel> get conimalList => _signupModel.value.conimals;
  // int get checkConimalNum => _signupModel.value.conimals.length;
  SigningAuthInfo get signingAuthInfo => _signupModel.value.signingAuthInfo!;
  ImageItem? get profileImg => _signupModel.value.profileImage;
  SignUpDataModel get signUpDataModel => SignUpDataModel(email, name, nickname,
      signingAuthInfo, false, false, profileImg, false, conimalList);
  // SigningAuthInfo get authInfo => signupModel;

  // storeConimalList(List<ConimalUIModel> conimalList) {
  //   // _conimalList.assignAll(conimalList);
  //   _signupModel.value.conimals.assignAll(conimalList);
  // }

  // storeEmail(String email) {
  //   // _email.value = email;
  //   _signupModel.value.email = email;
  // }

  storeUserName(String name) {
    _signupModel.value.name = name;
  }

  storeAuthInfo(SigningAuthInfo signingAuthInfo) {
    // _password.value = password;
    //password가 지정되었다면 Email & Password 로그인이기 때문에
    // cuatomAuthInfo 클래스 내에 있는 인증객체에 password를 할당한다.
    // _customAuthInfo.authObject = password;
    _signupModel.value.signingAuthInfo = signingAuthInfo;
  }

  storeUserNickname(String nickName) {
    // _nickName.value = nickName;
    _signupModel.value.nickname = nickName;
  }

  storeUserProfile(ImageItem? imageItem) {
    // _profileImg.value = imageItem;
    _signupModel.value.profileImage = imageItem;
  }

  storeConimals(List<ConimalUIModel> conimals) {
    // _profileImg.value = imageItem;
    _signupModel.value.conimals.assignAll(conimals);
  }

  // storeAuthInfo(CustomAuthInfo authInfo) {
  //   _customAuthInfo = authInfo;
  //   _email.value = authInfo.email;
  // }

  // removeAllData() {
  //   _signupModel =
  //       SignUpDataModel('', '', '', null, false, false, null, false, []).obs;
  // }

  // Either<Failure, bool> addConimal(ConimalUIModel conimalUIModel) {
  //   if (conimalList.length > 3) {
  //     return Left(MaxConimalFailure());
  //   } else {
  //     _signupModel.value.conimals.add(conimalUIModel);
  //   }

  //   return Right(true);
  // }

  // Either<Failure, bool> editConimal(ConimalUIModel conimal, int index) {
  //   try {
  //     _signupModel.value.conimals.removeAt(index);
  //     _signupModel.value.conimals.insert(index, conimal);
  //     return Right(true);
  //   } catch (e) {
  //     return Left(NoSuchDataInListFailure());
  //   }
  // }

  // Either<Failure, ConimalResponseDTO> getConimalInfo(int index) {
  //   try {
  //     return Right(_conimalList[index]);
  //   } catch (e) {
  //     return Left(NoSuchDataInListFailure());
  //   }
  // }

  // Either<Failure, List<ConimalResponseDTO>> setConimalList(
  //     {List<ConimalResponseDTO>? newConimalList}) {
  //   try {
  //     if (newConimalList != null) {
  //       _conimalList.assignAll(newConimalList);
  //     }
  //     return Right(_conimalList);
  //   } catch (e) {
  //     return Left(GetConimalListFailure());
  //   }
  // }

  // Either<Failure, bool> removeConimal(int index) {
  //   try {
  //     if (_signupModel.value.conimals.length <= 1) {
  //       return Left(RemoveConimalFailure());
  //     } else {
  //       _signupModel.value.conimals.removeAt(index);
  //     }

  //     return Right(true);
  //   } on EmptyListException {
  //     return Left(EmptyListFailure());
  //   } catch (e) {
  //     return Left(RemoveConimalFailure());
  //   }
  // }

  // Either<Failure, String> removeLastAddedConimal() {
  //   try {
  //     _signupModel.value.conimals.removeLast();
  //     return Right('남은 코니멀은 총 ${_signupModel.value.conimals.length}입니다');
  //   } on EmptyListException {
  //     return Left(EmptyListFailure());
  //   } catch (e) {
  //     return Left(RemoveConimalFailure());
  //   }
  // }

  // Either<Failure, bool> removeAllConimal() {
  //   try {
  //     _signupModel.value.conimals.clear();
  //     return Right(true);
  //   } on EmptyListException {
  //     return Left(EmptyListFailure());
  //   } catch (e) {
  //     return Left(RemoveConimalFailure());
  //   }
  // }
}
