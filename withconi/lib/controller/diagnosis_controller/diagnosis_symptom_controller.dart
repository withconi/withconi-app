import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:withconi/controller/auth_controller.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/data/model/symptom.dart';
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