import '../../../data/model/dto/joined_dto/symptom.dart';
import '../../../import_basic.dart';

class DiagnosisSymptomController extends GetxController {
  late SymptomGroup symptomGroup;
  List<String> symptomItemList = [
    '절뚝거림',
    '힘없음',
    '피부종창',
    '머리/얼굴/귀/턱/코 종창',
    '결막부음',
    '무감각증',
    '혀 돌출',
    '토끼뜀',
    '뒷다리 만곡증',
    '앞다리 만곡증',
    '귀 분비물 및 악취'
  ];
  RxList<String> selectedSymptomItemList = <String>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    symptomGroup = Get.arguments as SymptomGroup;
    selectedSymptomItemList.assignAll(symptomGroup.symptomList);
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  onSymptomItemTap(String symptomItem) {
    if (selectedSymptomItemList.contains(symptomItem)) {
      selectedSymptomItemList.remove(symptomItem);
    } else {
      selectedSymptomItemList.add(symptomItem);
    }
  }

  getBack() {
    Get.back(result: selectedSymptomItemList.toList());
  }
}
