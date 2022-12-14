import 'package:withconi/data/model/dto/joined_dto/symptom.dart';
import 'package:withconi/module/community/controllers/custom_state_mixin.dart';

import '../../../core/error_handling/failure_ui_interpreter.dart';
import '../../../data/enums/enum.dart';

import '../../../data/repository/diagnosis_repository.dart';
import '../../../import_basic.dart';

class DiagnosisStep2Controller extends GetxController {
  DiagnosisStep2Controller(this._diagnosisRepository);
  final DiagnosisRepository _diagnosisRepository;
  RxDouble progressPercents = 0.6.obs;
  RxList<SymptomGroup> selectedSymptomGroupList = <SymptomGroup>[].obs;
  RxBool isButtonValid = false.obs;

  RxList<SymptomGroup> symptomGroupList = RxList<SymptomGroup>();

  @override
  Future<void> onInit() async {
    super.onInit();
    await _getSymptomList();
  }

  _getSymptomList() async {
    var symptomEither = await _diagnosisRepository.getSymptomList();
    var symptomGroupResult = symptomEither.fold(
        (failure) =>
            FailureInterpreter().mapFailureToDialog(failure, 'getSymptomList'),
        (result) => result.symptomGroupList);

    if (symptomGroupResult != null) {
      symptomGroupList.assignAll(symptomGroupResult);
      symptomGroupList.refresh();
    }
  }

  @override
  void onReady() {
    super.onReady();

    ever(selectedSymptomGroupList, validateButton);
  }

  goToSymptomSelectionPage(Symptom selectedSymptom) async {
    SymptomGroup? symptomResult =
        await Get.toNamed(Routes.DIAGNOSIS_SYMPTOM, arguments: {
      'symptom': selectedSymptom,
      'symptomList': symptomGroupList
          .firstWhere((element) => element.symptomType == selectedSymptom)
          .symptomList
          .toList(),
      'selectedSymptomList': selectedSymptomGroupList
              .firstWhereOrNull(
                  (element) => element.symptomType == selectedSymptom)
              ?.symptomList
              .toList() ??
          []
    }) as SymptomGroup?;

    if (symptomResult == null) {
      return;
    }

    if (symptomResult.symptomList.isEmpty) {
      selectedSymptomGroupList
          .removeWhere((element) => element.symptomType == selectedSymptom);
    } else {
      // if (selectedSymptomGroupList
      //     .any((element) => element.symptomType == selectedSymptom)) {
      selectedSymptomGroupList.removeWhere(
          (element) => element.symptomType == symptomResult.symptomType);
      selectedSymptomGroupList.add(symptomResult);
      // } else {
      //   selectedSymptomGroupList.add(symptomResult);
      // }
    }

    if (selectedSymptomGroupList.isEmpty) {
      progressPercents.value = 0.6;
      return;
    }

    if (selectedSymptomGroupList.length <= 1) {
      progressPercents.value = 0.8;
    } else if (selectedSymptomGroupList.length > 1) {
      progressPercents.value = 1;
    }
  }

  void validateButton(list) {
    if (list.isNotEmpty) {
      isButtonValid.value = true;
    } else {
      isButtonValid.value = false;
    }
  }

  goToDiagnosisResultPage() {
    _diagnosisRepository.storeSymptomList(selectedSymptomGroupList.toList());
    Get.offNamedUntil(
        Routes.DIAGNOSIS_RESULT, ModalRoute.withName(Routes.DIAGNOSIS_MAIN));
  }
}
