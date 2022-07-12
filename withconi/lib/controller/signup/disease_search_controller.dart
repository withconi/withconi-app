import 'package:dartz/dartz.dart';
import 'package:withconi/controller/ui_interpreter/failure_ui_interpreter.dart';
import 'package:withconi/core/error_handling/error_message_object.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/data/repository/disease_repository.dart';
import '../../core/error_handling/failures.dart';
import '../../import_basic.dart';

class DiseaseSearchController extends GetxController
    with StateMixin<List<Disease>> {
  RxString _disease = ''.obs;
  final DiseaseRepository _diseaseRepository = DiseaseRepository();
  TextEditingController diseaseTextController = TextEditingController();
  RxBool listLoaded = false.obs;
  String get disease => _disease.value;
  Rxn<Failure> failure = Rxn<Failure>();
  RxList<Disease> diseaseListSelected = RxList<Disease>();
  RxList<Disease> diseaseListSearched = RxList<Disease>();
  Set<Disease> resultSet = {};
  Set<Disease> selectedSet = {};
  Set<Disease> newResultSet = {};

  @override
  void onInit() {
    super.onInit();
    diseaseListSelected.assignAll(Get.arguments);
    change(null, status: RxStatus.empty());
  }

  @override
  void onReady() {
    super.onReady();

    debounce(_disease, searchNewDiseaseList, time: Duration(milliseconds: 200));
  }

  void onDiseaseChanged(String val) {
    _disease.value = val;
    if (val.isEmpty) clearResult();
  }

  void clearResult() {
    diseaseTextController.clear();
    diseaseListSearched.clear();
    change(null, status: RxStatus.empty());
  }

  searchNewDiseaseList(String val) async {
    if (val.isEmpty) {
      clearResult();
      return;
    } else {
      change(null, status: RxStatus.loading());

      Either<Failure, List<Disease>> newResultListEither =
          await _diseaseRepository.getDiseaseList(diseaseName: val);

      newResultListEither.fold((failure) {
        ErrorMessage errorMessage =
            ErrorMessage.mapFailureToErrorMessage(failure: failure);
        change(null, status: RxStatus.error(errorMessage.message));
      }, (list) {
        diseaseListSearched.assignAll(list);
        change(diseaseListSearched, status: RxStatus.success());
      });
    }
  }

  onDiseaseClicked(Disease disease) {
    if (diseaseListSelected.contains(disease)) {
      diseaseListSelected.remove(disease);
    } else {
      if (diseaseListSelected.length < 4) {
        diseaseListSelected.add(disease);
      } else {
        FailureInterpreter().mapFailureToDialog(
            Failure.maxDiseaseFailure(), 'onDiseaseClicked');
      }
    }
  }

  saveDiseases() {
    Get.back(result: diseaseListSelected.toList());
  }

  getDiseaseInfo() {
    List<String> diseaseNameList = diseaseListSelected.map((element) {
      return element.name;
    }).toList();

    Map<String, dynamic> diseaseInfo = {
      'diseaseNameList': diseaseNameList,
      'diseaseNum': diseaseNameList.length
    };
    return diseaseInfo;
  }
}
