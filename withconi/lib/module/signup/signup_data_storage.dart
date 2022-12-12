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
  // final Rx<SignUpDataModel> _signupModel =
  //     SignUpDataModel('', '', '', null, false, false, null, false, []).obs;

  late String _email;
  late Provider _provider;
  late String _name;
  late String _nickname;
  List<ConimalUIModel> _conimalList = [];
  late SigningAuthInfo _signingAuthInfo;
  late ImageItem? _profileImg;

  String get email => _email;
  Provider get provider => _provider;
  String get name => _name;
  String get nickname => _nickname;
  List<ConimalUIModel> get conimalList => _conimalList.toList();
  // int get checkConimalNum => _signupModel.value.conimals.length;
  SigningAuthInfo get signingAuthInfo => _signingAuthInfo;
  ImageItem? get profileImg => _profileImg;
  SignUpDataModel get signUpDataModel => SignUpDataModel(
      email,
      name,
      nickname,
      signingAuthInfo,
      signingAuthInfo.provider.signMethod == SignMethod.sns,
      signingAuthInfo.provider.signMethod == SignMethod.sns,
      profileImg,
      false,
      conimalList);

  storeUserName(String name) {
    _name = name;
  }

  storeAuthInfo(SigningAuthInfo signingAuthInfo) {
    _signingAuthInfo = signingAuthInfo;
    signingAuthInfo.map(
        tokenAuthInfo: ((value) => _email = value.email),
        credentialAuthInfo: ((value) => _email = value.email),
        emailPwdAuthInfo: ((value) => _email = value.email));
  }

  storeUserNickname(String nickName) {
    // _nickName.value = nickName;
    _nickname = nickName;
  }

  storeUserProfile(ImageItem? imageItem) {
    // _profileImg.value = imageItem;
    _profileImg = (imageItem != null)
        ? ImageItem(
            id: imageItem.id,
            imageUrl: imageItem.imageUrl,
            imageType: imageItem.imageType,
          )
        : null;
  }

  storeConimals(List<ConimalUIModel> conimals) {
    // _profileImg.value = imageItem;
    _conimalList.assignAll(conimals);
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
