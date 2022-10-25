import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/auth_repository.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/ui/widgets/loading/loading_overlay.dart';
import '../../configs/constants/auth_variables.dart';
import '../../configs/constants/enum.dart';
import '../../configs/constants/regex.dart';
import '../../configs/constants/strings.dart';
import '../../core/error_handling/failures.dart';
import '../../data/model/conimal.dart';
import '../../data/model/disease.dart';
import '../../data/model/user.dart';
import '../../import_basic.dart';

class DiagnosisStep1Controller extends GetxController {
  Rxn<Gender> conimalGender = Rxn<Gender>();
  Rxn<Species> conimalSpecies = Rxn<Species>();
  RxBool isButtonValid = false.obs;
  RxBool birthDateSelected = false.obs;
  RxBool speciesSelected = false.obs;
  RxBool genderSelected = false.obs;
  RxBool adoptedDateSelected = false.obs;
  RxBool diseaseSelected = false.obs;
  final Rxn<DateTime> _birthDate = Rxn<DateTime>();
  DateTime? get birthDate => _birthDate.value;

  String get birthDateString => (_birthDate.value == null)
      ? ''
      : DateFormat('yyyy-MM-dd').format(_birthDate.value!);

  RxDouble progressPercent = (0.6 / 4).obs;

  RxBool isNeutered = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onGenderChanged(Gender gender) {
    conimalGender.value = gender;
    if (genderSelected.value == false) {
      genderSelected.value = true;
      progressPercent.value += (0.6 / 4);
    }
  }

  void onSpeicesChanged(Species species) {
    conimalSpecies.value = species;
    if (speciesSelected.value == false) {
      speciesSelected.value = true;
      progressPercent.value += (0.6 / 4);
    }
  }

  void onBirthDateChanged(DateTime birthDate) {
    _birthDate.value = birthDate;

    if (birthDateSelected.value == false) {
      birthDateSelected.value = true;
      progressPercent.value += (0.6 / 4);
    }
  }

  void onNeuteredChanged(bool neutered) {
    isNeutered.value = neutered;
  }

  bool validateButton() {
    if (birthDateSelected.value &&
        speciesSelected.value &&
        genderSelected.value) {
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
        initialDate: _birthDate.value ?? DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      onBirthDateChanged(pickedDate);
    } else {
      birthDateSelected.value = false;
      progressPercent.value -= (0.6 / 4);
    }
    // onBirthDateChanged(pickedDate);
  }
}
