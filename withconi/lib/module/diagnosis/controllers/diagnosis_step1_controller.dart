import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/app_setting_repository.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import '../../../core/values/constants/auth_variables.dart';
import '../../../data/enums/enum.dart';

import '../../../data/repository/diagnosis_repository.dart';
import '../../../import_basic.dart';
import '../../ui_model/breed_ui_model.dart';

class DiagnosisStep1Controller extends GetxController {
  DiagnosisStep1Controller(this._diagnosisRepository);
  final DiagnosisRepository _diagnosisRepository;
  Rxn<Gender> selectedGender = Rxn<Gender>();
  Rxn<Species> selectedSpecies = Rxn<Species>();
  RxBool isButtonValid = false.obs;
  RxnString selectedBreed = RxnString();
  final Rxn<DateTime> _selectedBirthDate = Rxn<DateTime>();
  DateTime? get birthDate => _selectedBirthDate.value;
  String get birthDateString => (_selectedBirthDate.value == null)
      ? ''
      : DateFormat('yyyy-MM-dd').format(_selectedBirthDate.value!);

  RxDouble progressPercent = (0.6 / 4).obs;

  RxBool isNeutered = false.obs;

  // @override
  // onInit() async {
  //   super.onInit();
  // }

  void onGenderChanged(Gender gender) {
    selectedGender.value = gender;
    if (selectedGender.value != null) {
      progressPercent.value += (0.6 / 4);
    }
  }

  void onSpeicesChanged(Species species) {
    selectedSpecies.value = species;
    if (selectedSpecies.value != null) {
      progressPercent.value += (0.6 / 4);
    }
  }

  void onBirthDateChanged(DateTime birthDate) {
    _selectedBirthDate.value = birthDate;

    if (_selectedBirthDate.value != null) {
      progressPercent.value += (0.6 / 4);
    }
  }

  void onNeuteredChanged(bool neutered) {
    isNeutered.value = neutered;
  }

  void onBreedChanged(String breed) {
    selectedBreed.value = breed;
    if (selectedBreed.value != null) {
      progressPercent.value += (0.6 / 4);
    }
  }

  bool validateButton() {
    if (selectedBreed.value != null &&
        selectedGender.value != null &&
        selectedSpecies.value != null &&
        _selectedBirthDate.value != null) {
      isButtonValid.value = true;
    } else {
      isButtonValid.value = false;
    }
    return isButtonValid.value;
  }

  selectBirthDate() async {
    Get.focusScope!.unfocus();
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: _selectedBirthDate.value ?? DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      onBirthDateChanged(pickedDate);
    } else {
      progressPercent.value -= (0.6 / 4);
    }
    // onBirthDateChanged(pickedDate);
  }

  goToSearchBreedPage() async {
    Get.focusScope!.unfocus();

    BreedUIModel? selectedBreed = await Get.toNamed(Routes.BREED_SEARCH,
        arguments: {'species': selectedSpecies.value}) as BreedUIModel?;
    if (selectedBreed != null) {
      onBreedChanged(selectedBreed.name);
    }
  }

  goToNextStep() {
    _diagnosisRepository.storeConimalInfo(
        selectedSpecies.value!,
        selectedGender.value!,
        isNeutered.value,
        selectedBreed.value!,
        birthDate!);
    Get.toNamed(Routes.DIAGNOSIS_STEP2);
  }
}
