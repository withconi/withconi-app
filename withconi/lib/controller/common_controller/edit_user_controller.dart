import 'dart:io';
import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/model/user.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/data/repository/signup_repository.dart';
import 'package:withconi/data/repository/user_repository.dart';
import 'package:withconi/ui/widgets/loading.dart';

import '../../configs/constants/regex.dart';
import '../../configs/constants/strings.dart';
import '../../configs/helpers/image_picker_helper.dart';
import '../../import_basic.dart';

class EditUserController extends GetxController {
  UserRepository _userRepository = UserRepository();

  final RxString _name = ''.obs;
  final RxString _nickName = ''.obs;
  RxBool isButtonValid = false.obs;

  Rxn<dynamic> profileImg = Rxn<dynamic>();

  RxBool profileSelected = false.obs;

  RxnString nameErrorText = RxnString();
  RxnString nickNameErrorText = RxnString();
  late WcUser _wcUser;
  RxBool edited = false.obs;
  late bool passwordEditable;

  TextEditingController nameTextController = TextEditingController();
  TextEditingController nickNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  String get userProvider => providerToValue(_wcUser.provider);

  Image? get providerIcon => Image.asset(
        'assets/icons/${userProvider}.png',
        width: 39,
      );

  @override
  void onInit() {
    super.onInit();
    _wcUser = AuthController.to.wcUser.value!;
    nameTextController.text = _wcUser.displayName;
    nickNameTextController.text = _wcUser.nickname;
    emailTextController.text = _wcUser.email;
    if (userProvider == 'email') {
      passwordEditable = true;
    } else {
      passwordEditable = false;
    }
  }

  @override
  void onReady() {
    super.onReady();

    debounce(_name, validateName, time: const Duration(milliseconds: 200));
    debounce(_nickName, validateNickname,
        time: const Duration(milliseconds: 200));
  }

  void onNameChanged(String val) {
    _name.value = val;
    edited.value = true;
  }

  void onNickNameChanged(String val) {
    _nickName.value = val;
    edited.value = true;
  }

  void onImageChanged(dynamic image) {
    profileImg.value = image;
    profileSelected.value = true;
    edited.value = true;
  }

  validateButton() {
    if (nameErrorText.value == null &&
        nickNameErrorText.value == null &&
        edited.value) {
      isButtonValid.value = true;
    } else {
      isButtonValid.value = false;
    }
    return isButtonValid.value;
  }

  validateName(String value) {
    final nameRegExp = Regex.name;
    nameErrorText.value = null;
    if (!nameRegExp.hasMatch(value)) {
      nameErrorText.value = Strings.validator.name;
    } else {
      nameErrorText.value = null;
    }
  }

  validateNickname(String value) {
    final nicknameRegExp = Regex.name;
    nameErrorText.value = null;
    if (!nicknameRegExp.hasMatch(value)) {
      nickNameErrorText.value = Strings.validator.nickname;
    } else {
      nickNameErrorText.value = null;
    }
  }

  void pickImage() async {
    final ImagePickHelper _picker = ImagePickHelper();
    // Pick an image
    final Either<Failure, File?>? imageFileEither =
        await _picker.pickSingleImage();

    if (imageFileEither != null) {
      imageFileEither.fold(
          (fail) =>
              FailureInterpreter().mapFailureToSnackbar(fail, 'pickImage'),
          (file) {
        if (file != null) {
          onImageChanged(file);
        }
      });
    }
  }

  Future<void> editUserInfo() async {
    Either<Failure, bool> updateUserEither =
        await showLoading(() => _userRepository.updateUser(updateData: {
              "displayName": nameTextController.text,
              "nickName": nickNameTextController.text,
            }));

    updateUserEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, 'editUserInfo'),
        (success) => AuthController.to.updateUserInfo());
  }

  void changePassword() {
    if (passwordEditable) {
    } else {
      FailureInterpreter().mapFailureToSnackbar(
          const NotEditablePasswordFailure(), 'changePassword');
    }
  }
}
