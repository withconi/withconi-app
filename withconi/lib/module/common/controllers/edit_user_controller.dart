import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
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
import '../../community/widgets/pick_image_bottom_sheet.dart';
import '../../ui_model/conimal_ui_model.dart';

class EditUserController extends GetxController {
  EditUserController(this._userRepository, this._imageRepository);
  final UserRepository _userRepository;
  final ImageRepository _imageRepository;

  late final String _name;
  late RxString _nickName;
  late final String _uid;
  late final String _email;
  late final bool _isWrittenReview;
  late final bool passwordChangable;
  RxBool isButtonValid = false.obs;
  late Rx<ImageItem> profileImage;
  // RxnString nameErrorText = RxnString();
  RxnString nickNameErrorText = RxnString();
  // late Rx<UserUIModel> editUser;
  RxBool edited = false.obs;
  RxBool isEmailVerified = false.obs;
  late bool verificationSkipped;

  late List<ConimalUIModel> _conimalList;

  TextEditingController nameTextController = TextEditingController();
  TextEditingController nickNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  late Provider _provider;
  Image? get providerIcon => Image.asset(
        _provider.iconSrc,
        width: 39,
      );

  @override
  void onInit() {
    super.onInit();
    UserUIModel editUser = AuthController.to.userInfo;
    profileImage = Rx<ImageItem>(ImageItem(
        id: editUser.profileImage.id,
        imageUrl: editUser.profileImage.imageUrl,
        imageType: editUser.profileImage.imageType));
    _provider = editUser.provider;
    _conimalList = editUser.conimals.toList();
    verificationSkipped = editUser.verificationSkipped;
    _isWrittenReview = editUser.isWrittenReview;
    _uid = editUser.uid;
    _email = editUser.email;
    _nickName = editUser.nickname.obs;
    _name = editUser.diaplayName;
    nickNameTextController.text = _nickName.value;
    passwordChangable = editUser.passwordChangable;
    nameTextController.text = editUser.diaplayName;

    emailTextController.text = editUser.email;
    isEmailVerified.value = editUser.isEmailVerified;
  }

  @override
  void onReady() {
    super.onReady();

    // debounce(_name, validateName, time: const Duration(milliseconds: 200));
    debounce(_nickName, validateNickname,
        time: const Duration(milliseconds: 200));
  }

//   void onNameChanged(String val) {
//     _name.value = val;
// //  diaplayName = val;
//     // editUser.refresh();
//     edited.value = true;
//   }

  void onNickNameChanged(String val) {
    _nickName.value = val;
    edited.value = true;
  }

  void onImageChanged(ImageItem image) {
    // editUser.value.profileImage = image;
    // editUser.refresh();
    profileImage.value = image;
    edited.value = true;
  }

  validateButton() {
    if (nickNameErrorText.value == null && edited.value) {
      isButtonValid.value = true;
    } else {
      isButtonValid.value = false;
    }
    return isButtonValid.value;
  }

  // validateName(String value) {
  //   if (value.isEmpty) {
  //     nameErrorText.value = Strings.validator.nickname;
  //     return;
  //   }
  //   final nameRegExp = Regex.name;
  //   nameErrorText.value = null;
  //   if (!nameRegExp.hasMatch(value)) {
  //     nameErrorText.value = Strings.validator.name;
  //   } else {
  //     nameErrorText.value = null;
  //   }
  // }

  validateNickname(String value) {
    if (value.isEmpty) {
      nickNameErrorText.value = Strings.validator.nickname;
      return;
    }
    final nicknameRegExp = Regex.name;

    if (!nicknameRegExp.hasMatch(value)) {
      nickNameErrorText.value = Strings.validator.nickname;
    } else {
      nickNameErrorText.value = null;
    }
  }

