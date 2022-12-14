import '../../../data/enums/enum.dart';
import '../../../data/model/dto/joined_dto/symptom.dart';
import '../../../data/repository/diagnosis_repository.dart';
import '../../../import_basic.dart';

class DiagnosisSymptomController extends GetxController {
  DiagnosisSymptomController(this._diagnosisRepository, this.symptom,
      this.symptomList, this.selectedSymptomList);
  // late SymptomGroup symptomGroup;
  final DiagnosisRepository _diagnosisRepository;
  late Symptom symptom;
  late List<String> symptomList;
  late List<String> selectedSymptomList;

  RxList<String> selectedSymptomItemList = <String>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    selectedSymptomItemList.assignAll(selectedSymptomList);
    isLoading.value = false;
  }

  onSymptomItemTap(String symptomItem) {
    if (selectedSymptomItemList.contains(symptomItem)) {
      selectedSymptomItemList.remove(symptomItem);
    } else {
      selectedSymptomItemList.add(symptomItem);
    }
  }

  getBack() {
    Get.back(
        result: SymptomGroup(
            symptomType: symptom,
            symptomList: selectedSymptomItemList.toList()));
  }
}
