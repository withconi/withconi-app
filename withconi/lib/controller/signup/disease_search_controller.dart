import 'package:dartz/dartz.dart';
import 'package:withconi/controller/exception_controller.dart';
import 'package:withconi/controller/signup/shared_data/disease_data.dart';
import 'package:withconi/core/error_handling/exceptions.dart';
import 'package:withconi/data/model/disease.dart';
import 'package:withconi/data/repository/disease_repository.dart';
import '../../core/error_handling/failures.dart';
import '../../import_basic.dart';
import '../../ui/widgets/snackbar.dart';
import 'shared_data/conimal_data.dart';

class DiseaseSearchController extends GetxController
    with StateMixin<List<Disease>> {
  late RxString _disease;
  final DiseaseSearchRepository _diseaseRepository = DiseaseSearchRepository();
  TextEditingController diseaseTextController = TextEditingController();
  RxBool listLoaded = false.obs;
  String get disease => _disease.value;

  RxList<Disease> diseaseListSelected = RxList<Disease>();
  RxList<Disease> diseaseListSearched = RxList<Disease>();
  Set<Disease> resultSet = {};
  Set<Disease> selectedSet = {};
  Set<Disease> newResultSet = {};

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
    _disease = ''.obs;
    diseaseListSelected.assignAll(DiseaseData.to.selectedDiseases);
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

      newResultListEither.fold(
          (failure) => ExceptionController().mapFailureToDialog(failure),
          (list) => diseaseListSearched.assignAll(list));

      change(diseaseListSearched, status: RxStatus.success());
    }
  }

  onDiseaseClicked(Disease disease) {
    if (diseaseListSelected.contains(disease)) {
      var diseaseRemoveEither = _diseaseRepository.removeDisease(disease);
      diseaseRemoveEither.fold(
          (fail) => ExceptionController().mapFailureToSnackbar(fail),
          (success) => diseaseListSelected.remove(disease));
    } else {
      var diseaseAddEither = _diseaseRepository.addDisease(disease);
      diseaseAddEither.fold(
          (fail) => ExceptionController().mapFailureToSnackbar(fail),
          (success) => diseaseListSelected.add(disease));
    }
    print(diseaseListSelected);
  }

  // Either<Failure, bool> addDisease(Disease disease) {
  //   try {
  //     DiseaseData.to.addDisease(disease);
  //   } on MaxListException {
  //     return Left(MaxListFailure(message: '질병은 4개까지만 추가 가능합니다'));
  //   }
  // }

  // removeDisease(Disease disease) {
  //   DiseaseData.to.removeDisease(disease);
  // }

  saveDiseases() {
    Get.back(result: getDiseaseInfo());
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
