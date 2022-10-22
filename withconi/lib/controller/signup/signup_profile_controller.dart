import 'dart:io';
import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:withconi/controller/signup/data/signup_data_manager.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/ui/widgets/photo_gallary/image_item.dart';
import '../../configs/constants/regex.dart';
import '../../configs/constants/strings.dart';
import '../../configs/helpers/image_picker_helper.dart';
import '../../import_basic.dart';

class SignupProfileController extends GetxController {
  // final ConimalRepository _signUpRepository = ConimalRepository.to;
  // final SignupRepository _signUpRepository = Get.find();
  final SignUpDataManager _signUpDataManager = Get.find();

  final RxString _name = ''.obs;
  final RxString _nickName = ''.obs;
  RxBool isButtonValid = false.obs;

  Rxn<ImageItem> profileImg = Rxn<ImageItem>();

  RxBool profileSelected = false.obs;

  RxnString nameErrorText = RxnString();
  RxnString nickNameErrorText = RxnString();

  TextEditingController nameTextController = TextEditingController();
  TextEditingController nickNameTextController = TextEditingController();
  String get name => _name.value;
  String get nickName => _nickName.value;

  @override
  void onReady() {
    super.onReady();

    debounce(_name, validateName, time: const Duration(milliseconds: 200));
    debounce(_nickName, validateNickname,
        time: const Duration(milliseconds: 200));
  }

  void onNameChanged(String val) {
    _name.value = val;
  }

  void onNickNameChanged(String val) {
    _nickName.value = val;
  }

  void onImageChanged(ImageItem image) {
    profileImg.value = image;
    profileSelected.value = true;
  }

  validateButton() {
    if (nameErrorText.value == null &&
        name.isNotEmpty &&
        nickNameErrorText.value == null &&
        nickName.isNotEmpty) {
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
    final Either<Failure, ImageItem?>? imageFileEither =
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

  nextStep() {
    // _signUpRepository.saveUserName(name);
    // _signUpRepository.saveUserNickname(nickName);
    // _signUpRepository.saveUserProfile(profileImg.value);

    _signUpDataManager.storeUserName(name);
    _signUpDataManager.storeUserNickname(nickName);
    _signUpDataManager.storeUserProfile(profileImg.value);

    if (_signUpDataManager.conimalList.isNotEmpty) {
      Get.toNamed(Routes.SIGNUP_CONIMAL_STEP2);
    } else {
      Get.toNamed(Routes.SIGNUP_CONIMAL_STEP1);
    }
  }
}
