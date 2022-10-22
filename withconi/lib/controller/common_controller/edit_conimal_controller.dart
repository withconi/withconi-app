import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import '../../configs/constants/auth_variables.dart';
import '../../configs/constants/enum.dart';
import '../../configs/constants/regex.dart';
import '../../configs/constants/strings.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../data/model/disease.dart';
import '../../import_basic.dart';
import '../../ui/widgets/dialog/selection_dialog.dart';
import '../../ui/widgets/loading/loading_overlay.dart';
import '../ui_interpreter/failure_ui_interpreter.dart';

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
    Get.focusScope!.unfocus();
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
    Get.focusScope!.unfocus();
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
    Get.focusScope!.unfocus();
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

  // finishEdit() {
  //   Conimal editedConimal = Conimal(
  //       conimalId: _conimal.conimalId,
  //       name: conimalName,
  //       adoptedDate: adoptedDate!,
  //       birthDate: birthDate!,
  //       gender: conimalGender.value!,
  //       species: conimalSpecies.value!,
  //       diseases: _diseaseList,
  //       userId: AuthController.to.wcUser.value!.uid);

  //   Get.back(result: editedConimal);
  // }

  Future<void> getBack() async {
    bool isConfirmed = await showSelectionDialog(
        cancleText: '계속하기',
        confirmText: '그만하기',
        title: '코니멀 수정을 그만할까요?',
        subtitle: '변경된 정보는 모두 사라집니다');
    if (isConfirmed) {
      Get.back();
    }
  }

  Future<void> onEditButtonTap() async {
    bool isConfirmed = await showSelectionDialog(
        cancleText: '아니요',
        confirmText: '네',
        title: '정보를 수정할까요?',
        subtitle: '변경된 코니멀 정보를 수정합니다');

    if (isConfirmed) {
      editConimalDB();
    }
  }

  Future<void> editConimalDB() async {
    Conimal editedConimal = Conimal(
        conimalId: _conimal.conimalId,
        name: conimalName,
        adoptedDate: adoptedDate!,
        birthDate: birthDate!,
        gender: conimalGender.value!,
        species: conimalSpecies.value!,
        diseases: _diseaseList,
        userId: AuthController.to.wcUser.value!.uid);

    Either<Failure, bool> addResultEither = await showLoading(
        () => _conimalRepository.updateConimal(editConimal: editedConimal));

    addResultEither.fold(
        (fail) =>
            FailureInterpreter().mapFailureToDialog(fail, 'updateConimalList'),
        (success) {
      AuthController.to.refreshWcUserInfo();
      Get.back(result: editedConimal);
    });
  }
}
