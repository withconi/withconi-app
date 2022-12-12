import 'dart:io';
import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:withconi/core/signing_auth_info.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/community/widgets/pick_image_bottom_sheet.dart';
import 'package:withconi/module/signup/signup_data_storage.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';
import 'package:withconi/module/ui_model/signup_user_ui_model.dart';
import '../../../core/values/constants/regex.dart';
import '../../../core/values/constants/strings.dart';
import '../../../core/tools/helpers/image_picker_helper.dart';
import '../../../data/repository/signup_repository.dart';
import '../../../import_basic.dart';

class SignupProfileController extends GetxController {
  // final ConimalRepository _signUpRepository = ConimalRepository.to;
  // final SignupRepository _signUpRepository = Get.find();

  SignupProfileController(this._signUpDataManager, this._signingAuthInfo);
  // final SignupRepository _repository;
  final SignUpDataStorage _signUpDataManager;

  final RxString _name = ''.obs;
  final RxString _nickName = ''.obs;
  RxBool isButtonValid = false.obs;

  Rxn<ImageItem> profileImg = Rxn<ImageItem>();

  RxBool profileSelected = false.obs;

  RxnString nameErrorText = RxnString();
  RxnString nickNameErrorText = RxnString();

  late final SigningAuthInfo _signingAuthInfo;

  TextEditingController nameTextController = TextEditingController();
  TextEditingController nickNameTextController = TextEditingController();
  String get name => _name.value;
  String get nickName => _nickName.value;

  @override
  void onReady() {
    super.onReady();

    _signUpDataManager.storeAuthInfo(_signingAuthInfo);

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

  void onImageTap() async {
    ImagePickOption? imagePickOption = await showPickImageBottomSheet();

    if (imagePickOption != null) {
      if (imagePickOption == ImagePickOption.deleteAll) {
        profileImg.value = null;
        return;
      } else {
        _pickImage(imagePickOption.imageSource!);
      }
    }
  }

  _pickImage(ImageSource imageSource) async {
    final ImagePickHelper _picker = ImagePickHelper();
    // Pick an image
    final Either<Failure, ImageItem?> imageFileEither =
        await _picker.pickImage(imageSource);

    var imageItem = imageFileEither.fold((fail) {
      FailureInterpreter().mapFailureToSnackbar(fail, 'pickImage');
      return null;
    }, (newImageItem) {
      return newImageItem;
    });

    if (imageItem != null) {
      onImageChanged(imageItem);
    }
  }

  nextStep() {
    _signUpDataManager.storeUserName(name);
    _signUpDataManager.storeUserNickname(nickName);
    _signUpDataManager.storeUserProfile(profileImg.value);

    // if (_signUpDataManager.conimalList.isNotEmpty) {
    //   Get.toNamed(Routes.CONIMAL_MANAGE,
    //       arguments: _signUpDataManager.conimalList);
    // } else {
    //   Get.toNamed(Routes.CONIMAL_ADD);
    // }
    Get.toNamed(Routes.SIGNUP_CONIMAL_MANAGE,
        arguments: {'conimals': _signUpDataManager.conimalList.toList()});
  }
}
