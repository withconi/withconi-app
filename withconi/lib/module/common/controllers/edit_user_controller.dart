import 'package:dartz/dartz.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:withconi/data/enums/enum.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/failures.dart';
import 'package:withconi/data/repository/user_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/global_widgets/photo_gallary/image_item.dart';
import 'package:withconi/module/ui_model/user_ui_model.dart';
import '../../../core/values/constants/regex.dart';
import '../../../core/values/constants/strings.dart';
import '../../../core/tools/helpers/image_picker_helper.dart';
import '../../../data/repository/image_repository.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/dialog/selection_dialog.dart';

class EditUserController extends GetxController {
  EditUserController(this._userRepository, this._imageRepository);
  final UserRepository _userRepository;
  final ImageRepository _imageRepository;

  final RxString _name = ''.obs;
  final RxString _nickName = ''.obs;
  RxBool isButtonValid = false.obs;
  // Rxn<ImageItem> imageItem = Rxn<ImageItem>();
  RxnString nameErrorText = RxnString();
  RxnString nickNameErrorText = RxnString();
  late Rx<UserUIModel> editUser;
  RxBool edited = false.obs;
  // RxBool isEmailVerified = false.obs;

  TextEditingController nameTextController = TextEditingController();
  TextEditingController nickNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  String get userProvider => editUser.value.provider.code;
  Image? get providerIcon => Image.asset(
        'assets/icons/$userProvider.png',
        width: 39,
      );

  @override
  void onInit() {
    super.onInit();
    editUser = Rx<UserUIModel>(AuthController.to.userInfo!);
    nameTextController.text = editUser.value.diaplayName;
    nickNameTextController.text = editUser.value.nickname;
    emailTextController.text = editUser.value.email;
    // isEmailVerified.value = editUser.isEmailVerified;
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
    editUser.value.diaplayName = val;
    editUser.refresh();
    edited.value = true;
  }

  void onNickNameChanged(String val) {
    _nickName.value = val;
    editUser.value.nickname = val;
    editUser.refresh();
    edited.value = true;
  }

  void onImageChanged(ImageItem image) {
    editUser.value.profileImage = image;
    editUser.refresh();
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

  Future<void> getBack() async {
    if (validateButton()) {
      bool isConfirmed = await showSelectionDialog(
          cancleText: '계속하기',
          confirmText: '그만하기',
          title: '수정을 그만할까요?',
          subtitle: '변경된 정보는 모두 사라집니다');
      if (isConfirmed) {
        Get.back();
      }
    } else {
      Get.back();
    }
  }

  Future<void> onFinishButtonTap() async {
    bool isConfirmed = await showSelectionDialog(
        cancleText: '아니요',
        confirmText: '네',
        title: '정보를 수정할까요?',
        subtitle: '변경된 정보를 수정합니다');

    if (isConfirmed) {
      await editUserInfoDB();
      Get.back();
    }
  }

  Future<String> uploadImageFileDB() async {
    String imageRef = '';

    Either<Failure, String> imageUploadRefsEither;
    imageUploadRefsEither = await showLoading(() => _imageRepository
        .uploadImageFile(imageItem: editUser.value.profileImage!));

    imageUploadRefsEither.fold(
        (l) =>
            FailureInterpreter().mapFailureToSnackbar(l, 'uploadImageFileDB'),
        (r) {
      imageRef = r;
    });

    return imageRef;
  }

  onEmailVerificationButtonTap() async {
    bool? emailVerificationResult = await Get.toNamed(
      Routes.EMAIL_VERIFICATION,
    ) as bool?;

    if (emailVerificationResult != null) {
      if (emailVerificationResult == true) {
        editUser.value.isEmailVerified = true;
        editUser.refresh();
      }
    }
  }

  Future<void> unregister() async {
    bool stay = await showSelectionDialog(
        cancleText: '탈퇴할게요',
        confirmText: '남을게요',
        title: '앱을 탈퇴할까요?',
        subtitle: '그래도 다시 돌아오실거죠?');

    if (!stay) {
      print('탈퇴');
    }
  }

  Future<void> signOut() async {
    bool isConfirmed = await showSelectionDialog(
        cancleText: '아니요',
        confirmText: '네',
        title: '로그아웃 할까요?',
        subtitle: '꼭 다시 돌아오실거죠?');

    if (isConfirmed) {
      AuthController.to.signOut();
      return;
    }
  }

  Future<void> editUserInfoDB() async {
    String imageRef = '';
    if (editUser.value.profileImage != null &&
        editUser.value.profileImage!.imageType == ImageType.file) {
      imageRef = await uploadImageFileDB();
    }

    Either<Failure, bool> updateUserEither = await showLoading(() =>
        _userRepository.updateUser(user: editUser.value, photoRef: imageRef));

    updateUserEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToSnackbar(fail, 'editUserInfo'),
        (success) async {
      await AuthController.to.refreshWcUserInfo();
    });
  }

  void changePassword() {
    if (editUser.value.passwordChangable) {
      Get.toNamed(Routes.EMAIL_VERIFICATION);
    } else {
      FailureInterpreter().mapFailureToSnackbar(
          const NotEditablePasswordFailure(), 'changePassword');
    }
  }
}
