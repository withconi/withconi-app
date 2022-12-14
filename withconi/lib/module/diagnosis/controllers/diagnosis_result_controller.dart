import 'package:withconi/core/error_handling/failure_ui_interpreter.dart';
import 'package:withconi/data/model/diagnosis_result_response_dto.dart';

import '../../../data/enums/enum.dart';

import '../../../data/repository/diagnosis_repository.dart';
import '../../../import_basic.dart';

class DiagnosisResultController extends GetxController {
  DiagnosisResultController(this._diagnosisRepository);
  final DiagnosisRepository _diagnosisRepository;
  late List<DiagnosisResultResponseDTO> diseaseResultList;

  RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // selectedSymptomItemList.assignAll(symptomGroup.symptomList);
    await _getDiagnosisResult();
    await Future.delayed(const Duration(milliseconds: 1000), () {
      isLoading.value = false;
    });
  }

  _getDiagnosisResult() async {
    var resultEither = await _diagnosisRepository.getDiagnosisResult();
    var resultList = resultEither.fold((failure) {
      FailureInterpreter().mapFailureToDialog(failure, '_getDiagnosisResult');
      return null;
    }, (result) => result.list);

    if (resultList != null) {
      diseaseResultList = resultList;
    }
  }

  onDiagnosisResultItemTap(DiagnosisResultResponseDTO resultItem) {
    Get.toNamed(Routes.DICTIONARY_DETAIL,
        arguments: {'diseaseId': resultItem.diseaseId});
  }

  @override
  void onReady() {
    super.onReady();
  }

  // onSymptomItemTap(String symptomItem) {
  //   if (selectedSymptomItemList.contains(symptomItem)) {
  //     selectedSymptomItemList.remove(symptomItem);
  //   } else {
  //     selectedSymptomItemList.add(symptomItem);
  //   }
  // }

  // getBack() {
  //   Get.back(result: selectedSymptomItemList.toList());
  // }
}
