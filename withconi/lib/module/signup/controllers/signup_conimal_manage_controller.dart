import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:withconi/core/signing_auth_info.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/core/tools/helpers/calculator.dart';
import 'package:withconi/data/model/custom_token.dart';
import 'package:withconi/data/repository/image_repository.dart';
import 'package:withconi/data/repository/signup_repository.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/module/signup/signup_data_storage.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/app_setting_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/user_ui_model.dart';
import '../../../core/error_handling/failures.dart';
import '../../../global_widgets/dialog/selection_dialog.dart';
import '../../../global_widgets/snackbar.dart';
import '../../../import_basic.dart';

class SignupConimalManageController extends GetxController {
  SignupConimalManageController(
      this._signUpDataManager, this._signupRepository, this._imageRepository);

  final SignUpDataStorage _signUpDataManager;
  final ImageRepository _imageRepository;
  final SignUpRepository _signupRepository;
  // late final Provider _provider;
  RxList<ConimalUIModel> conimalList = RxList<ConimalUIModel>();
  String get userName => _signUpDataManager.name;
  RxBool isButtonValid = false.obs;
  @override
  void onInit() {
    super.onInit();
    conimalList.assignAll(_signUpDataManager.conimalList.toList());
  }

  @override
  void onReady() {
    super.onReady();

    ever(conimalList, validateButton);
  }

  validateButton(_conimalList) {
    if (_conimalList.length <= 0) {
      isButtonValid.value = false;
    } else {
      isButtonValid.value = true;
    }
  }

  addConimal() async {
    if (conimalList.length < 3) {
      ConimalUIModel? addedConimal =
          await Get.toNamed(Routes.CONIMAL_ADD) as ConimalUIModel?;
      if (addedConimal != null) {
        conimalList.add(addedConimal);
      }
    }
  }

  editConimal(int index) async {
    ConimalUIModel? editedConimal = await Get.toNamed(Routes.CONIMAL_EDIT,
        arguments: {'editConimal': conimalList[index]}) as ConimalUIModel?;

    if (editedConimal != null) {
      conimalList.removeAt(index);
      conimalList.insert(index, editedConimal);
    }
  }

  Future<void> onDeleteTap(int index) async {
    if (conimalList.length <= 1) {
      showCustomSnackbar(text: '한마리 이상의 코니멀은 꼭 있어야 해요');
    } else {
      bool isConfirmed = await showSelectionDialog(
          cancleText: '아니요',
          confirmText: '예',
          title: '삭제할까요?',
          subtitle: '코니멀 정보가 삭제됩니다');
      if (isConfirmed) {
        deleteConimal(index);
      }
    }
  }

  void deleteConimal(int index) {
    conimalList.removeAt(index);
  }

  Future<void> signUp() async {
    _signUpDataManager.storeConimals(conimalList.toList());

    await showLoading(() async {
      User? newUser = await _signUpDataManager.signUpDataModel.signingAuthInfo!
          .map(
              tokenAuthInfo: (value) => signUpTokenAuthInfo(value),
              credentialAuthInfo: (value) => signUpCredentialAuthInfo(value),
              emailPwdAuthInfo: (value) => signUpEmailPwdAuthInfo(value));

      if (newUser != null) {
        await signUpDB(newUser);
      } else {
        return;
      }
    });
  }

  Future<User?> signUpCredentialAuthInfo(
      CredentialSigningAuthInfo authInfo) async {
    var signUpResult = await _signupRepository.signUpWithCredential(
        oAuthCredential: authInfo.oAuthCredential);

    if (signUpResult.isRight()) {
      return signUpResult.fold((l) => null, (user) => user);
    } else {
      return null;
    }
  }

  Future<User?> signUpEmailPwdAuthInfo(EmailPwdSigningAuthInfo authInfo) async {
    var signUpResult = await _signupRepository.signUpWithEmailPwd(
        email: authInfo.email, password: authInfo.password);

    if (signUpResult.isRight()) {
      return signUpResult.fold((l) => null, (user) => user);
    } else {
      return null;
    }
  }

  Future<User?> signUpTokenAuthInfo(TokenSigningAuthInfo tokenAuthInfo) async {
    var customTokenResult = await _signupRepository.createFirebaseCustomToken(
        platformToken: tokenAuthInfo.platformToken,
        provider: tokenAuthInfo.provider);

    if (customTokenResult.isRight()) {
      return customTokenResult.fold((l) => null, (r) async {
        Either<Failure, User?> _signUpResult = await _signupRepository
            .signUpWithFirebaseToken(firebaseToken: r.accessToken);
        return _signUpResult.fold((l) => null, (user) {
          return user;
        });
      });
    } else {
      return null;
    }
  }

  Future<void> signUpDB(firebaseUser) async {
    print(_signUpDataManager.signUpDataModel.conimals);
    bool finished = await showLoading(() async {
      String? profileImageRef;
      if (_signUpDataManager.signUpDataModel.profileImage != null) {
        var uploadEither = await _imageRepository.uploadImageFile(
            imageItem: _signUpDataManager.signUpDataModel.profileImage!);

        profileImageRef =
            uploadEither.fold((l) => null, (imageRef) => imageRef);
      }

      Either<Failure, Map<String, dynamic>> dbUserEither =
          await _signupRepository.signUpUserDB(
              signUpData: _signUpDataManager.signUpDataModel,
              firebaseUid: firebaseUser.uid,
              profileUploadRef: profileImageRef);

      bool success = dbUserEither.fold((l) {
        FailureInterpreter().mapFailureToSnackbar(l, 'signUpDB');
        return false;
      }, (r) => true);
      return success;
    });

    if (finished) {
      await AuthController.to.setUserAuthInfo();
      Get.offAllNamed(Routes.NAVIGATION);
    }
    return;
  }
}