  void onTapProfileButton() async {
    ImagePickOption? imagePickOption = await showPickImageBottomSheet();

    if (imagePickOption != null) {
      if (imagePickOption == ImagePickOption.deleteAll) {
        profileImage.value.deleteImage();
        profileImage.refresh();
        edited.value = true;
        // editUser.refresh();
        return;
      } else {
        await showLoading(() => _pickImage(imagePickOption.imageSource!));
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
    if (isButtonValid.value) {
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
  }

  Future<String> uploadImageFileDB() async {
    String imageRef = '';

    Either<Failure, String> imageUploadRefsEither;
    imageUploadRefsEither = await showLoading(
        () => _imageRepository.uploadImageFile(imageItem: profileImage.value));

    imageUploadRefsEither.fold(
        (l) =>
            FailureInterpreter().mapFailureToSnackbar(l, 'uploadImageFileDB'),
        (r) {
      imageRef = r;
    });

    return imageRef;
  }

  onEmailVerificationButtonTap() async {
    await Get.toNamed(Routes.EMAIL_VERIFICATION, arguments: null);
    isEmailVerified.value = AuthController.to.userInfo.isEmailVerified;
  }

  Future<void> unregister() async {
    bool confirm = await showSelectionDialog(
        cancleText: '남을게요',
        confirmText: '탈퇴할게요',
        title: '앱을 탈퇴할까요?',
        subtitle: '그래도 다시 돌아오실거죠?');

    if (confirm) {
      bool reconfirm = await showSelectionDialog(
          cancleText: '취소',
          confirmText: '탈퇴하기',
          title: '진짜진짜 탈퇴할까요?',
          subtitle: '꼭 다시 돌아오셔야 해요..');

      if (reconfirm) {
        print('진짜 탈퇴');
      }
    }
  }

  Future<void> signOut() async {
    bool isConfirmed = await showSelectionDialog(
        cancleText: '아니요',
        confirmText: '네',
        title: '로그아웃 할까요?',
        subtitle: '꼭 다시 돌아오실거죠?');

    if (isConfirmed) {
      await AuthController.to.signOut();
      return;
    }
  }

  Future<void> editUserInfoDB() async {
    String imageRef = '';
    if (profileImage.value.imageUrl.isNotEmpty &&
        profileImage.value.imageType == ImageType.file) {
      imageRef = await uploadImageFileDB();
    }

    await showLoading(() async {
      Either<Failure, bool> updateUserEither = await _userRepository.updateUser(
          user: UserUIModel(
              uid: _uid,
              email: _email,
              diaplayName: _name,
              nickname: _nickName.value,
              provider: _provider,
              isEmailVerified: isEmailVerified.value,
              verificationSkipped: verificationSkipped,
              profileImage: profileImage.value,
              isWrittenReview: _isWrittenReview,
              conimals: _conimalList.toList(),
              passwordChangable: passwordChangable),
          photoRef: imageRef);

      bool updateUserSucceed = updateUserEither.fold((fail) {
        FailureInterpreter().mapFailureToSnackbar(fail, 'editUserInfo');
        return false;
      }, (success) {
        return success;
      });

      if (updateUserSucceed) {
        await AuthController.to.setUserAuthInfo();
        return;
      } else {
        return;
      }
    });
  }

  Future<void> onChangePasswordTap() async {
    if (passwordChangable) {
      await Get.toNamed(Routes.CHANGE_PASSWORD, arguments: {'email': _email});
    } else {
      FailureInterpreter().mapFailureToSnackbar(
          const NotEditablePasswordFailure(), 'changePassword');
    }
  }

  Future<void> onEmailVerificationTap() async {
    if (passwordChangable) {
      bool? result = await Get.toNamed(Routes.EMAIL_VERIFICATION,
          arguments: {'nextRoute': null}) as bool?;

      if (result != null) {
        isEmailVerified.value = result;
      }
    } else {
      FailureInterpreter().mapFailureToSnackbar(
          const NotEditablePasswordFailure(), 'changePassword');
    }
  }
}
