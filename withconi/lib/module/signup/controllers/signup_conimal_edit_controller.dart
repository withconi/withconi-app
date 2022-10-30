import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:withconi/module/signup/signup_data_brain.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import '../../../data/enums/enum.dart';
import '../../../core/values/constants/regex.dart';
import '../../../core/values/constants/strings.dart';
import '../../../core/error_handling/failures.dart';
import '../../../data/model/conimal.dart';
import '../../../data/model/disease.dart';
import '../../../import_basic.dart';

class SignupConimalEditController extends GetxController {
  // final ConimalRepository _signUpRepository = ConimalRepository.to;
  // final SignupRepository _signUpRepository = Get.find();
  final SignUpDataBrain _signUpDataManager = Get.find();
  late int conimalIndex;
  RxString controllerTag = ''.obs;
  late Conimal thisConimal;
  RxString _userName = ''.obs;
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
    conimalIndex = Get.arguments['index'];
    _getConimalToEdit(conimalIndex);
  }

  @override
  void onReady() {
    super.onReady();

    _userName.value = _signUpDataManager.name;

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
    List<Disease>? newDiseaseList =
        await Get.toNamed(Routes.DISEASE_ADD, arguments: _diseaseList)
            as List<Disease>?;
    if (newDiseaseList != null) {
      onDiseaseListChanged(newDiseaseList);
    }
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

  editConimal() {
    Conimal editedConimal = thisConimal.copyWith(
      conimalId: DateTime.now().millisecondsSinceEpoch.toString(),
      name: conimalName,
      adoptedDate: adoptedDate!,
      birthDate: birthDate!,
      gender: conimalGender.value!,
      species: conimalSpecies.value!,
      diseases: _diseaseList,
    );

    _signUpDataManager.editConimal(editedConimal, conimalIndex);

    Get.offNamedUntil(Routes.SIGNUP_CONIMAL_STEP2,
        ModalRoute.withName(Routes.SIGNUP_PROFILE));
  }

  _getConimalToEdit(int conimalIndex) {
    Either<Failure, Conimal> conimalEither =
        _signUpDataManager.getConimalInfo(conimalIndex);
    conimalEither.fold(
        (fail) => FailureInterpreter()
            .mapFailureToSnackbar(fail, StackTrace.current.toString()),
        (conimal) => _setConimalInfo(conimal));
  }

  _setConimalInfo(Conimal editableConimal) {
    thisConimal = editableConimal;
    onSpeicesChanged(editableConimal.species);
    onBirthDateChanged(editableConimal.birthDate);
    onAdoptedDateChanged(editableConimal.adoptedDate);
    onDiseaseListChanged(editableConimal.diseases);
    onConimalNameChanged(editableConimal.name);
    onGenderChanged(editableConimal.gender);
    conimalNameTextController.text = editableConimal.name;
    if (editableConimal.gender == Gender.female) {
      genderSelectionList[0] = true;
      genderSelectionList[1] = false;
    } else {
      genderSelectionList[0] = false;
      genderSelectionList[1] = true;
    }
  }
}
