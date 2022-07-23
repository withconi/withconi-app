import 'package:intl/intl.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import '../../configs/constants/enum.dart';
import '../../configs/constants/regex.dart';
import '../../configs/constants/strings.dart';
import '../../data/model/conimal.dart';
import '../../data/model/disease.dart';
import '../../import_basic.dart';

class EditConimalController extends GetxController {
  final ConimalRepository _conimalRepository = Get.put(ConimalRepository());
  late Conimal _conimal;
  RxString controllerTag = ''.obs;
  RxString _conimalName = ''.obs;
  RxString diseaseText = ''.obs;
  RxString diseaseSuffixText = ''.obs;
  RxBool showAddConimalButton = false.obs;
  Rxn<Gender> conimalGender = Rxn<Gender>();
  Rxn<Species> conimalSpecies = Rxn<Species>();
  List<Disease> _diseaseList = [];
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
    _conimal = Get.arguments as Conimal;
    setConimalInfo(_conimal);
  }

  @override
  void onReady() {
    super.onReady();

    debounce(_conimalName, validateName,
        time: const Duration(milliseconds: 400));

    ever(isButtonValid, (value) async {
      await Future.delayed(const Duration(milliseconds: 300));
      if (value == true) {
        showAddConimalButton.value = true;
      } else {
        showAddConimalButton.value = false;
      }
    });
  }

  setConimalInfo(Conimal editConimal) {
    onSpeicesChanged(editConimal.species);
    onBirthDateChanged(editConimal.birthDate);
    onAdoptedDateChanged(editConimal.adoptedDate);
    onDiseaseListChanged(editConimal.diseases);
    onConimalNameChanged(editConimal.name);
    conimalNameTextController.text = editConimal.name;
    onGenderChanged(editConimal.gender);
    if (editConimal.gender == Gender.female) {
      genderSelectionList[0] = true;
      genderSelectionList[1] = false;
    } else {
      genderSelectionList[0] = false;
      genderSelectionList[1] = true;
    }
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

  onBirthDateChanged(DateTime birthDate) {
    _birthDate.value = birthDate;
    birthDateSelected.value = true;
  }

  onAdoptedDateChanged(DateTime adoptedDate) {
    _adoptedDate.value = adoptedDate;
    adoptedDateSelected.value = true;
  }

  onDiseaseListChanged(List<Disease> diseaseList) {
    _diseaseList = diseaseList;
    setSelectedDiseaseText(_diseaseList);
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
      onBirthDateChanged(pickedDate);
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
      onAdoptedDateChanged(pickedDate);
    } else {
      adoptedDateSelected.value = false;
    }
  }

  selectDisease() async {
    List<Disease> newDiseaseList = await Get.toNamed(
        Routes.SIGNUP_DISEASE_SEARCH,
        arguments: _diseaseList);
    onDiseaseListChanged(newDiseaseList);
  }

  setSelectedDiseaseText(List<Disease> diseaseInfo) {
    if (diseaseInfo.isNotEmpty) {
      diseaseSelected.value = true;
      if (diseaseInfo.length > 1) {
        diseaseText.value = diseaseInfo[0].name.substring(0, 10);
        diseaseSuffixText.value = ' 외 ${diseaseInfo.length - 1}개';
      } else {
        diseaseText.value = diseaseInfo[0].name.substring(0, 10);
        diseaseSuffixText.value = '';
      }
    } else {
      diseaseSelected.value = false;
    }
  }

  finishEdit() {
    Conimal newConimal = Conimal(
      conimalId: DateTime.now().millisecondsSinceEpoch.toString(),
      name: conimalName,
      adoptedDate: adoptedDate!,
      birthDate: birthDate!,
      gender: conimalGender.value!,
      species: conimalSpecies.value!,
      diseases: _diseaseList,
    );
    // _conimalRepository.editTempConimal(newConimal, conimalIndex);
    Get.back(result: newConimal);
  }
}
