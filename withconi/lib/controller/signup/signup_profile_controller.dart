import 'package:withconi/controller/signup/user_data.dart';
import '../../configs/constants/regex.dart';
import '../../configs/constants/strings.dart';
import '../../import_basic.dart';

class SignupProfileController extends GetxController {
  late RxString _name;
  late RxString _nickName;
  late RxBool isButtonValid;

  RxnString nameErrorText = RxnString();
  RxnString nickNameErrorText = RxnString();

  TextEditingController nameTextController = TextEditingController();
  TextEditingController nickNameTextController = TextEditingController();
  String get name => _name.value;
  String get nickName => _nickName.value;

  @override
  void onInit() {
    super.onInit();

    _name = ''.obs;
    _nickName = ''.obs;
    isButtonValid = false.obs;
  }

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

  nextStep() {
    UserData.to.saveName(name);
    UserData.to.saveNickName(nickName);
    // UserData.to.saveProfileSrc();
    Get.toNamed(Routes.SIGNUP_CONIMAL_STEP1);
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
}
