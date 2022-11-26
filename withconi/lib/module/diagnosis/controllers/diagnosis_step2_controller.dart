import 'package:withconi/data/model/dto/joined_dto/symptom.dart';

import '../../../data/enums/enum.dart';

import '../../../import_basic.dart';

class DiagnosisStep2Controller extends GetxController {
  RxDouble progressPercents = 0.6.obs;
  RxList<SymptomGroup> selectedSymptomGroupList = <SymptomGroup>[].obs;
  RxBool isButtonValid = false.obs;

  RxList<SymptomGroup> symptomGroups = Symptom.values
      .map((e) => SymptomGroup(symptomType: e, symptomList: []))
      .toList()
      .obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    ever(selectedSymptomGroupList, validateButton);
  }

  goToSymptomSelectionPage(Symptom selectedSymptom) async {
    // selectedSymptomGroupList.removeAt(0);
    // selectedSymptomGroupList.insert(
    //     0, selectedSymptomGroupList[0].copyWith(symptomType: selectedSymptom));

    List<String>? symptomResult = await Get.toNamed(Routes.DIAGNOSIS_SYMPTOM,
            arguments: selectedSymptomGroupList.firstWhereOrNull(
                    (element) => element.symptomType == selectedSymptom) ??
                SymptomGroup(symptomType: selectedSymptom, symptomList: []))
        as List<String>?;

    if (symptomResult == null) {
      return;
    }

    if (symptomResult.isEmpty) {
      selectedSymptomGroupList
          .removeWhere((element) => element.symptomType == selectedSymptom);
    } else {
      if (selectedSymptomGroupList
          .any((element) => element.symptomType == selectedSymptom)) {
        for (SymptomGroup element in selectedSymptomGroupList) {
          if (element.symptomType == selectedSymptom) {
            int index = selectedSymptomGroupList.indexOf(element);
            SymptomGroup newGroup =
                element.copyWith(symptomList: symptomResult);
            selectedSymptomGroupList.replaceRange(index, index + 1, [newGroup]);
            break;
          }
        }
      } else {
        selectedSymptomGroupList.add(SymptomGroup(
            symptomType: selectedSymptom, symptomList: symptomResult));
      }
    }
  }

  void validateButton(list) {
    if (list.isNotEmpty) {
      isButtonValid.value = true;
    } else {
      isButtonValid.value = false;
    }
  }
}
