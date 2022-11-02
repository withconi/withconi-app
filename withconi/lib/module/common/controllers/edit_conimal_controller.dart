import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:withconi/module/auth/auth_controller.dart';
import 'package:withconi/data/repository/conimal_repository.dart';
import '../../../core/values/constants/auth_variables.dart';
import '../../../data/enums/enum.dart';
import '../../../core/values/constants/regex.dart';
import '../../../core/values/constants/strings.dart';
import '../../../core/error_handling/failures.dart';
import '../../../data/model/conimal.dart';
import '../../../data/model/disease.dart';
import '../../../import_basic.dart';
import '../../../global_widgets/dialog/selection_dialog.dart';
import '../../../global_widgets/loading/loading_overlay.dart';
import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../../ui_model/conimal_ui_model.dart';

class EditConimalController extends GetxController {
  final ConimalRepository _conimalRepository = Get.put(ConimalRepository());
  RxBool isConimalAdded = false.obs;
  final RxString _conimalName = ''.obs;
  final RxBool isButtonValid = false.obs;
  late Rx<ConimalUIModel> editConimal;
  RxBool showAddConimalButton = false.obs;
  RxList<bool> genderSelectionList = [false, false].obs;
  RxnString conimalNameErrorText = RxnString();
  TextEditingController conimalNameTextController = TextEditingController();
  String get _userId => AuthController.to.wcUser.value!.uid;
  RxBool dataInited = false.obs;

  @override
  void onInit() {
    super.onInit();

    editConimal = Rx<ConimalUIModel>(Get.arguments as ConimalUIModel);
    dataInited.value = true;
  }

  @override
  void onReady() {
    super.onReady();
    ever(_conimalName, validateName);
    ever(editConimal, validateButton);
  }

  void onConimalNameChanged(String val) {
    _conimalName.value = val;
  }

  void onGenderChanged(Gender gender) {
    editConimal.value.gender = gender;
    editConimal.refresh();
  }

  void onSpeicesChanged(Species species) {
    editConimal.value.species = species;
    editConimal.refresh();
  }

  void onBirthDateChanged(DateTime birthDate) {
    editConimal.value.birthDate = birthDate;
    editConimal.refresh();
  }

  void onAdoptedDateChanged(DateTime adoptedDate) {
    editConimal.value.adoptedDate = adoptedDate;
    editConimal.refresh();
  }

  void onDiseaseListChanged(List<Disease> diseaseList) {
    editConimal.value.diseases.assignAll(diseaseList);
    editConimal.refresh();
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
    List<Disease>? newDiseaseList = await Get.toNamed(Routes.DISEASE_ADD,
        arguments: editConimal.value.diseases) as List<Disease>?;
    if (newDiseaseList != null) {
      onDiseaseListChanged(newDiseaseList);
    }
  }

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
    Conimal editedConimal = editConimal.value.toDTO();

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
