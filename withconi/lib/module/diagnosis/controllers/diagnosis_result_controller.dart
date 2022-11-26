import 'package:withconi/data/model/diagnosis_result_response_dto.dart';

import '../../../data/enums/enum.dart';

import '../../../import_basic.dart';

class DiagnosisResultController extends GetxController {
  List<DiagnosisResultResponseDTO> diseaseResultList = [
    DiagnosisResultResponseDTO(
        diseaseId: '1',
        posibility: DiseasePosibility.high,
        diseaseName: '갑상선 기능항진증'),
    DiagnosisResultResponseDTO(
        diseaseId: '2',
        posibility: DiseasePosibility.middle,
        diseaseName: '갑상선 기능 저하증'),
    DiagnosisResultResponseDTO(
        diseaseId: '3',
        posibility: DiseasePosibility.low,
        diseaseName: '고양이의 간뇌병증'),
    // DiagnosisResultResponseDTO(
    //     diseaseId: '4',
    //     posibility: DiseasePosibility.low,
    //     diseaseName: '갑상선 기능항진증'),
  ];

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
  Future<void> onInit() async {
    super.onInit();
    // selectedSymptomItemList.assignAll(symptomGroup.symptomList);
    await Future.delayed(Duration(milliseconds: 4000), () {
      isLoading.value = false;
    });
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
