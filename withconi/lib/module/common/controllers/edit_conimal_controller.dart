import 'package:withconi/module/ui_model/disease_ui_model.dart';
import '../../../data/enums/enum.dart';
import '../../../core/values/constants/regex.dart';
import '../../../core/values/constants/strings.dart';
import '../../../global_widgets/snackbar.dart';
import '../../../import_basic.dart';
import '../../ui_model/breed_ui_model.dart';
import '../../ui_model/conimal_ui_model.dart';

class EditConimalController extends GetxController {
  EditConimalController(this._editConimal);
  RxBool isConimalAdded = false.obs;
  final RxString _conimalNameText = ''.obs;
  final RxBool isButtonValid = false.obs;
  late Rx<ConimalUIModel> editConimal;
  late final ConimalUIModel _editConimal;
  RxBool showAddConimalButton = false.obs;
  RxList<bool> genderSelectionList = [false, false].obs;
  RxnString conimalNameErrorText = RxnString();
  TextEditingController conimalNameTextController = TextEditingController();
  RxBool dataInited = false.obs;
  RxList<DiseaseUIModel> selectedDiseaseList = RxList<DiseaseUIModel>();

  @override
  void onInit() {
    super.onInit();

    editConimal = Rx<ConimalUIModel>((_editConimal).copyWith());
    conimalNameTextController.text = editConimal.value.name;
    selectedDiseaseList.assignAll(editConimal.value.diseases.toList());
    dataInited.value = true;
  }

  @override
  void onReady() {
    super.onReady();
    ever(_conimalNameText, validateName);
    ever(editConimal, validateButton);
  }

  // @override
  // void onClose() {
  //   super.onClose();
  //   editConimal.close();
  //   showAddConimalButton.close();
  //   genderSelectionList.close();
  //   conimalNameErrorText.close();
  //   dataInited.close();
  //   _conimalName.close();
  //   isConimalAdded.close();
  //   conimalNameErrorText.close();
  // }

  void onConimalNameChanged(String val) {
    _conimalNameText.value = val;
  }

  void onNeutralizedChanged(bool val) {
    editConimal.value = editConimal.value.copyWith(isNeutralized: !val);
    editConimal.refresh();
  }

  void onGenderChanged(Gender gender) {
    editConimal.value = editConimal.value.copyWith(gender: gender);
    editConimal.refresh();
  }

  void onSpeicesChanged(Species species) {
    if (editConimal.value.species != species) {
      editConimal.value.breed = '';
    }
    editConimal.value.species = species;
    editConimal.refresh();
  }

  void onBirthDateChanged(DateTime birthDate) {
    editConimal.value = editConimal.value.copyWith(birthDate: birthDate);
    editConimal.refresh();
  }

  void onAdoptedDateChanged(DateTime adoptedDate) {
    editConimal.value = editConimal.value.copyWith(adoptedDate: adoptedDate);
    editConimal.refresh();
  }

  void onDiseaseListChanged(List<DiseaseUIModel> diseaseList) {
    selectedDiseaseList.assignAll(diseaseList);
    editConimal.value = editConimal.value.copyWith(diseases: diseaseList);
    editConimal.refresh();
    selectedDiseaseList.refresh();
  }

  void onBreedChanged(String breed) {
    editConimal.value.breed = breed;
    editConimal.refresh();
  }

  void onDeleteDiseaseItem(int index) {
    selectedDiseaseList.removeAt(index);
    onDiseaseListChanged(selectedDiseaseList.toList());
  }

  validateButton(ConimalUIModel _newConimal) {
    if (_newConimal.species != null &&
        conimalNameErrorText.value == null &&
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
    // conimalNameErrorText.value = null;
    if (!nameRegExp.hasMatch(value)) {
      conimalNameErrorText.value = Strings.validator.name;
      editConimal.value = editConimal.value.copyWith(name: '');
    } else {
      conimalNameErrorText.value = null;
      editConimal.value = editConimal.value.copyWith(name: value);
    }
    editConimal.refresh();
  }

  selectBirthDate() async {
    Get.focusScope!.unfocus();
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: editConimal.value.birthDate ?? DateTime.now(),
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
        initialDate: editConimal.value.adoptedDate ?? DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      onAdoptedDateChanged(pickedDate);
    }
  }

  selectDisease() async {
    Get.focusScope!.unfocus();
    List<DiseaseUIModel>? newDiseaseList = await Get.toNamed(
        Routes.DISEASE_SEARCH,
        arguments: editConimal.value.diseases) as List<DiseaseUIModel>?;
    if (newDiseaseList != null) {
      onDiseaseListChanged(newDiseaseList.toList());
    }
  }

  goToSearchBreedPage() async {
    Get.focusScope!.unfocus();

    if (editConimal.value.species == null) {
      showCustomSnackbar(text: '고양이/강아지를 먼저 선택해주세요');
    } else {
      BreedUIModel? selectedBreed = await Get.toNamed(Routes.BREED_SEARCH,
          arguments: {'species': editConimal.value.species}) as BreedUIModel?;
      if (selectedBreed != null) {
        onBreedChanged(selectedBreed.name);
      }
    }
  }

  getBack() {
    Get.focusScope!.unfocus();
    Get.back();
  }

  onEditButtonTap() {
    Get.focusScope!.unfocus();
    Get.back(result: editConimal.value);
  }

  // Future<void> editConimalDB() async {
  //   // Either<Failure, bool> addResultEither = await showLoading(
  //   //     () => _conimalRepository.updateConimal(editConimal: editConimal.value));

  //   // addResultEither.fold(
  //   //     (fail) =>
  //   //         FailureInterpreter().mapFailureToDialog(fail, 'updateConimalList'),
  //   //     (success) {
  //   //   AuthController.to.refreshWcUserInfo();
  //   //   Get.back(result: editConimal.value);
  //   // });
  //   Get.back(result: editConimal.value);
  // }
}
