import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:withconi/data/repository/signup_conimal_data_repository.dart';
import 'package:withconi/data/repository/signup_user_repository.dart';
import '../../configs/constants/regex.dart';
import '../../configs/constants/strings.dart';
import '../../import_basic.dart';

class SignupProfileController extends GetxController {
  final ConimalRepository _conimalRepository = ConimalRepository.to;
  final SignupUserRepository _userRepository = SignupUserRepository.to;

  final RxString _name = ''.obs;
  final RxString _nickName = ''.obs;
  RxBool isButtonValid = false.obs;

  Rxn<dynamic> profileImg = Rxn<dynamic>();

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
    debounce(_nickName, validateName, time: const Duration(milliseconds: 200));
  }

  void onNameChanged(String val) {
    _name.value = val;
  }

  void onNickNameChanged(String val) {
    _nickName.value = val;
  }

  void onImageChanged(dynamic image) {
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

  pickImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print('image selected');
      onImageChanged(File(image.path));
    }
  }

  nextStep() {
    _userRepository.saveUserName(name);
    _userRepository.saveUserNickname(nickName);
    _userRepository.saveUserProfile(profileImg.value);
    if (_conimalRepository.visitedConimal2Page) {
      Get.toNamed(Routes.SIGNUP_CONIMAL_STEP2);
    } else {
      Get.toNamed(Routes.SIGNUP_CONIMAL_STEP1);
    }
  }
}
