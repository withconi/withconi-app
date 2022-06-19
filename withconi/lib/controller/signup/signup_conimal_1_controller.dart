import 'package:intl/intl.dart';
import 'package:withconi/controller/signup/shared_data/conimal_data.dart';
import 'package:withconi/controller/signup/shared_data/user_data.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import '../../configs/constants/enum.dart';
import '../../configs/constants/regex.dart';
import '../../configs/constants/strings.dart';
import '../../import_basic.dart';
import 'shared_data/disease_data.dart';

class SignupConimal1Controller extends GetxController {
  final ConimalRepository _conimalRepository = ConimalRepository();
  RxString _userName = ''.obs;
  RxString _conimalName = ''.obs;
  RxString diseaseText = ''.obs;
  RxString diseaseSuffixText = ''.obs;
  RxBool showAddConimalButton = false.obs;
  Rxn<Gender> conimalGender = Rxn<Gender>();
  Rxn<Species> conimalSpecies = Rxn<Species>();
  RxBool isButtonValid = false.obs;
  RxBool birthDateSelected = false.obs;
  RxBool speciesSelected = false.obs;
  RxBool genderSelected = false.obs;
  RxBool adoptedDateSelected = false.obs;
  RxBool diseaseSelected = false.obs;
  final Rxn<DateTime> _birthDate = Rxn<DateTime>();
  final Rxn<DateTime> _adoptedDate = Rxn<DateTime>();

  RxList<bool> genderSelectionList = [false, false].obs;
  RxnString conimalNameErrorText = RxnString();
  TextEditingController conimalNameTextController = TextEditingController();

  String get userName => _userName.value;
  String get conimalName => _conimalName.value;
  DateTime? get birthDate => _birthDate.value;
  DateTime? get adoptedDate => _adoptedDate.value;
  String get birthDateString => (_birthDate.value == null)
      ? ''
      : DateFormat('yyyy-MM-dd').format(_birthDate.value!);
  String get adoptedDateString => (_adoptedDate.value == null)
      ? ''
      : DateFormat('yyyy-MM-dd').format(_adoptedDate.value!);

  @override
  void onInit() {
    super.onInit();
    final DiseaseData _diseaseData = Get.put(DiseaseData());
  }

  @override
  void onReady() {
    super.onReady();

    _userName.value = UserData.to.name;

    debounce(_conimalName, validateName,
        time: const Duration(milliseconds: 400));

    ever(isButtonValid, (value) async {
      await Future.delayed(const Duration(milliseconds: 200));
      if (value == true) {
        showAddConimalButton.value = true;
      } else {
        showAddConimalButton.value = false;
      }
    });
  }

  void onConimalNameChanged(String val) {
    _conimalName.value = val;
  }

  void onGenderChanged(Gender gender) {
    conimalGender.value = gender;
    genderSelected.value = true;
  }

  void onSpeicesChanged(Species species) {
    conimalSpecies.value = species;
    speciesSelected.value = true;
  }

  validateButton() {
    if (conimalNameErrorText.value == null &&
        conimalName.isNotEmpty &&
        birthDateSelected.value &&
        adoptedDateSelected.value &&
        speciesSelected.value &&
        genderSelected.value) {
      isButtonValid.value = true;
    } else {
      isButtonValid.value = false;
    }
    return isButtonValid.value;
  }

  nextStep() {}

  validateName(String value) {
    final nameRegExp = Regex.name;
    conimalNameErrorText.value = null;
    if (!nameRegExp.hasMatch(value)) {
      conimalNameErrorText.value = Strings.validator.name;
    } else {
      conimalNameErrorText.value = null;
    }
  }

  selectBirthDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: _birthDate.value ?? DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      _birthDate.value = pickedDate;
      birthDateSelected.value = true;
    } else {
      birthDateSelected.value = false;
    }
  }

  selectAdoptedDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: _adoptedDate.value ?? DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      _adoptedDate.value = pickedDate;
      adoptedDateSelected.value = true;
    } else {
      adoptedDateSelected.value = false;
    }
  }

  selectDisease() async {
    Map<String, dynamic> selectedDiseaseInfo =
        await Get.toNamed(Routes.SIGNUP_DISEASE_SEARCH);
    setSelectedDiseaseText(selectedDiseaseInfo);
  }

  setSelectedDiseaseText(Map<String, dynamic> diseaseInfo) {
    if (diseaseInfo['diseaseNum'] != 0) {
      diseaseSelected.value = true;
      if (diseaseInfo['diseaseNum'] > 1) {
        diseaseText.value =
            '${diseaseInfo['diseaseNameList'][0].substring(0, 10)}';
        diseaseSuffixText.value = ' 외 ${diseaseInfo['diseaseNum'] - 1}개';
      } else {
        diseaseText.value =
            '${diseaseInfo['diseaseNameList'][0].substring(0, 10)}';
        diseaseSuffixText.value = '';
      }
    } else {
      diseaseSelected.value = false;
    }
  }

  finishRegister() {
    _conimalRepository.addConimal(
      conimalName: conimalName,
      adoptedDate: adoptedDate!,
      birthDate: birthDate!,
      gender: conimalGender.value!,
      species: conimalSpecies.value!,
    );
    Get.toNamed(Routes.SIGNUP_CONIMAL_STEP2);
  }

  addMoreConimal() {
    Get.offNamed(Routes.SIGNUP_CONIMAL_STEP1, preventDuplicates: false);
  }
}
