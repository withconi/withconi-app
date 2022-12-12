import 'package:dartz/dartz.dart';
import 'package:withconi/data/model/dto/request_dto/conimal_request/create_conimal_request_dto.dart';
import 'package:withconi/global_widgets/snackbar.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import 'package:withconi/global_widgets/loading/loading_overlay.dart';
import 'package:withconi/module/ui_model/breed_ui_model.dart';
import 'package:withconi/module/ui_model/conimal_ui_model.dart';
import 'package:withconi/module/ui_model/disease_ui_model.dart';
import '../../../data/enums/enum.dart';
import '../../../core/values/constants/regex.dart';
import '../../../core/values/constants/strings.dart';
import '../../../core/error_handling/failures.dart';
import '../../../import_basic.dart';

class AddConimalController extends GetxController {
  RxBool isConimalAdded = false.obs;
  final RxString _conimalName = ''.obs;
  final RxBool isButtonValid = false.obs;
  Rx<ConimalUIModel> newConimal = ConimalUIModel(
    diseases: <DiseaseUIModel>[],
    breed: '',
    name: '',
  ).obs;
  RxBool showAddConimalButton = false.obs;

  // RxList<bool> genderSelectionList = [false, false].obs;
  RxnString conimalNameErrorText = RxnString();
  TextEditingController conimalNameTextController = TextEditingController();
  // String get _userId => AuthController.to.wcUser.value!.uid;

  @override
  void onReady() {
    super.onReady();
    ever(_conimalName, validateName);
    ever(newConimal, validateButton);
  }

  void onConimalNameChanged(String val) {
    _conimalName.value = val;
    newConimal.value = newConimal.value.copyWith(name: val);
  }

  void onGenderChanged(Gender gender) {
    newConimal.value = newConimal.value.copyWith(gender: gender);
    newConimal.refresh();
  }

  void onSpeicesChanged(Species species) {
    if (newConimal.value.species != species) {
      newConimal.value.breed = '';
    }
    newConimal.value.species = species;
    newConimal.refresh();
  }

  void onBirthDateChanged(DateTime birthDate) {
    newConimal.value = newConimal.value.copyWith(birthDate: birthDate);
    newConimal.refresh();
  }

  void onAdoptedDateChanged(DateTime adoptedDate) {
    newConimal.value = newConimal.value.copyWith(adoptedDate: adoptedDate);
    newConimal.refresh();
  }

  void onDiseaseListChanged(List<DiseaseUIModel> diseaseList) {
    newConimal.value.diseases.assignAll(diseaseList);
    newConimal.refresh();
  }

  void onNeutralizedChanged(bool neutralized) {
    newConimal.value.isNeutralized = !neutralized;
    newConimal.refresh();
  }

  void onBreedChanged(BreedUIModel breed) {
    newConimal.value.breed = breed.name;
    newConimal.refresh();
  }

  validateButton(ConimalUIModel _newConimal) {
    if (_newConimal.species != null &&
        _newConimal.name.isNotEmpty &&
        _newConimal.gender != null &&
        _newConimal.birthDate != null &&
        _newConimal.adoptedDate != null &&
        _newConimal.breed.isNotEmpty) {
      isButtonValid.value = true;
    } else {
      isButtonValid.value = false;
    }
  }

  validateName(String value) {
    final nameRegExp = Regex.nickName;
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
        initialDate: newConimal.value.birthDate ?? DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      onBirthDateChanged(pickedDate);
    }
  }

  selectAdoptedDate() async {
    Get.focusScope!.unfocus();
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: newConimal.value.adoptedDate ?? DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      onAdoptedDateChanged(pickedDate);
    }
  }

  goToSearchDiseasePage() async {
    Get.focusScope!.unfocus();
    List<DiseaseUIModel>? newDiseaseList = await Get.toNamed(
        Routes.DISEASE_SEARCH,
        arguments: newConimal.value.diseases) as List<DiseaseUIModel>?;
    if (newDiseaseList != null) {
      onDiseaseListChanged(newDiseaseList);
    }
  }

  goToSearchBreedPage() async {
    Get.focusScope!.unfocus();
    if (newConimal.value.species == null) {
      showCustomSnackbar(text: '고양이/강아지를 먼저 선택해주세요');
    } else {
      BreedUIModel? selectedBreed = await Get.toNamed(Routes.BREED_SEARCH,
          arguments: {'species': newConimal.value.species}) as BreedUIModel?;
      if (selectedBreed != null) {
        onBreedChanged(selectedBreed);
      }
    }
  }

  createConimal() {
    Get.back(result: newConimal.value);
  }
}
